library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_s_cnt is
end tb_s_cnt;

architecture behavior of tb_s_cnt is

    component s_cnt
        port(
            clk  : in std_logic;
            rst  : in std_logic;
            en   : in std_logic;
            cntr : out std_logic_vector(7 downto 0)
        );
    end component;

    signal clk  : std_logic := '0';
    signal rst  : std_logic := '0';
    signal en   : std_logic := '0';
    signal cntr : std_logic_vector(7 downto 0);
    constant clk_period : time := 10 ns;

begin
    uut: s_cnt port map (
        clk  => clk,
        rst  => rst,
        en   => en,
        cntr => cntr
    );

    clk_process :process
    begin
        while now < 480  ns loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    stim_proc: process
    begin
        rst <= '0';
        wait for 20 ns;
        
        rst <= '1'; 
        wait for 10 ns;
        
        en <= '1';
        wait for 200 ns;
        
        en <= '0';
        wait for 50 ns;
        
        en <= '1';
        wait for 200 ns;

        wait;
    end process;

end behavior;