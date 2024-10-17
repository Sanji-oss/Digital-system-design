library ieee;
use ieee.std_logic_1164.all;

entity or5 is 
port(in1: in std_logic;
     in2: in std_logic;
     in3: in std_logic;
     in4: in std_logic;
     in5: in std_logic;
     out1: out std_logic);
end or5;

architecture or5_arch of or5 is
begin
    out1 <= in1 or in2 or in3 or in4 or in5;
end or5_arch;