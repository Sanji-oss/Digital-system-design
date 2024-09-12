library ieee;
use ieee.std_logic_1164.all;

entity AND3 is 
port (
    in1: in std_logic;
    in2: in std_logic;
    in3: in std_logic;
    out1: out std_logic);
end AND3;

architecture and_arch of AND3 is 
begin
    out1 <= in1 and in2 and in3;
end and_arch;