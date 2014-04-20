library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY impuls_tb IS
END impuls_tb;
 
ARCHITECTURE impuls_tb_a OF impuls_tb IS 
 
 
    COMPONENT headi is
	 port (
  reset     : in std_logic;
  clk       : in std_logic;
  SPI_MOSI  : out std_logic;
  SPI_SCK   : out std_logic;
  SPI_CS    : out std_logic;
  d_CLR     : out std_logic;
  SPI_CLR   : out std_logic
);  
  
end component;
    
signal s_reset, s_clk, sSPI_MOSI, sSPI_SCK, sSPI_CS, sd_CLR, sSPI_CLR : std_logic;
 
BEGIN
 
mietek: headi PORT MAP (reset=>s_reset, clk=>s_clk, SPI_MOSI=>sSPI_MOSI, SPI_SCK=>sSPI_SCK, SPI_CS=>sSPI_CS, d_CLR=>sd_CLR, SPI_CLR=>sSPI_CLR);

clock:process
begin
s_clk<='0';
wait for 1 ps;
s_clk<='1';
wait for 1 ps;
end process clock;

tescik: process
begin
s_reset<='0';
wait for 10 ns;
s_reset<='1';
wait for 500 ns;
assert false severity failure;
end process tescik;

END impuls_tb_a;
