library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prime2 is
   port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
          F: out STD_LOGIC);
end prime2;

architecture prime2_arch_datafl of prime2 is
begin
   -- Dataflow description using Boolean equations\
with N select	
  F <= '1' when "0011",
 	'1' when "0110", 
	'1' when "1001" | "1100" | "1111",
	 '0' when others;
end prime2_arch_datafl;