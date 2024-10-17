library ieee;
use ieee.std_logic_1164.all;

entity srg_4 is 
port(clk, reset, SI: in std_logic;
     Q: out std_logic_vector(3 downto 0);
     SO: out std_logic);
end srg_4;

architecture behavioral of srg_4 is
    signal shift: std_logic_vector(3 downto 0);
    begin
        process(reset, clk)
    begin 
        if (reset='1') then shift<= "0000";
        elsif (clk' event and (clk='1')) then shift <= shift(2 downto 0) & SI;
        end if;
        end process;
        Q<=shift;
        SO<=shift(3);
end behavioral;
