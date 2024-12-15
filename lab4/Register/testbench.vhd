library ieee;
use ieee.std_logic_1164.all;

entity tb_rg_4 is
end tb_rg_4;

architecture behavior of tb_rg_4 is

    signal clk   : std_logic := '0';
    signal clear : std_logic := '1';
    signal D     : std_logic_vector(3 downto 0);
    signal Q     : std_logic_vector(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    UUT: entity work.rg_4
        port map (
            clk => clk,
            clear => clear,
            D => D,
            Q => Q
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
        clear <= '0';
        wait for 20 ns;

        clear <= '1';
        D <= "1010"; 
        wait for 10 ns;

        D <= "1100"; 
        wait for 10 ns;

        clear <= '0';  
        wait for 10 ns;
        clear <= '1';
        D <= "0111"; 
        wait for 10 ns;

        wait;
    end process;

end behavior;
