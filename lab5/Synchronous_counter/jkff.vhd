library ieee;
use ieee.std_logic_1164.all;

entity jkff is
    port(clk, rst, j, k:in std_logic;
        q, qn          :out std_logic);
end jkff;

architecture rtl of jkff is 
    signal ff:std_logic:= '0';
begin 
    process(clk, rst)
        variable jk: std_logic_vector(1 downto 0);
    begin
        if(rst = '0') then 
            ff<= '0';
        elsif (clk'event and clk='1') then
            jk:= j & k;
            case jk is 
                when "01" => ff <='0';
                when "10" => ff <='1';
                when "11" => ff <=not ff;
                when others => ff <=ff;
            end case;
        end if;
    end process;
    q <= ff after 1 ns;
    qn <= not ff after 1 ns;
end rtl;
