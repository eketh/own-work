library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity headi is

port (
  reset     : in std_logic;
  clk       : in std_logic;
  SPI_MOSI  : out std_logic;
  SPI_SCK   : out std_logic;
  SPI_CS    : out std_logic;
  d_CLR     : out std_logic;
  SPI_CLR   : out std_logic;
  d_pulse   : out std_logic;
  d_reset   : out std_logic;
  RS_e      : in std_logic;
  RS_s      : out std_logic; --wejscie pomocnicze
  read_h    : out std_logic; --wej. pomocnicze
  RS_o      : out std_logic;
  anew      : in std_logic;
--  rot_a     : in std_logic;
--  rot_b     : in std_logic;
  error     : out std_logic;
  d_wait    : out std_logic;
  bajerak   : out std_logic_vector(3 downto 0)
);  
  
end headi;

architecture headi_a of headi is

component RS is
port(
clk: in std_logic;
read_h: out std_logic;
reset: in std_logic;
d_reset: out std_logic;
RS_e: in std_logic;
RS_o: out std_logic;
attention: out std_logic;
anew: in std_logic;
output_seq: out std_logic_vector (31 downto 0)
);
end component;


component DACcom is
port(
  pulse_dac     : in std_logic_vector(11 downto 0);
  reset_dac     : in std_logic;
  clk_dac      : in std_logic;
  SPI_MOSI_dac  : out std_logic;
  SPI_SCK_dac   : out std_logic;
  SPI_CS_dac    : out std_logic;
  d_CLR_dac    : out std_logic;
  SPI_CLR_dac   : out std_logic
);
end component;

component impuls is
port(
  pulse      : out std_logic_vector(11 downto 0);
  reset      : in std_logic;
  clk        : in std_logic;
  d_pulse    : out std_logic;
  attention  : in std_logic;
  input_seq  : in std_logic_vector (31 downto 0);
--  rot_a      : in std_logic;
--  rot_b      : in std_logic;
  error      : out std_logic;
  d_wait     : out std_logic;
  bajerak: out std_logic_vector(3 downto 0)
);
end component;

signal spulse : std_logic_vector (11 downto 0);
signal seq   : std_logic_vector (31 downto 0);
signal sbajerak: std_logic_vector (3 downto 0);
signal serror, sd_wait, sreset, sread_h, sclk, sSPI_MOSI, sSPI_SCK, sSPI_CS, sd_CLR, sSPI_CLR, sd_pulse, sRS_e, sRS_o, sanew, sattention, sd_reset : std_logic; --srot_a, srot_b

begin

komandos   : RS port map (read_h=>sread_h, clk=>sclk, reset=>sreset, RS_e=>sRS_e, RS_o =>sRS_o, anew=>sanew, attention => sattention, d_reset=>sd_reset, output_seq=>seq);
impulsator : impuls port map (bajerak=>sbajerak, d_wait=>sd_wait, error=> serror, input_seq=>seq, attention=> sattention, pulse=>spulse, reset=>sreset, clk=>sclk, d_pulse=>sd_pulse); -- rot_a=>srot_a, rot_b=>srot_b);
DAC        : DACcom port map (pulse_dac=>spulse, reset_dac=>sreset, clk_dac=>sclk, SPI_MOSI_dac=>sSPI_MOSI, SPI_SCK_dac=>sSPI_SCK, SPI_CS_dac=>sSPI_CS, d_CLR_dac=> sd_CLR, SPI_CLR_dac => sSPI_CLR);

d_wait<=sd_wait;
sreset<=reset;
sclk<=clk;
SPI_MOSI<=sSPI_MOSI;
SPI_SCK<=sSPI_SCK;
SPI_CS<=sSPI_CS;
d_CLR<=sd_CLR;
SPI_CLR<=sSPI_CLR;
d_pulse<=sd_pulse;
d_reset<=sreset;
sanew<=anew;
sRS_e<=RS_e;
RS_o<=sRS_o;
--srot_a<=rot_a;
--srot_b<=rot_b;
RS_s<=sRS_e;
read_h<=sread_h;
error<=serror;
bajerak<=sbajerak;

end headi_a;