-- Ying Li
 -- A testbench for the full adder
 library ieee;
 use ieee.std_logic_1164.all;
 -- A testbench has no ports
entity addertest is end addertest;
architecture behavior of addertest is
-- Declaration of the component that will be instantiated 
component adder
        port(
             A, B, Ci: in std_logic;
             S, Co: out std_logic
        );
     end component;
     -- the adder signals
     signal I0, I1, I2, O0, O1 : std_logic;
begin
-- component instantiation
-- connect the inputs and outputs of the entity to the local signals 
    adder1 : adder port map (A=>I0, B=>I1, Ci=>I2, Co=>O0, S=>O1);
    I0 <= '0', '1' after 4 ns; -- send signals to port a, the signal is 0 in the first 4 ns and 1 afterward
            I1 <= '0', '1' after 2 ns, '0' after 4 ns, '1' after 6 ns;
            I2 <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5
     ns, '0' after 6 ns, '1' after 7 ns, '0' after 8 ns;
end behavior;