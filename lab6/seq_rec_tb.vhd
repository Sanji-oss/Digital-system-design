library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_seq_rec is
end tb_seq_rec;

architecture behavior of tb_seq_rec is

    -- Component Declaration for the Unit Under Test (UUT)
    component seq_rec
    port(
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         X : in STD_LOGIC;
         Z : out STD_LOGIC
        );
    end component;

    -- Inputs
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal X : STD_LOGIC := '0';

    -- Outputs
    signal Z : STD_LOGIC;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: seq_rec port map (
          clk => clk,
          reset => reset,
          X => X,
          Z => Z
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        
        -- Test sequence
        X <= '0'; wait for 20 ns;
        X <= '1'; wait for 20 ns;
        X <= '1'; wait for 20 ns;
        X <= '0'; wait for 20 ns;
        X <= '1'; wait for 20 ns;
        X <= '0'; wait for 20 ns;
        X <= '1'; wait for 20 ns;
        X <= '1'; wait for 20 ns;
        
        -- Add more test cases as needed
        wait;
    end process;

end behavior;