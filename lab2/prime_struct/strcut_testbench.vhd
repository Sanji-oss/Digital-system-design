library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prime_tb is
end prime_tb;

architecture prime_tb_arch of prime_tb is
   component prime1
      port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
             F: out STD_LOGIC);
   end component;
   component prime2
      port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
             F: out STD_LOGIC);
   end component;
   component prime3
      port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
             F: out STD_LOGIC);
   end component;
   component prime4
      port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
             F: out STD_LOGIC);
   end component;

   signal NT : STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal FT1, FT2, FT3, FT4: STD_LOGIC;
begin
   UU1: prime1 port map (NT, FT1);
   UU2: prime1 port map (NT, FT2);
   UU3: prime1 port map (NT, FT3);
   UU4: prime1 port map (NT, FT4);
   process
   begin
      NT <= "0000"; wait for 10 ns;
      NT <= "0001"; wait for 10 ns;
      NT <= "0010"; wait for 10 ns;
      NT <= "0011"; wait for 10 ns;
      NT <= "0100"; wait for 10 ns;
      NT <= "0101"; wait for 10 ns;
      NT <= "0110"; wait for 10 ns;
      NT <= "0111"; wait for 10 ns;
      NT <= "1000"; wait for 10 ns;
      NT <= "1001"; wait for 10 ns;
      NT <= "1010"; wait for 10 ns;
      NT <= "1011"; wait for 10 ns;
      NT <= "1100"; wait for 10 ns;
      NT <= "1101"; wait for 10 ns;
      NT <= "1110"; wait for 10 ns;
      NT <= "1111"; wait for 10 ns;
      wait;
   end process;
end prime_tb_arch;