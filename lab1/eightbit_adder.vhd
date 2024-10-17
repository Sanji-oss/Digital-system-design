library ieee;
use ieee.std_logic_1164.all;
entity eightbit_adder is
    port (
        A , B : in std_logic_vector(7 downto 0);
        Ci: in std_logic;
        S : out std_logic_vector(7 downto 0);
        Co: out std_logic);
end eightbit_adder;
architecture structural of eightbit_adder is 
component full_adder
port (
    A, B, Ci: in std_logic;
    S, Co: out std_logic);
end component;
signal c: std_logic_vector(6 downto 0);
begin
    FA1: full_adder port map (A(0), B(0), Ci, S(0), c(0));
    FA2: full_adder  port map( A(1), B(1), c(0), S(1), c(1));
    FA3: full_adder  port map( A(2), B(2), c(1), S(2), c(2));
    FA4: full_adder  port map( A(3), B(3), c(2), S(3), c(3));
    FA5: full_adder  port map( A(4), B(4), c(3), S(4), c(4));
    FA6: full_adder  port map( A(5), B(5), c(4), S(5), c(5));
    FA7: full_adder  port map( A(6), B(6), c(5), S(6), c(6));
    FA8: full_adder  port map( A(7), B(7), c(6), S(7), Co);
end structural;
