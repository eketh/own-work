library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;

use work.sinelib.all;
use work.freqlib.all;

-- 4 XI 2012 dodano dlugosc trwania kazdego dzwieku (wyrazona w ilosci okresow).
--Maximum Frequency: 57.159MHz

entity QuantAngle is
port(
clk: in std_logic;
reset: in std_logic;
sine_out: out std_logic_vector(10 downto 0);
tune_in: in std_logic_vector (3 downto 0);
tune_out: out std_logic_vector (3 downto 0)
);
end QuantAngle;

architecture QuantAngle_a of QuantAngle is

signal prescaler: std_logic_vector(2 downto 0);
signal a_tune_in: std_logic_vector(3 downto 0);
signal aa_tune_in: std_logic_vector(3 downto 0);
signal tune_played: std_logic_vector (3 downto 0);
signal passing    :integer:=0; 
signal a_Quarter  : std_logic_vector (1 downto 0);
signal aa_Quarter : std_logic_vector (1 downto 0);

--arytmetyka k¹tów
--zapis (czêœæ ca³kowita)+(czêœæ u³amkowa)
signal Quarter: std_logic_vector(1 downto 0);
signal TunePeriod: std_logic_vector(31 downto 0);
signal Angle: std_logic_vector (31 downto 0);-- 3+29
signal Angle_mcl: std_logic_vector (31 downto 0);--3+29
signal Angle_mcl_cut: std_logic_vector (31 downto 0);--ten
signal PiAngle: std_logic_vector (63 downto 0);--6+58
signal PiAngle_cut: std_logic_vector (31 downto 0);


--arytmetyka "wchodz¹ca" do obliczania Maclaurina
-- zapis j/w.
signal sine_angle: std_logic_vector(8 downto 0);
signal mclaurin_x: std_logic_vector (8 downto 0);--1+8
signal mclaurin_after_x: std_logic_vector (8 downto 0);--1+8
signal mclaurin_x2: std_logic_vector (17 downto 0);--2+16
signal mclaurin_x_120: std_logic_vector (15 downto 0);--1+15
signal mclaurin_x_6: std_logic_vector (15 downto 0);--1+15
signal mclaurin_x5_half: std_logic_vector (33 downto 0);

signal mclaurin_x3: std_logic_vector (33 downto 0);--3 + 31
signal mclaurin_x5:std_logic_vector (51 downto 0);-- forma 5 + 47
signal mclaurin_half: std_logic_vector (8 downto 0);
signal mclaurin_output: std_logic_vector (8 downto 0);



begin

mux: process (clk, reset, tune_played)
begin
if (reset='0') then
  TunePeriod<=(others=>'0');
  tune_played<="0000";
elsif (clk'event and clk='1') then
  tune_played<=tune_in;
  if (tune_played="0001") then
    TunePeriod<=Tune_C1;
  elsif(tune_played="0010") then   
    TunePeriod<=Tune_D1;
  elsif(tune_played="0011") then
    TunePeriod<=Tune_E1;
  elsif(tune_played="0100") then  
    TunePeriod<=Tune_F1;
  elsif(tune_played="0101") then	   
    TunePeriod<=Tune_G1;
  elsif(tune_played="00110") then	 
    TunePeriod<=Tune_A1;
  elsif(tune_played="0111") then
    TunePeriod<=Tune_H1;
  elsif(tune_played="1000") then	 
    TunePeriod<=Tune_C2;
  elsif(tune_played="0000") then
	 TunePeriod<=(others=>'0');
    end if;
end if;
end process mux;

tune_out<=tune_played;

SQuarter: process (clk, reset,PiAngle_cut)
begin
if (reset='0') then
  Quarter<="00";
  Angle_mcl<=(others=>'0');
  Angle_mcl_cut<=(others=>'0');
  sine_out<= (others=>'0');
  ---
  Angle<=(others=>'0');
  PiAngle<=(others=>'0');
  PiAngle_cut<=(others=>'0');
elsif (clk'event and clk='1') then
    if (tune_played/="0000") then
    Angle<=Angle + TunePeriod;-- 3+29
    if (Angle>="10000000000000000000000000000000") then
      Angle<=(others=>'0');
    end if;
    PiAngle<= Angle * two_pi; -- Angle jest 1+31, two_pi jest 3+29 => wynik jest 4 + 60
    PiAngle_cut<= PiAngle (62 downto 31);--ekstrakcja istotnej czêœci wyniku
  else
    Angle<=(others=>'0');
  end if;
    if (PiAngle_cut<=half_pi) then
      Quarter<="00";
	    Angle_mcl_cut<=PiAngle_cut;
	    sine_out<= "10000000000" + ("00" & mclaurin_output);
    elsif ((PiAngle_cut>=half_pi) and (PiAngle_cut<pi)) then
      Quarter<="01";
	   Angle_mcl_cut<=pi-PiAngle_cut;
	   sine_out<= "10000000000" + ("00" & mclaurin_output);
    elsif ((PiAngle_cut>=pi) and (PiAngle_cut<(half_pi+pi))) then
      Quarter<="10";
	    Angle_mcl_cut<=(PiAngle_cut-pi);
	    sine_out<= "10000000000" - ("00" & mclaurin_output);
    elsif (PiAngle_cut<=two_pi) then
      Quarter<="11";
	   Angle_mcl_cut<=(two_pi - PiAngle_cut);
	   sine_out<= "10000000000" - ("00" & mclaurin_output);
    else
     Quarter<="00";
	  Angle_mcl_cut<=(others=>'0');
	  sine_out<= "10000000000";
    end if;
end if;
end process SQuarter;


MATH_McLaurin: process (clk, reset)
begin

if (reset='0') then
  sine_angle <=(others=>'0');
  mclaurin_x<= (others=>'0');
  mclaurin_after_x<= (others=>'0');
  mclaurin_x2<= (others=>'0');
  mclaurin_x_120<= (others=>'0');
  mclaurin_x_6<= (others=>'0');

  mclaurin_half<=(others=>'0');
  mclaurin_x5_half<=(others=>'0');
  
  mclaurin_x3<= (others=>'0');
  mclaurin_x5<= (others=>'0');
  mclaurin_output<= (others=>'0');
  
elsif (clk'event and clk='1') then

  if (tune_played/="0000") then

--czesci pomocnicze i x
    sine_angle <=Angle_mcl_cut(29 downto 21);
    mclaurin_x<= sine_angle; -- x: 9 bitow, 1+8
    mclaurin_x2<=sine_angle * sine_angle;
    mclaurin_x_6<=sine_angle * one_sixth;--sinelib
    mclaurin_x_120<=sine_angle * one_120th;--sinelib

--krok pierwszy
    mclaurin_after_x<=mclaurin_x;
    mclaurin_x3<=mclaurin_x_6*mclaurin_x2;
    mclaurin_x5_half<=mclaurin_x2 * mclaurin_x_120; 
--krok drugi
    mclaurin_half<=mclaurin_after_x - mclaurin_x3(31 downto 23);
    mclaurin_x5<=mclaurin_x2 * mclaurin_x5_half;
--krok trzeci
    mclaurin_output<= mclaurin_half + mclaurin_x5(47 downto 39);

  end if;
end if;

end process MATH_McLaurin;


end QuantAngle_a;

