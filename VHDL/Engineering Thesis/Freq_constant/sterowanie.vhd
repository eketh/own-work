library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;

 ENTITY masz IS
  port(
  ch: in std_logic_vector(7 downto 0);
  clk:in std_logic;
  reset: in std_logic;
  sout1: out std_logic_vector(3 downto 0);--outy tez jedno wyjscie
  sout2: out std_logic_vector(3 downto 0);
  sout3: out std_logic_vector(3 downto 0);--;
  sout4: out std_logic_vector (3 downto 0);
  fch1  : in std_logic_vector (3 downto 0);--feedback tez jedno wyjscie
  fch2  : in std_logic_vector (3 downto 0);
  fch3  : in std_logic_vector (3 downto 0);
  fch4  : in std_logic_vector (3 downto 0)
  );
  END masz;

architecture masz_a of masz is

type states is (rest, loading);
signal state, next_state: states;

signal a:std_logic_vector (7 downto 0);
signal aa: std_logic_vector (7 downto 0);

--play: pokazuje, które przyciski s¹ aktualnie w³¹czone
signal play: std_logic_vector (7 downto 0);


signal a_play: std_logic_vector(7 downto 0);
signal test      : std_logic_vector (7 downto 0);

signal out1 :std_logic_vector(3 downto 0);
signal out2 :std_logic_vector(3 downto 0);
signal out3 :std_logic_vector(3 downto 0);
signal out4 :std_logic_vector(3 downto 0);

signal busy: std_logic_vector (3 downto 0);

signal prescaler: std_logic_vector (2 downto 0);
begin

zbocze: process(clk,reset)
begin
if (reset='0') then
  a<=(others=>'0');
  aa<=(others=>'0');
  play<=(others=>'0');
  a_play<=(others=>'0');
