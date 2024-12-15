library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_cnt is 
    port(
        clk  : in std_logic;
        rst  : in std_logic;
        en   : in std_logic;
        cntr : out std_logic_vector(7 downto 0)
    );
end s_cnt;

architecture rtl of s_cnt is 
    signal ff: unsigned(7 downto 0) := (others => '0');
begin 
    process(clk, rst)
    begin 
        if rst = '0' then      
            ff <= (others => '0');
        elsif rising_edge(clk) then   
            if en = '1' then 
                ff <= ff + 1;
            end if;
        end if;
    end process;
    cntr <= std_logic_vector(ff);
end rtl;