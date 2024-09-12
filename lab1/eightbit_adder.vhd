-- library ieee;
-- use ieee.std_logic_1164.all;


-- entity eightbit_adder is
--     port (
--         A , B : in std_logic_vector(7 downto 0);Cin in std_logic;
--         S : out std_logic_vector(7 downto 0);Cout out std_logic);
-- end eightbit_adder;

-- architecture behavioral of eightbit_adder is 

-- component full_adder
-- port (
--     A, B, Cin : in std_logic;
--     S, Cout : out std_logic);
-- end component;

-- signal c : std_logic_vector(6 downto 0);

-- begin
--     FA1: fulladder port map (A(0), B(0), Cin, S(0), c(0));
--     FA2: fulladder  port map( A(1), B(1), c(0), S(1), c(1));
--     FA3: fulladder  port map( A(2), B(2), c(1), S(2), c(2));
--     FA4: fulladder  port map( A(3), B(3), c(2), S(3), c(3));
--     FA5: fulladder  port map( A(4), B(4), c(3), S(4), c(4));
--     FA6: fulladder  port map( A(5), B(5), c(4), S(5), c(5));
--     FA7: fulladder  port map( A(6), B(6), c(5), S(6), c(6));
--     FA8: fulladder  port map( A(7), B(7), c(6), S(7), Cout);
-- end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eightbit_adder is
    Port (
        a     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input a
        b     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit input b
        cin   : in  STD_LOGIC;                     -- Carry input
        sum   : out STD_LOGIC_VECTOR(7 downto 0);  -- 8-bit sum output
        cout  : out STD_LOGIC                      -- Carry output
    );
end eightbit_adder;

architecture Behavioral of eightbit_adder is
    signal temp: UNSIGNED(8 downto 0); -- 9-bit unsigned temporary signal to store result
begin
    process(a, b, cin)
    begin
        -- Convert inputs to UNSIGNED and perform addition
        temp <= UNSIGNED('0' & a) + UNSIGNED('0' & b) + UNSIGNED("00000000" & cin);

        -- Assign sum and cout outputs
        sum <= STD_LOGIC_VECTOR(temp(7 downto 0)); -- Convert the result back to STD_LOGIC_VECTOR for sum
        cout <= temp(8); -- 9th bit as the carry-out
    end process;
end Behavioral;
