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

    signal etat_reg,etat_next : Statetype;
    signal count_reg,count_next     :integer:=0;
[09:40]
begin
    process(etat_reg,count_reg)
        begin
              case etat_reg is
                    when E0 => a <="100"; b<="001";count_next <= count_reg+1;
                                if count_reg>4 and count_reg<6 then etat_next<=E1;
                                else etat_next<=E0; end if;
                    when E1 => a <="010"; b<="001";count_next <= count_reg+1;
                                if count_reg>5 and count_reg<7 then etat_next<=E2;
                                else etat_next<=E1; end if;
                    when E2 => a <="001"; b<="001";count_next <= count_reg+1;
                                if count_reg>6 and count_reg<8 then etat_next<=E3;
                                else etat_next<=E2; end if;
                    when E3 => a <="001"; b<="100";count_next<= count_reg+1;
                                if count_reg>11 and count_reg<13 then etat_next<=E4;
                                else etat_next<=E3; end if;
                    when E4 => a <="001"; b<="010";count_next <= count_reg+1;
                                if count_reg>12 and count_reg<14 then etat_next<=E5;
                                else etat_next<=E4; end if;
                    when E5 => a <="001"; b<="001";count_next <= count_reg+1;
                                if count_reg>13 then etat_next<=E0;count_next <=0 ;
                                else etat_next<=E5; end if; 
              end case;
    end process;
process (clk,rst)
begin
        if rst='1' then
            etat_reg <=E0;
            count_reg<=0;
        else if clk'event and clk = '1' then
            etat_reg <=etat_next;
            count_reg <=count_next;
        end if;
    end if;
end process;
end Behavioral;
