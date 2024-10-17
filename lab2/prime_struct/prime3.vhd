library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prime3 is
   port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
          F: out STD_LOGIC);
end prime3;

architecture prime_arch_beh of prime3 is
   function CONV_INTEGER (X: STD_LOGIC_VECTOR) return INTEGER is
      variable RESULT: INTEGER := 0;
   begin
      for i in X'range loop
         RESULT := RESULT * 2;
         if X(i) = '1' then
            RESULT := RESULT + 1;
         end if;
      end loop;
      return RESULT;
   end function;

begin
   process(N)
      variable NI: INTEGER;
   begin
      NI := CONV_INTEGER(N);
      if NI = 2 or NI = 3 or NI = 5 or NI = 7 or NI = 11 or NI = 13 then
         F <= '1';
      else
         F <= '0';
      end if;
   end process;
end prime_arch_beh;