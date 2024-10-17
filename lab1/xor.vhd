library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_Gate is
    Port ( A, B : in std_logic;
           OUT : out std_logic );
end XOR_Gate;

architecture xor_arch of XOR_Gate is
begin
    OUT <= A xor B;
end xor_arch;
