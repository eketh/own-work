library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity impuls is
port(
  pulse     : out std_logic_vector(11 downto 0);--z modulu mclaurina
  reset     : in std_logic;
  clk       : in std_logic;
  attention : in std_logic;
  input_seq : in std_logic_vector (31 downto 0);
  d_pulse   : out std_logic;
  d_wait    : out std_logic;
--  rot_a     : in std_logic;
--  rot_b     : in std_logic;
  error     : out std_logic;
  bajerak: out std_logic_vector(3 downto 0)
);
end impuls;

architecture impuls_a of impuls is
-- 1100001101010000 - 1 ms 

--ramka danych!!! 
-- 1 pakiet
-- co wysy³a
-- przeliczanie
-- szczegó³y transmisji
-- wys³ac do Maæka
type states is (rest, work, update);
signal state, next_state : states;
constant pulse_max: std_logic_vector (3 downto 0) := "0101"; --domyœlnie 5 impulsów
constant pulse_width: std_logic_vector(31 downto 0):= "00000000000001100001101010000000"; --
-- szerokoœæ impulsu: 1 ms
signal pulse_distance: std_logic_vector(31 downto 0);
constant rest_time: std_logic_vector (31 downto 0):= "00000000000000110000110101000000"; --czas oczekiwania pomiêdzy paczkami impulsów:teraz 8 ms
signal bajer: std_logic_vector(30 downto 0);
signal pulse_time_cnt: std_logic_vector (32 downto 0);
signal pulse_cnt: std_logic_vector (3 downto 0);
signal pulse_boolean: std_logic;
signal a_pulse_boolean: std_logic;
signal aa_pulse_boolean: std_logic;
signal a_attention: std_logic;


begin

fsm: process (state, pulse_time_cnt, pulse_cnt, attention, a_attention)
begin
  next_state <= state; 
  if (attention='1' and a_attention='0') then
    next_state<=update;
  else
    case state is
      when rest => 
        if (pulse_time_cnt = rest_time) then
	       next_state <= work; 
   	  end if;
      when work => 
        if (pulse_cnt = pulse_max) then
		    next_state <= rest;
		  end if;
		 when update=>
		 next_state<=rest;
      when others=>
        next_state <= rest;	 
  end case; 
  end if;
end process fsm;   

reg_fsm: process (reset,clk)
begin
  if (reset='0') then
    state<=rest;
  elsif (clk'event and clk='1') then
    state<=next_state;	 
  end if;
end process reg_fsm;

attention_reg: process (reset,clk)
begin
if (reset='0') then
  a_attention<='0';
elsif (clk'event and clk='1') then
  a_attention<=attention;
end if;
end process attention_reg;

val_change: process (reset,clk)
begin
if (reset='0') then
  pulse_distance<= "00001100000000000000000000000000";
elsif (clk'event and clk='1') then
  if (state=update) then
    pulse_distance<=(input_seq);
  end if;
end if;
end process val_change;

bajerzek: process (clk, reset)
begin
  if (reset='0') then
  bajerak<= (others=>'0');
  bajer<=(others=>'0');
elsif (clk'event and clk='1') then
  bajer<=bajer+1;
  if (bajer<="1000000000000000000000000000000") then
  bajerak<=pulse_distance(3 downto 0);
  else
  bajerak<=pulse_distance(3 downto 0);
  end if;
end if;
end process bajerzek;

time_counting: process (reset, clk)
begin
  if (reset='0') then
	 pulse_time_cnt <=(others=>'0');
	 pulse_boolean<= '0';
	 error<='0';
  elsif (clk'event and clk='1') then
    if (state /= next_state) then
		pulse_time_cnt <=(others=>'0');
    else
	   pulse_time_cnt <= pulse_time_cnt + 1;
	   if (state=update) then
		pulse_time_cnt <=(others=>'0');
		elsif (state=work) then
		  if (pulse_distance<pulse_width) then
		    pulse_boolean<='0';
		    error<='1';
		  elsif (pulse_time_cnt<=(pulse_distance - pulse_width)) then
		    pulse_boolean<='0';
			 error<='0';
		  elsif (pulse_time_cnt>(pulse_distance - pulse_width) and pulse_time_cnt<pulse_distance) then
		    pulse_boolean<='1';
			 error<='0';
		  elsif (pulse_time_cnt=pulse_distance) then
		    pulse_time_cnt<= (others=>'0');
			 error<='0';
		  end if;
		end if;
	 end if;
  end if;
end process time_counting;

pulse_counting: process (clk, reset)
begin
if (reset='0') then
  a_pulse_boolean<= '0';
  aa_pulse_boolean<='0';
  pulse_cnt <=(others=>'0');
elsif (clk'event and clk='1') then
  if (state=work) then
    a_pulse_boolean<=pulse_boolean;
	 aa_pulse_boolean<=a_pulse_boolean;
  if (a_pulse_boolean= '0' and aa_pulse_boolean= '1') then
    pulse_cnt<= pulse_cnt + 1;
  end if;
  else
    pulse_cnt<= (others=>'0');
    a_pulse_boolean<='0';
    aa_pulse_boolean<='0';
  end if;
end if;

end process pulse_counting;

pulse<= "111111111111" when pulse_boolean= '1' else "000000000000";
d_pulse<=pulse_boolean;
end impuls_a;