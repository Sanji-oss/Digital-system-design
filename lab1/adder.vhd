-- Comments in VHDL start with --
 -- Ying Li
 -- A full adder
 -- import useful packages
library ieee;
use ieee.std_logic_1164.all; -- provide enhanced signal types
-- filename must be the same as entity name
-- entity defines the inputs and outputs of the circuit 
entity adder is
-- A, B, Ci are inputs
-- S and Co are the outputs
port (
    A, B, Ci : in std_logic; -- std_logic represent one bit signal 
    S, Co: out std_logic -- that can take on the value 0 or 1 
    );
end adder;
 -- architecture define the circuit
architecture behavior of adder is 
begin
    -- statements in the architecture enclosed by begin and end are executed concurrently -- compute the sum
    s <= A xor B xor ci; -- <= assign the result of A xor B xor ci to s
    -- compute the carry
    co <= (A and B) or ((a xor b) and ci); -- VHDL is case-insensitive 
end behavior;