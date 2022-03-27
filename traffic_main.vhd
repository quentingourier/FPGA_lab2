library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_main is
    Port ( clk : in  STD_LOGIC;
			  rst :in std_logic;
           a : out  STD_LOGIC_VECTOR (2 downto 0);
           b : out  STD_LOGIC_VECTOR (2 downto 0));
end traffic_main;

architecture Behavioral of traffic_main is

	component clock_divider
		Port ( clk : in  STD_LOGIC;
				 rst : in std_logic;
				 sout : out  STD_LOGIC
			  );
	end component;
	
	component traffic_state
		Port ( clk : in  STD_LOGIC;
				rst: in std_logic;
				a : out  STD_LOGIC_VECTOR (2 downto 0);
				b : out  STD_LOGIC_VECTOR (2 downto 0)
			  );
	end component;
	
	signal clk_1Hz	:std_logic:='0';

begin

	CD0 : clock_divider port map (
		clk 	=> clk,
		rst	=>rst,
		sout	=>clk_1Hz
		);
	TS0 : traffic_state port map (
		clk 	=> clk_1Hz,
		rst =>rst,
		a	=>a,
		b	=>b
		);

end Behavioral;

