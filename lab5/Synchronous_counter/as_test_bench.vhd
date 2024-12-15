library ieee;
use ieee.std_logic_1164.all;

entity tb_as_cnt is
end tb_as_cnt;

architecture behavior of tb_as_cnt is

    -- Component Declaration for the Unit Under Test (UUT)
    component as_cnt
        port(
            rst   : in std_logic;
            a_clk : in std_logic;
            cntr  : out std_logic_vector(3 downto 0)
        );
    end component;

    -- Signals to connect to the UUT
    signal rst   : std_logic := '0';
    signal a_clk : std_logic := '0';
    signal cntr  : std_logic_vector(3 downto 0);

    -- Clock period definition
    constant clk_period : time :=20 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: as_cnt
        port map (
            rst   => rst,
            a_clk => a_clk,
            cntr  => cntr
        );

    -- Clock process definitions
    clk_process :process
    begin
        while now < 440 ns loop  -- Set simulation time limit to 200 nanoseconds
            a_clk <= '0';
            wait for clk_period/2;
            a_clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;  -- Stop the simulation
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        rst <= '1';
        wait for 100 ns;
        
        rst <= '0';  -- Release reset
        wait for 10 ns;
        
        rst <= '1';  -- Assert reset again
        wait for 320 ns;
        
        rst <= '0';  -- Release reset
        wait for 10 ns;
        
        -- Add more stimulus as needed
        wait;  -- Wait indefinitely
    end process;

end behavior;