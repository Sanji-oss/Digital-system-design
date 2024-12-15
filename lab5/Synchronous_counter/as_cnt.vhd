library ieee;
use ieee.std_logic_1164.all;

entity as_cnt is 
    port(rst, a_clk: in std_logic;
         cntr      : out std_logic_vector(3 downto 0));
end as_cnt;

architecture rtl of as_cnt is 
    component jkff port(clk, rst, j, k:in std_logic;
                        q, qn          :out std_logic);
    end component;
    signal ffq: std_logic_vector(4 downto 0) := "00000";
    signal ffqn: std_logic_vector(4 downto 0):= "11111";
    signal vdd: std_logic:= '1';
begin 
    vdd <= '1'; ffqn(0) <= a_clk;
    jk0: for j in 1 to 4 generate 
        uu0: jkff port map (clk => ffqn(j-1), rst => rst,   
                j => vdd, k => vdd, q => ffq(j), qn => ffqn(j));
    end generate;
    cntr <= ffq(4 downto 1);
end rtl;