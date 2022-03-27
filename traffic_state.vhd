library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_state is
    Port ( clk : in  STD_LOGIC;
			  rst : in std_logic;
           a : out  STD_LOGIC_VECTOR (2 downto 0);
           b : out  STD_LOGIC_VECTOR (2 downto 0));
end traffic_state;

architecture Behavioral of traffic_state is

	

	type Statetype is(E0,E1,E2,E3,E4,E5);

	signal etat : Statetype;
	signal count 	:integer:=1;


	
begin
	process(clk)
		begin
			if clk' event and clk='1' then
				if rst = '1' then
					etat <= E0;
					count <= 0;
				end if;
				
				case etat is
				
					when E0 => a <="100"; b<="001";count <= count+1;
								if count>4 and count<6 then etat<=E1;
								else etat<=E0; end if;
					when E1 => a <="010"; b<="001";count <= count+1;
								if count>5 and count<7 then etat<=E2;
								else etat<=E1; end if;
					when E2 => a <="001"; b<="001";count <= count+1;
								if count>6 and count<8 then etat<=E3;
								else etat<=E2; end if;
					when E3 => a <="001"; b<="100";count <= count+1;
								if count>11 and count<13 then etat<=E4;
								else etat<=E3; end if;
					when E4 => a <="001"; b<="010";count <= count+1;
								if count>12 and count<14 then etat<=E5;
								else etat<=E4; end if;
					when E5 => a <="001"; b<="001";count <= count+1;
								if count>13 then etat<=E0;count <=0 ;
								else etat<=E5; end if; 
				end case;
			end if;
	end process;
		

end Behavioral;

