--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:49:07 02/07/2013
-- Design Name:   
-- Module Name:   C:/Users/Elsik/Desktop/DYPLOM/IMPULS/obliczaczf.vhd
-- Project Name:  IMPULS
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: headi
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.All; 
  USE ieee.numeric_std.ALL;
  use std.textio.all;
  use ieee.std_logic_textio.all;
 
ENTITY obliczaczf IS
END obliczaczf;
 
ARCHITECTURE behavior OF obliczaczf IS 

 
    COMPONENT komenda is
    PORT(
         wyjscie: out std_logic_vector(35 downto 0);
			clk: in std_logic;
			wejscie: in integer
        );
    END COMPONENT;

signal pomoc: integer:=0;   
signal wyjscie: std_logic_vector(35 downto 0);
signal wejscie: integer;
signal clk: std_logic;


begin

fobliczacz: komenda port map (wyjscie=>wyjscie, wejscie=>wejscie, clk=>clk);


wyjscie <= conv_std_logic_vector(pomoc,36);

obliczenia: process
begin
-- Tu wpisaæ czêstotliwoœc, któr¹ chce siê otrzymaæ [w Hz]:
wejscie<=327125;
-- Czêstotliwoœci szukaæ w pliku "komenda.txt" - pierwsza wartoœc to same zera, a druga to komenda do wys³ania przez RS.
pomoc<=0;
wait for 5 ns;
pomoc <= 50000000/wejscie;
wait for 10 ns;
assert false severity failure;
end process obliczenia;

zegar:process
begin
clk<='1';
wait for 5 ns;
clk<='0';
wait for 5 ns;
end process zegar;

output: PROCESS (clk)
variable str :string(1 to 37);
variable lineout :line;
variable init_file :std_logic := '1';
file outfile :text is out "komenda.txt";

-- Œci¹gniête z instrukcji do 10. cwiczenia z VLSI
-------- funkcja konwersji: std_logic => character -------- 
FUNCTION conv_to_char (sig: std_logic) RETURN character IS
BEGIN
CASE sig IS
WHEN '1' => return '1';
WHEN '0' => return '0';
WHEN 'Z' => return 'Z';
WHEN others => return 'X';
END CASE;
END conv_to_char;


-------- funkcja konwersji: std_logic_vector => string -------- 
FUNCTION conv_to_string (inp: std_logic_vector; down: integer; length: integer) RETURN string IS
VARIABLE s : string(1 TO length);
BEGIN
FOR i IN (down-1) TO (length-1) LOOP
s(length-i) := conv_to_char(inp(i));
END LOOP;
RETURN s;
END conv_to_string;
-------------------------------------
BEGIN
-------- nag³ówek pliku wyjœciowego (podzia³ kolumn) -------- 
IF init_file = '1' THEN

write(lineout,str); writeline(outfile,lineout);

init_file := '0';
END IF;
-------- zapis danych do pliku wyjsciowego „wyjscie" -------- 
IF (clk'EVENT AND clk='1') THEN
--str := (others => ' ');
str(1 to 37) := conv_to_string(wyjscie,1,36);
write(lineout,str);
writeline(outfile,lineout);
END IF;
END PROCESS output;
END;
