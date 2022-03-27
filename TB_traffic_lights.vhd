LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbanch IS
END testbanch;
 
ARCHITECTURE behavior OF testbanch IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traffic_main
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         a : OUT  std_logic_vector(2 downto 0);
         b : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal a : std_logic_vector(2 downto 0);
   signal b : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traffic_main PORT MAP (
          clk => clk,
          rst => rst,
          a => a,
          b => b
        );

   -- Clock process definitions 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.s
		wait for 100 ns;
      -- insert stimulus here 
   end process;

END;
