library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( clk : in  STD_LOGIC;
           rst : in std_logic;
           sout : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal s_sout: std_logic :='0';
signal count: integer:=0;
signal clk_1hz: std_logic:='0';


begin

process(clk, rst)
begin 
if clk'event and clk = '1' then
clk_1hz <= '1';
count <= count+1;
    if count > 50000000 then
    count <=0;
    clk_1hz <= '0';
    end if;
end if;

if rst = '1' then
count <= 0;
clk_1hz <= '0';
end if;
end process;


process(clk_1hz, rst)
begin
 
if rst = '1' then
s_sout <= '0';
elsif clk_1hz'event and clk_1hz = '1' then
s_sout <= not s_sout;
end if;
end process;

sout <= s_sout;
end Behavioral;
