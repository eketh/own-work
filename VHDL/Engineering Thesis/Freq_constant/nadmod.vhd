library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.all;
use ieee.numeric_std.all;

use work.sinelib.all;
use work.freqlib.all;

entity instrument is

port(
  clk: in std_logic;
  reset: in std_logic;
  ch: in std_logic_vector (7 downto 0);
  --spi
  SPI_MOSI: out std_logic;
  SPI_SCK:  out std_logic;
  SPI_CLR: out std_logic;
  SPI_CS:   out std_logic;
  d_CLR :   out std_logic;
  d_ch1 :   out std_logic;
  d_ch2 :   out std_logic;
  d_ch3 :   out std_logic;
  test  :   out std_logic_vector (11 downto 0)
);

end instrument;

architecture instrument_a of instrument is

component DACcom is
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
end component DACcom;

component QuantAngle is
port(
clk: in std_logic;
reset: in std_logic;
sine_out: out std_logic_vector(10 downto 0);
tune_in: in std_logic_vector (3 downto 0);
tune_out: out std_logic_vector (3 downto 0)
);
end component;

component masz IS
  port(
  ch: in std_logic_vector (7 downto 0);
  clk:in std_logic;
  reset: in std_logic;
  sout1: out std_logic_vector(3 downto 0);
  sout2: out std_logic_vector(3 downto 0);
  sout3: out std_logic_vector(3 downto 0);
  sout4: out std_logic_vector(3 downto 0);
  fch1  : in std_logic_vector (3 downto 0);
  fch2  : in std_logic_vector (3 downto 0);
  fch3  : in std_logic_vector (3 downto 0);
  fch4  : in std_logic_vector (3 downto 0)
  );
  END component;

signal sclk,sreset: std_logic;
--sygnaly SPI
signal sstrobe,sspi_mosi,sspi_sck,sspi_clr,sspi_cs,sd_clr,sd_strobe: std_logic;
signal channel1, channel2, channel3, channel4: std_logic_vector (3 downto 0);
signal tune1,  tune2,  tune3, tune4  : std_logic_vector (3 downto 0);
signal sch: std_logic_vector (7 downto 0);
signal sin1, sin2,sin3,sin4: std_logic_vector (10 downto 0);
signal help1: std_logic_vector(13 downto 0);
--signal help2: std_logic_vector(13 downto 0);
--signal help4: std_logic_vector(12 downto 0);
--signal help5: std_logic_vector(13 downto 0);
signal sound: std_logic_vector(11 downto 0);
begin


keyboard      : masz port map (clk=>sclk, reset=>sreset, ch=>sch, fch1=>tune1, fch2=>tune2, fch3=>tune3, fch4=>tune4, sout1=>channel1, sout2=>channel2, sout3=>channel3, sout4=>channel4);
kanaljeden    : QuantAngle port map (clk=>sclk, reset=>sreset, tune_in=>channel1, sine_out=>sin1, tune_out=>tune1);
--harmojeden  : QuantAngle_h port map  (clk=>sclk, reset=>sreset, tune_in=>channel1, sine_out=>sin1h);
kanaldwa      : QuantAngle port map (clk=>sclk, reset=>sreset, tune_in=>channel2, sine_out=>sin2, tune_out =>tune2);
--harmodwa    : QuantAngle_h port map  (clk=>sclk, reset=>sreset, tune_in=>channel2, sine_out=>sin2h);
kanaltrzy     : QuantAngle port map (clk=>sclk, reset=>sreset, tune_in=>channel3, sine_out=>sin3, tune_out=>tune3);
--harmotrzy   : QuantAngle_h port map  (clk=>sclk, reset=>sreset, tune_in=>channel3, sine_out=>sin3h);
kanalcztery   : QuantAngle port map (clk=>sclk, reset=>sreset, tune_in=>channel4, sine_out=>sin4, tune_out =>tune4);
spi           : DACcom port map (angle=>sound, clk=>sclk, reset=>sreset,spi_mosi=>sspi_mosi, spi_sck=>sspi_sck, spi_cs=>sspi_cs,d_clr=>sd_clr, spi_clr=>sspi_clr);

sclk<=clk;
sreset<= NOT reset;
sch<=ch;
--do SPI
spi_mosi<=sspi_mosi;
spi_sck<=sspi_sck;
spi_clr<=sspi_clr;
spi_cs<=sspi_cs;
--sstrobe<=strobe;
--d_strobe<=sd_strobe;
d_clr<=sd_clr;
d_ch1<=ch(0);
d_ch2<=ch(1);
d_ch3<=ch(2);
--!!! to moze byc zle
--help1<= sin1+ sin1h;
--help2<= sin2+ sin2h;
--help3<= sin3+ sin3h;
--help4<=help1 + help2;
--help5<=help4 + help3;
--sound<=help5(13 downto 2);
test<=sound;
dzwiek: process (sin1, sin2, sin3, sin4)
begin
if (sin1/="00000000000" or sin2/="00000000000" or sin3/="00000000000" or sin4/="00000000000") then
help1<=("000" & sin1) + ("000" & sin2) + ("000" & sin3) + ("000" & sin4) - "00100000000000";
else
help1<=(others=>'0');
end if;
end process dzwiek;


sound<=help1(13 downto 2);
end instrument_a;

