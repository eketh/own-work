library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY impuls_tb IS
END impuls_tb;
 
ARCHITECTURE impuls_tb_a OF impuls_tb IS 
 
 
    COMPONENT impuls is
    PORT(
         pulse : OUT  std_logic_vector(11 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    
signal s_pulse: std_logic_vector (11 downto 0);
signal s_reset, s_clk: std_logic;
 
BEGIN
 
mietek: impuls PORT MAP (pulse=>s_pulse, reset =>s_reset, clk =>s_clk);

clock:process
begin
s_clk<='0';
wait for 1 ns;
s_clk<='1';
wait for 1 ns;
end process clock;

tescik: process
begin
s_reset<='0';
wait for 10 ns;
s_reset<='1';
wait for 600 ns;
assert false severity failure;
end process tescik;

END impuls_tb_a;
