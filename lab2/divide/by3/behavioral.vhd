library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prime3 is
   port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
          F: out STD_LOGIC);
end prime3;

architecture prime_arch_beh of prime3 is
   -- Function to convert STD_LOGIC_VECTOR to INTEGER
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
   -- Behavioral description using a process block
   process(N)
      variable NI: INTEGER;
   begin
      NI := CONV_INTEGER(N);  -- Convert binary input to integer
      if NI = 3 or NI = 6 or NI = 9 or NI = 12 or NI = 15 then
         F <= '1';
      else
         F <= '0';
      end if;
   end process;
end prime_arch_beh;