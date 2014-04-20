-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use std.textio.all;
  use ieee.std_logic_textio.all;
  use ieee.std_logic_arith.all;

  ENTITY instrument_tb IS
  END instrument_tb;

  ARCHITECTURE instrument_tb_a OF instrument_tb IS 


          COMPONENT instrument is
            port(
  clk: in std_logic;
  reset: in std_logic;
  ch: in std_logic_vector(7 downto 0);
  --spi
  SPI_MOSI: out std_logic;
  SPI_SCK:  out std_logic;
  SPI_CLR: out std_logic;
  SPI_CS:   out std_logic;
  d_CLR :   out std_logic;
  test  :   out std_logic_vector (11 downto 0)
);
          END COMPONENT;

          SIGNAL clk,reset:  std_logic;
			 signal sch: std_logic_vector (7 downto 0);
			 signal stest: std_logic_vector (11 downto 0);
			 SIGNAL sstrobe,sspi_mosi,sspi_sck,sspi_clr,sspi_cs,sd_strobe,sd_clr:std_logic;
        --  SIGNAL sound:  std_logic_vector(8 downto 0);
          

  BEGIN

wiesio: instrument port map (ch=>sch, clk=>clk, reset=>reset, spi_mosi=>sspi_mosi, spi_sck=>sspi_sck, spi_cs=>sspi_cs, spi_clr=>sspi_clr, d_clr=>sd_clr, test=>stest); --, busy1=>busy1, busy2=>busy2, busy3=>busy3);

clock:process
begin
clk<='0';
wait for 10 ps;
clk<='1';
wait for 10 ps;
end process clock;

test:process
begin
reset<='1';
sch<=(others=>'0');
sstrobe<='0';
wait for 50 ps;
reset<='0';
wait for 50 ps;
sstrobe<='1';
wait for 50 ps;
sstrobe<='0';
wait for 50 ps;
sch(0)<='1';
wait for 200 ns;
assert false severity failure;

end process test;

output: PROCESS (clk)
variable str :string(1 to 9);
variable lineout :line;
variable init_file :std_logic := '1';
file outfile :text is out "czterykanaly.txt";

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

--jakas funkcja typu convert to real by sie przydala

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
--str:="Po kolei: clk/reset/k¹t/cwiartka        ";
write(lineout,str); writeline(outfile,lineout);

init_file := '0';
END IF;
-------- zapis danych do pliku wyjsciowego „wyjscie" -------- 
IF (clk'EVENT AND clk='1') THEN
--str := (others => ' ');
str(1 to 9) := conv_to_string(stest,4,12);
write(lineout,str);
writeline(outfile,lineout);
END IF;
END PROCESS output;


  END instrument_tb_a;
