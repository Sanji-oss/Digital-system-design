library ieee;
use ieee.std_logic_1164.all;

entity tb_srg_4 is
end tb_srg_4;

architecture behavior of tb_srg_4 is
    -- Signal declarations for inputs and outputs
    signal clk    : std_logic := '0';
    signal reset  : std_logic := '0';
    signal SI     : std_logic := '0';
    signal Q      : std_logic_vector(3 downto 0);
    signal SO     : std_logic;
    
    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: entity work.srg_4
        port map (
            clk => clk,
            reset => reset,
            SI => SI,
            Q => Q,
            SO => SO
        );

    -- Clock generation process
    clk_process : process
    begin
        while now < 100 ns loop  -- Run the clock for 100 ns
            clk <= '0';
            wait for clk_period ;
            clk <= '1';
            wait for clk_period;
        end loop;
        wait;  -- Stop the clock after 100 ns
    end process;

    -- Stimulus process to provide inputs
    stim_process : process
    begin
        -- Apply reset
        reset <= '1';
        wait for 20 ns;
        reset <= '0';  -- Deassert reset

        -- Apply test stimulus to SI
        SI <= '1';  -- Load first '1' into the shift register
        wait for 10 ns;

        SI <= '0';  -- Shift in '0'
        wait for 10 ns;

        SI <= '1';  -- Shift in '1'
        wait for 10 ns;

        SI <= '1';  -- Shift in '1'
        wait for 10 ns;

        SI <= '0';  -- Shift in '0'
        wait for 10 ns;

        -- Continue running for a bit to observe SO behavior
        wait for 30 ns;

        wait;
    end process;

end behavior;
