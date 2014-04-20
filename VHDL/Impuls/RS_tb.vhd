
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RS_tb IS
END RS_tb;
 
ARCHITECTURE behavior OF RS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RS
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         RS_input : IN  std_logic;
         attention : OUT  std_logic;
         output_what : OUT  std_logic_vector(2 downto 0);
         output_value : OUT  std_logic_vector(25 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal RS_input : std_logic := '0';

 	--Outputs
   signal attention : std_logic;
   signal output_what : std_logic_vector(2 downto 0);
   signal output_value : std_logic_vector(25 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   zbyszek: RS PORT MAP (
          clk => clk,
          reset => reset,
          RS_input => RS_input,
          attention => attention,
          output_what => output_what,
          output_value => output_value
        );

clock:process
begin
  clk<='0';
  wait for 1 ps;
  clk<='1';
  wait for 1 ps;
end process clock;

trzycytryny: process
begin
  reset<='0';
  wait for 5 ps;
  reset<='1';
  RS_input<='1';
  wait for 10 ns;
  assert false severity failure;
end process trzycytryny;

END;
