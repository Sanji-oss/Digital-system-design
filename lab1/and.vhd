library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate is
    Port ( A, B : in std_logic;
           OUT : out std_logic );
end AND_Gate;

architecture and_arch of AND_Gate is
begin
    OUT <= A and B;
end and_arch;
