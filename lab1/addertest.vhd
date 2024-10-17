library ieee;
use ieee.std_logic_1164.all;

entity addertest is end addertest;
architecture structural of addertest is
     component full_adder port(
               A, B, Ci: in std_logic;
               S, Co: out std_logic);
     end component;
     signal AT, BT, Cin:  std_logic;
     signal  Sum, Cout: std_logic;
begin
     U1: full_adder port map(A=>At, B=>Bt, Ci=>Cin, S=>Sum, Co=>Cout);
     process
     begin
          AT <= '1';BT <= '1';Cin <= '1';
          wait for 100 ns; 
          AT <= '1';BT <= '1';Cin <= '0';
          wait for 100 ns; 
          AT <= '1';BT <= '0';Cin <= '1';
          wait for 100 ns;
          AT <= '1';BT <= '0';Cin <= '0';
          wait for 100 ns;
          AT <= '0';BT <= '1';Cin <= '1';
          wait for 100 ns;   
          AT <= '0';BT <= '1';Cin <= '0';
          wait for 100 ns;
          AT <= '0';BT <= '0';Cin <= '1';
          wait for 100 ns;
          AT <= '0';BT <= '0';Cin <= '0';
          wait ;
    end process;
end structural;