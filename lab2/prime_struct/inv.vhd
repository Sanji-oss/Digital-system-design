library ieee;
use ieee.std_logic_1164.all;

entity INV is 
port (
    in1: in std_logic;
    out1: out std_logic);
end INV;

architecture and_arch of INV is 
begin
    out1 <= not in1;
end and_arch;