elsif(clk'event and clk='1') then
  a<= ch;
  aa<=a;
  for i in 7 downto 0 loop
    play(i)<=a(i) and aa(i); -- Stan wysoki: jak sygnal i jego after sa w stanie wysokim. opcjonalnie mozna zmienic na or, co da rozpoczecie generowania dzwieku o 1 cykl szybciej.
  end loop;
  a_play<=play;
end if;
end process zbocze;

fsm_reg: process (clk,reset)
begin 
if (reset='0') then
  state<=rest;
elsif (clk'event and clk='1') then
  state<=next_state;
end if;
end process fsm_reg; 


fsm: process (state, a_play, play, prescaler)
begin
  next_state<=state;
  case state is
    when rest=>
      if (a_play/=play) then
        next_state<=loading;
		end if;
	 when loading=>
      next_state<=rest;
    when others=>
	   next_state<=rest;
  end case;
end process fsm;


granie:process (reset,clk, state)
begin
if (reset='0') then
  out1<=(others=>'0');
  out2<=(others=>'0');
  out3<=(others=>'0');
  out4<=(others=>'0');
  test<=(others=>'0');
  busy<=(others=>'0');
elsif (clk'event and clk='1') then
  if (next_state=loading) then
    test<=play;
  elsif (state=loading) then
  --wlaczanie:przypisywanie w³¹czonych dŸwiêków do kana³ów
    if (busy(0)='0') then
      if (play(0)='1' and out2/="0001" and out3/="0001" and out4/="0001") then
        busy(0)<='1';
		  out1<="0001";
	   end if;
		 if (play(1)='1' and out2/="0010" and out3/="0010"  and out4/="0010") then
        busy(0)<='1';
		  out1<="0010";
	   end if;
		 if (play(2)='1' and out2/="0011" and out3/="0011" and out4/="0011") then
        busy(0)<='1';
		  out1<="0011";
	   end if;
       if (play(3)='1' and out2/="0100" and out3/="0100" and out4/="0100") then
        busy(0)<='1';
		  out1<="0100";
	   end if;	
      if (play(4)='1' and out2/="0101" and out3/="0101" and out4/="0101") then
        busy(0)<='1';
		  out1<="0101";
	   end if;
       if (play(5)='1' and out2/="0110" and out3/="0110" and out4/="0101") then
        busy(0)<='1';
		  out1<="0110";
	    end if;	
       if (play(6)='1' and out2/="0111" and out3/="0111" and out4/="0111") then
        busy(0)<='1';
		  out1<="0111";
	    end if;	
       if (play(7)='1' and out2/="1000" and out3/="1000" and out4/="1000") then
        busy(0)<='1';
		  out1<="1000";
	    end if;	
   elsif (busy(1)='0') then
      if (play(0)='1' and out1/="0001" and out3/="0001" and out4/="0001") then--out3
        busy(1)<='1';
		  out2<="0001";
	   end if;	
      if (play(1)='1' and out1/="0010" and out3/="0010" and out4/="0010") then
        busy(1)<='1';
		  out2<="0010";
	   end if;	
      if (play(2)='1' and out1/="0011" and out3/="0011" and out4/="0011") then
        busy(1)<='1';
		  out2<="0011";
	   end if;	
      if (play(3)='1' and out1/="0100" and out3/="0100" and out4/="0100") then
        busy(1)<='1';
		  out2<="0100";
	   end if;
      if (play(4)='1' and out1/="0101" and out3/="0101" and out4/="0101") then
        busy(1)<='1';
		  out2<="0101";
	   end if;	
      if (play(5)='1' and out1/="0110" and out3/="0110" and out4/="0110") then
        busy(1)<='1';
		  out2<="0110";
	   end if;		
      if (play(6)='1' and out1/="0111" and out3/="0111" and out4/="0111") then
        busy(1)<='1';
		  out2<="0111";
	   end if;	
      if (play(7)='1' and out1/="1000" and out3/="1000" and out4/="1000") then
        busy(1)<='1';
		  out2<="1000";
	   end if;		
   elsif (busy(2)='0') then
      if (play(0)='1' and out1/="0001" and out2/="0001" and out4/="0001") then
        busy(2)<='1';
		  out3<="0001";
	   end if;	
      if (play(1)='1' and out1/="0010" and out2/="0010" and out4/="0010") then
        busy(2)<='1';
		  out3<="0010";
	   end if;	
      if (play(2)='1' and out1/="0011" and out2/="0011" and out4/="0011") then
        busy(2)<='1';
		  out3<="0011";
	   end if;	
      if (play(3)='1' and out1/="0100" and out2/="0100" and out4/="0100") then
        busy(2)<='1';
		  out3<="0100";
	   end if;
      if (play(4)='1' and out1/="0101" and out2/="0101" and out4/="0101") then
        busy(2)<='1';
		  out3<="0101";
	   end if;	
      if (play(5)='1' and out1/="0110" and out2/="0110" and out4/="0110") then
        busy(2)<='1';
		  out3<="0110";
	   end if;		
      if (play(6)='1' and out1/="0111" and out2/="0111" and out4/="0111") then
        busy(2)<='1';
		  out3<="0111";
	   end if;	
      if (play(7)='1' and out1/="1000" and out2/="1000" and out4/="1000") then
        busy(2)<='1';
		  out3<="1000";
	   end if;	
--kanal 4
   elsif (busy(3)='0') then
      if (play(0)='1' and out1/="0001" and out2/="0001" and out3/="0001") then
        busy(3)<='1';
		  out4<="0001";
	   end if;	
      if (play(1)='1' and out1/="0010" and out2/="0010" and out3/="0010") then
        busy(3)<='1';
		  out4<="0010";
	   end if;	
      if (play(2)='1' and out1/="0011" and out2/="0011" and out3/="0011") then
        busy(3)<='1';
		  out4<="0011";
	   end if;	
      if (play(3)='1' and out1/="0100" and out2/="0100" and out3/="0100") then
        busy(3)<='1';
		  out4<="0100";
	   end if;
      if (play(4)='1' and out1/="0101" and out2/="0101" and out3/="0101") then
        busy(3)<='1';
		  out4<="0101";
	   end if;	
      if (play(5)='1' and out1/="0110" and out2/="0110" and out3/="0110") then
        busy(3)<='1';
		  out4<="0110";
	   end if;		
      if (play(6)='1' and out1/="0111" and out2/="0111" and out3/="0111") then
        busy(3)<='1';
		  out4<="0111";
	   end if;	
      if (play(7)='1' and out1/="1000" and out2/="1000" and out3/="1000") then
        busy(3)<='1';
		  out4<="1000";
	   end if;
--dotad		
	end if;
    if (busy(0)='1') then
      if (out1="0001" and play(0)='0') then
        busy(0)<='0';
		  out1<="0000";
		end if;
		if (out1="0010" and play(1)='0') then
        busy(0)<='0';
		  out1<="0000";
		end if;
      if (out1="0011" and play(2)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
      if (out1="0100" and play(3)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
      if (out1="0101" and play(4)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
      if (out1="0110" and play(5)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
      if (out1="0111" and play(6)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
      if (out1="1000" and play(7)='0') then
        busy(0)<='0';
		  out1<="0000";
      end if;
	  end if; --!!!
	   if (busy(1)='1') then
      if (play(0)='0' and out2="0001") then
        busy(1)<='0';
		  out2<="0000";
	   end if;	
		 if (play(1)='0' and out2="0010") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		 if (play(2)='0' and out2="0011") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		  if (play(3)='0' and out2="0100") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		 if (play(4)='0' and out2="0101") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		 if (play(5)='0' and out2="0110") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		 if (play(6)='0' and out2="0111") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
		 if (play(7)='0' and out2="1000") then
        busy(1)<='0';
		  out2<="0000";
	   end if;
	 end if;
	 if (busy(2)='1') then
	   if (play(0)='0' and out3="0001") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	  if (play(1)='0' and out3="0010") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	  	   if (play(2)='0' and out3="0011") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	if (play(3)='0' and out3="0100") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
   if (play(4)='0' and out3="0101") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	   if (play(5)='0' and out3="0110") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	   if (play(6)='0' and out3="0111") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	   if (play(7)='0' and out3="1000") then
        busy(2)<='0';
		  out3<="0000";
	   end if;
	 end if;
	   if (busy(3)='1') then
      if (play(0)='0' and out4="0001") then
        busy(3)<='0';
		  out4<="0000";
	   end if;	
		 if (play(1)='0' and out4="0010") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		 if (play(2)='0' and out4="0011") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		  if (play(3)='0' and out4="0100") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		 if (play(4)='0' and out4="0101") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		 if (play(5)='0' and out4="0110") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		 if (play(6)='0' and out4="0111") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
		 if (play(7)='0' and out4="1000") then
        busy(3)<='0';
		  out4<="0000";
	   end if;
	 end if;
  end if;
end if;
end process granie;


sout1<=out1;
sout2<=out2;
sout3<=out3;
sout4<=out4;

end masz_a;

