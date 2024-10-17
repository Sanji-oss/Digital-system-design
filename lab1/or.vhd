library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port ( A, B : in std_logic;
           OUT : out std_logic );
end OR_Gate;

architecture or_arch of OR_Gate is
begin
    OUT <= A or B;
end or_arch;
