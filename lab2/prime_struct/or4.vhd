library ieee;
use ieee.std_logic_1164.all;

entity OR4 is 
port (
    in1: in std_logic;
    in2: in std_logic;
    in3: in std_logic;
    in4: in std_logic;
    out1: out std_logic);
end OR4;

architecture and_arch of OR4 is 
begin
    out1 <= in1 or in2 or in3 or in4;
end and_arch;