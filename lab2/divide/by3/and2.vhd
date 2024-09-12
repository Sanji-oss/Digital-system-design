library ieee;
use ieee.std_logic_1164.all;

entity AND2 is 
port (
    in1: in std_logic;
    in2: in std_logic;
    out1: out std_logic);
end AND2;

architecture and_arch of AND2 is 
begin
    out1 <= in1 and in2;
end and_arch;