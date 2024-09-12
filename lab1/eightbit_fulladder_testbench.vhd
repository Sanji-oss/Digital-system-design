-- library ieee;
-- use ieee.std_logic_1164.all;

-- entity eightbit_fulladder_testbench is
-- end eightbit_fulladder_testbench;

-- architecture behavior of eightbit_fulladder_testbench is


--     component eightbit_fulladder
--     port(
--         A: in std_logic_vector(7 downto 0);
--         B: in std_logic_vector(7 downto 0);
--         Cin: in std_logic;
--         S: out std_logic_vector(7 downto 0);
--         Cout: out std_logic
--     )end component;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_tb is
end Adder_tb;

architecture Behavioral of Adder_tb is
    -- Component Declaration for the Adder
    component Adder
        Port (
            A       : in  STD_LOGIC_VECTOR(7 downto 0);
            B       : in  STD_LOGIC_VECTOR(7 downto 0);
            Sum     : out STD_LOGIC_VECTOR(7 downto 0);
            CarryOut: out STD_LOGIC
        );
    end component;

    -- Test signals
    signal A, B, Sum : STD_LOGIC_VECTOR(7 downto 0);
    signal CarryOut  : STD_LOGIC;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Adder port map (
        A => A,
        B => B,
        Sum => Sum,
        CarryOut => CarryOut
    );

    -- Stimulus Process
    process
    begin
        -- Test Case 1
        A <= "00000001"; -- 1
        B <= "00000001"; -- 1
        wait for 10 ns;
        assert (Sum = "00000010" and CarryOut = '0')
        report "Test Case 1 failed" severity error;

        -- Test Case 2
        A <= "11111111"; -- 255
        B <= "00000001"; -- 1
        wait for 10 ns;
        assert (Sum = "00000000" and CarryOut = '1')
        report "Test Case 2 failed" severity error;

        -- Test Case 3
        A <= "10101010"; -- 170
        B <= "01010101"; -- 85
        wait for 10 ns;
        assert (Sum = "11111111" and CarryOut = '0')
        report "Test Case 3 failed" severity error;

        -- Test Case 4
        A <= "01111111"; -- 127
        B <= "00000001"; -- 1
        wait for 10 ns;
        assert (Sum = "10000000" and CarryOut = '0')
        report "Test Case 4 failed" severity error;

        -- Test Case 5
        A <= "11011011"; -- 219
        B <= "00100101"; -- 37
        wait for 10 ns;
        assert (Sum = "11111111" and CarryOut = '0')
        report "Test Case 5 failed" severity error;

        wait; -- Wait forever
    end process;
end Behavioral;
