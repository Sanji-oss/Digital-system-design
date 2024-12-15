library ieee;
use ieee.std_logic_1164.all;

entity tb_srg_4 is
end tb_srg_4;

architecture behavior of tb_srg_4 is
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal SI     : std_logic := '0';
    signal Q      : std_logic_vector(3 downto 0);
    signal SO     : std_logic;
    constant clk_period : time := 10 ns;

begin
    UUT: entity work.srg_4
        port map (
            clk => clk,
            reset => reset,
            SI => SI,
            Q => Q,
            SO => SO
        );
    clk_process : process
    begin
        while now < 100 ns loop  
            clk <= '0';
            wait for clk_period ;
            clk <= '1';
            wait for clk_period;
        end loop;
        wait; 
    end process;

    stim_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        SI <= '1';  
        wait for 10 ns;

        SI <= '0';  -- Shift in '0'
        wait for 10 ns;

        SI <= '1';  -- Shift in '1'
        wait for 10 ns;

        SI <= '1';  -- Shift in '1'
        wait for 10 ns;

        SI <= '0';  -- Shift in '0'
        wait for 10 ns;
        wait for 30 ns;

        wait;
    end process;

end behavior;
