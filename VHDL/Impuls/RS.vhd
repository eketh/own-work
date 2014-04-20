
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--modu³ testowy wysy³ania przez port RS
entity RS is
port (
clk: in std_logic;
reset: in std_logic;
d_reset: out std_logic;
RS_e: in std_logic;
RS_o: out std_logic;
attention: out std_logic;
anew: in std_logic;
read_h: out std_logic;
output_seq: out std_logic_vector (31 downto 0)
);
end RS;

architecture RS_a of RS is


-- konieczne ustawienia Docklighta
-- baud rate = 115200
-- parity: none
-- parity error char: ignore
-- data bits:8
-- stop bits:1

--dioda na update + na waiting!!! (powinna siê nie zmieniac)

type states is (waiting, receiving, echoing, finish);
signal state, next_state: states;
signal baud_time: std_logic_vector(8 downto 0);
signal start_seq: std_logic;
signal input_buffer: std_logic_vector(40 downto 0); --39
signal echo_buffer: std_logic_vector(40 downto 0); --39
signal bit_cnt: integer; -- range 0 to 36;
signal transm_clk: std_logic;
signal a_anew: std_logic;

constant start_bit: std_logic:='0';
constant max_bit: integer:=40;
constant baud_max: std_logic_vector(8 downto 0):= "110110010";--(18 downto 0):= "1101110111110010001"; --454545
constant half_time: std_logic_vector(8 downto 0):= "011011001"; --(18 downto 0):= "0110111011111001000";
constant read_time: std_logic_vector(8 downto 0):="001101100"; --18 downto 0):= "0011011101111100100";

begin

reg_fsm: process (reset,clk)
begin
  if (reset='0') then
    state<=waiting;
  elsif (clk'event and clk='1') then
    state<=next_state;  
  end if;
end process reg_fsm;


fsm: process (state, start_seq, bit_cnt, baud_time, anew, a_anew)
begin
  next_state <= state; 
    case state is
      when waiting => 
        if (start_seq = start_bit) then
	       next_state <= receiving; 
		  end if;
      when receiving => 
        if ((bit_cnt=max_bit) and baud_time=baud_max) then --9
          next_state <= echoing;
		  end if;
		when echoing =>
        if ((bit_cnt=max_bit) and baud_time=baud_max) then --9
          next_state <= finish;
		  end if;
		when finish=>
	       next_state <= waiting; 
      when others=>
        next_state <= waiting;	 
  end case; 
end process fsm;

cap:process (clk, reset)
begin
if (reset='0') then
  a_anew<='0';
elsif (clk'event and clk='1') then
  a_anew<=anew;
end if;
end process cap;



transm_clock: process (clk, reset)
begin
if (reset='0') then
  baud_time<=(others=>'0');
elsif (clk'event and clk='1') then
  if (state=receiving or state=echoing) then
   if (bit_cnt<=max_bit)  then	 
    if (baud_time<=baud_max) then
      baud_time<=baud_time+1;
    else
      baud_time<=(others=>'0');
    end if;
  end if;
end if;
end if;
end process transm_clock;

find_frame: process (clk, reset)
--wy³apywanie bitu startu
begin
  if (reset= '0') then
    start_seq <= '1';
  elsif (clk'event and clk='1') then
    if (state=waiting) then
        start_seq<=RS_e;
	   else
	     start_seq<='1';
	   end if;		
    end if;
end process find_frame;

--transmission:
--transmisja oraz pobieranie danych
transmission: process (clk, reset)
begin
  if (reset='0') then
    input_buffer<= (others=>'0');
	 echo_buffer<= (others=>'0');
	 bit_cnt<= 0;
	 RS_o<='1';
	 read_h<='0';
  elsif (clk'event and clk='1') then
   if ((bit_cnt=max_bit) and baud_time=baud_max) then
	 bit_cnt<= 0;
   elsif (state= receiving or state=echoing) then		
	   if (baud_time=half_time) then
		  read_h<='1';
		  if (state=receiving) then
		  input_buffer(bit_cnt)<= RS_e;
		  echo_buffer(bit_cnt)<= RS_e;
		  elsif (state=echoing) then
		  RS_o<=echo_buffer(bit_cnt);
		  end if;
		elsif (baud_time=half_time+read_time) then    
		  bit_cnt<=bit_cnt+1;
      else
       read_h<='0';		
		end if;
	 else
	   RS_o<='1';
      input_buffer<= (others=>'0');	
      echo_buffer<= (others=>'0');		
	 end if;
  end if;
end process transmission;

--interpretation
--wycinanie bitów startu/stopu/parzystoœci i z³o¿enie informacji
interpretation: process (clk, reset)
begin
  if (reset='0') then
    output_seq<=(others=>'0');
	 attention<='0';
  elsif (clk'event and clk='1') then
    if (state=receiving) then
    if ((bit_cnt=max_bit) and baud_time=baud_max) then 
output_seq<=(input_buffer (39 downto 32) & input_buffer(29 downto 22) & input_buffer(19 downto 12) & input_buffer (9 downto 2)); -- wyciêcie bitów startu i stopu  
      attention<='1';
    else
    output_seq<=(others=>'0');
	 attention<='0';       	 
	 end if;
	 else
	 attention<='0';
	 end if;
  end if;
end process interpretation;

d_reset<=reset;
end RS_a;

