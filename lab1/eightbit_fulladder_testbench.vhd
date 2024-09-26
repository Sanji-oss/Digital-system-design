library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_tb is end Adder_tb;

architecture Behavioral of Adder_tb is
    component eightbit_adder
        Port (
            A, B: in  std_logic_vector(7 downto 0);
            Ci: in std_logic;
            S: out std_logic_vector(7 downto 0);
            Co: out std_logic);
    end component;
    signal AT, BT, Sum: std_logic_vector(7 downto 0);
    signal Cout, Cin: std_logic;

begin
    U2: eightbit_adder port map (A=>AT, B=>BT, Ci=>Cin, S=>Sum, Co=>Cout);
    process
    begin
        Cin <= '0';
        AT <= "00000001"; -- 1
        BT <= "00000001"; -- 1
        wait for 100 ns;
        AT <= "11111111"; -- 255
        BT <= "00000001"; -- 1
        wait for 100 ns;
        AT <= "10101010"; -- 170
        BT <= "01010101"; -- 85 
        wait for 100 ns;
        AT <= "01100100"; --100
        BT <= "01100100"; --100
        wait for 100 ns;
        AT <= "00111000"; --56
        BT <= "00101100"; --44
        wait;
    end process;
end Behavioral;
