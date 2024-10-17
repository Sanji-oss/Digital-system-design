library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity prime1 is
   port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
          F: out STD_LOGIC);
end prime1;

architecture prime_arch_struct of prime1 is
   signal N3_L, N2_L, N1_L: STD_LOGIC;
   signal N3L_N0, N3L_N2L_N1, N2L_N1_N0, N2_N1L_N0: STD_LOGIC;
   component INV
      port(In1: in STD_LOGIC; Out1: out STD_LOGIC);
   end component;
   component AND2
      port(In1, In2: in STD_LOGIC; Out1: out STD_LOGIC);
   end component;
   component AND3
      port(In1, In2, In3: in STD_LOGIC; Out1: out STD_LOGIC);
   end component;
   component OR4
      port(In1, In2, In3, In4: in STD_LOGIC; Out1: out STD_LOGIC);
   end component;
begin
   U1: INV port map (N(3), N3_L);
   U2: INV port map (N(2), N2_L);
   U3: INV port map (N(1), N1_L);
   U4: AND2 port map (N3_L, N(0), N3L_N0);
   U5: AND3 port map (N3_L, N2_L, N(1), N3L_N2L_N1);
   U6: AND3 port map (N2_L, N(1), N(0), N2L_N1_N0);
   U7: AND3 port map (N(2), N1_L, N(0), N2_N1L_N0);
   U8: OR4 port map (N3L_N0, N3L_N2L_N1, N2L_N1_N0, N2_N1L_N0, F);
end prime_arch_struct;