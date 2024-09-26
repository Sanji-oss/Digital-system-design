library ieee;
use ieee.std_logic_1164.all;

entity full_adder is port (
    A, B, Ci : in std_logic;
    S, Co: out std_logic);
end full_adder;

architecture behavior of full_adder is 
begin
    s <= A xor B xor Ci;
    co <= (A and B) or (Ci and (A xor B));
end behavior;