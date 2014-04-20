library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


--modul SPI zapo¿yczony z mojej pracy in¿ynierskiej. N.Pyka, 30 I 2013

entity DACcom is
port(
  pulse_dac     : in std_logic_vector(11 downto 0);
  reset_dac     : in std_logic;
  clk_dac       : in std_logic;
  SPI_MOSI_dac  : out std_logic;
  SPI_SCK_dac   : out std_logic;
  SPI_CS_dac    : out std_logic;
  d_CLR_dac     : out std_logic;
  SPI_CLR_dac   : out std_logic
);
end DACcom;



architecture DACcom_a of daccom is

  type states is (rest, load, trans,sent);
  signal state, next_state : states;
  constant bit_time : integer := 10; 
  constant half_time : integer := 5;
  signal OutputPacket: std_logic_vector(31 downto 0);
  signal time_cnt: std_logic_vector(35 downto 0);-- testowo
  signal bit_cnt: std_logic_vector(4 downto 0); 
  constant Dummy: std_logic_vector(7 downto 0):=(others=>'1');
  constant resttime : integer:= 2;--dodane, test
  constant command  : std_logic_vector (3 downto 0):="0011";

  signal strobe_edge: std_logic;  
  signal a_strobe: std_logic;
  signal aa_strobe: std_logic;
  signal enable: std_logic;
  
begin

--sygnaly do wylaczenia
--SPI_ss_B <= '1';
--AMP_CS<='1';
--AD_CONV<='0';
--SF_CE0 <='1';
--FPGA_INIT_B <= '0';

--asynchroniczny reset_dac SPI

SPI_CLR_dac<=reset_dac;

d_CLR_dac<= reset_dac;


fsm: process (state, strobe_edge, bit_cnt, time_cnt, enable)
begin
  next_state <= state; 
    case state is
      when rest => 
	       next_state <= load; 
      when load => 
        next_state <= trans;
		when trans =>
		  if (bit_cnt= "11111" and time_cnt = bit_time-1) then
          next_state <= sent;
		  end if;
		when sent=>
		  if (time_cnt=resttime-1) then
          next_state <= rest;	
		  end if;
      when others=>
        next_state <= rest;	 
  end case; 
end process fsm;   

reg_fsm: process (reset_dac,clk_dac)
begin
  if (reset_dac='0') then
    state<=rest;
  elsif (clk_dac'event and clk_dac='1') then
    state<=next_state;  
  end if;
end process reg_fsm;

TimeCounting: process (clk_dac, reset_dac)
begin
if (reset_dac='0') then
  time_cnt<=(others=>'0');
elsif (clk_dac'event and clk_dac='1') then
  if ((state=trans or state=sent) and time_cnt < bit_time-1) then
    time_cnt<=time_cnt+1;
  else
    time_cnt<=(others=>'0');
  end if;
end if;
end process TimeCounting;

bit_counting: process (clk_dac, reset_dac)
begin
if (reset_dac='0') then
  bit_cnt<=(others=>'0');
elsif (clk_dac'event and clk_dac='1') then
  if (state=trans) then
    if (time_cnt=bit_time-1) then
	   bit_cnt<=bit_cnt+1;
	  end if;
  end if;
end if;
end process bit_counting;

spi_clock: process (clk_dac, reset_dac)
begin
if (reset_dac='0') then
  SPI_SCK_dac<='0';
elsif (clk_dac'event and clk_dac='1') then
  if (state=trans and time_cnt<half_time) then
    SPI_SCK_dac <='0';
  else	
    SPI_SCK_dac <='1';
  end if;
end if;
end process spi_clock;

reg_shift: process (clk_dac, reset_dac, state, time_cnt)
begin
if (reset_dac='0') then
  OutputPacket<=(others=>'0');
elsif (clk_dac'event and clk_dac='1') then
  if (state=load) then
   OutputPacket<=Dummy (7 downto 0) & command(3 downto 0) & "1111" & pulse_dac(11 downto 0) & Dummy(3 downto 0);
	elsif (state=trans and time_cnt= bit_time-1) then
	   OutputPacket<=OutputPacket(30 downto 0) & '0';
  end if;
end if;
end process reg_shift;

SPI_MOSI_dac  <= OutputPacket(31);
SPI_CS_dac<= '1' when (state=sent or state=load) else '0';


end DACcom_a;

