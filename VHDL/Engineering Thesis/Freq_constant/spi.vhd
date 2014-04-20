library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--DACcom, czyli próba nawi¹zania komunikacji z przetwornikiem.
--TODO
--1. sprawdzic, czy chip select nie jest za krótko (i dodac ew. preskaler)
--2. przetestowac na plytce
-- TEORETYCZNIE wysylajac na port A 

--WA¯NE: jesli to jest dobrze napisane, powinna byc przesylana wartosc V widoczna na pinie A headera J5.
entity DACcom is
port(
  angle     : in std_logic_vector(11 downto 0);--z modulu mclaurina
  reset     : in std_logic;
  clk       : in std_logic;
  SPI_MOSI  : out std_logic;
  SPI_SCK   : out std_logic;
  SPI_CS    : out std_logic;
--  strobe    : in std_logic;  -- rising edge starts transmission
  d_CLR     : out std_logic;
--  d_strobe    : out std_logic;
  SPI_CLR   : out std_logic
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

--asynchroniczny reset SPI

SPI_CLR<=reset;

d_CLR<= reset;
--d_strobe<= strobe;


--strobe_det:process (reset, state, clk)
--begin
--if (reset='0') then
--  a_strobe<='0';
--  aa_strobe<='0';
--  strobe_edge<='0';
--elsif (clk'event and clk='1') then
--  a_strobe<=strobe;
--  aa_strobe<=a_strobe;
--  if( aa_strobe='1' AND a_strobe='0') then
--    strobe_edge<='1';
----  elsif (state = load) then
----  strobe_edge<='0';
--  end if;--tu
--end if;
--end process strobe_det;

--enabling: process (clk, reset, strobe_edge)
--begin
--if (reset='0') then
--  enable<='0';
--elsif (clk'event and clk='1') then
--  if (strobe_edge='1') then
--    enable<='1';
--  end if;
--end if;
--end process enabling;


fsm: process (state, strobe_edge, bit_cnt, time_cnt, enable)
begin
  next_state <= state; 
    case state is
      when rest => 
--	     if enable='1' then --bylo strobe_edge
	       next_state <= load; 

--		  end if;
      when load => 
        next_state <= trans;
		when trans =>
		  if (bit_cnt= "11111" and time_cnt = bit_time-1) then --bylo 31!
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

reg_fsm: process (reset,clk)
begin
  if (reset='0') then
    state<=rest;
  elsif (clk'event and clk='1') then
    state<=next_state;  
  end if;
end process reg_fsm;

TimeCounting: process (clk, reset)
begin
if (reset='0') then
  time_cnt<=(others=>'0');
elsif (clk'event and clk='1') then
  if ((state=trans or state=sent) and time_cnt < bit_time-1) then
    time_cnt<=time_cnt+1;
  else
    time_cnt<=(others=>'0');
  end if;
end if;
end process TimeCounting;

bit_counting: process (clk, reset)
begin
if (reset='0') then
  bit_cnt<=(others=>'0');
elsif (clk'event and clk='1') then
  if (state=trans) then
    if (time_cnt=bit_time-1) then
	   bit_cnt<=bit_cnt+1;
	  end if;
--	 if (bit_cnt="10000") then
--	   bit_cnt<="00000";
--	 end if;
  end if;
end if;
end process bit_counting;

spi_clock: process (clk, reset)
begin
if (reset='0') then
  SPI_SCK<='0';
elsif (clk'event and clk='1') then
  if (state=trans and time_cnt<half_time) then --jak 0-31, to 0, zak³adaj¹c, ¿e umiem liczyæ
    SPI_SCK <='0';
  else	
    SPI_SCK <='1';
  end if;
end if;
end process spi_clock;

reg_shift: process (clk, reset, state, time_cnt)
begin
if (reset='0') then
  OutputPacket<=(others=>'0');
elsif (clk'event and clk='1') then
  if (state=load) then
   OutputPacket<=Dummy (7 downto 0) & command(3 downto 0) & "1111" & angle(11 downto 0) & Dummy(3 downto 0); --"000" to przejsciowo. jak bedzie dzialac bedzie 12 bitow.
	elsif (state=trans and time_cnt= bit_time-1) then
	   OutputPacket<=OutputPacket(30 downto 0) & '0';
  end if;
end if;
end process reg_shift;

SPI_MOSI  <= OutputPacket(31);
SPI_CS<= '1' when (state=sent or state=load) else '0';


end DACcom_a;

