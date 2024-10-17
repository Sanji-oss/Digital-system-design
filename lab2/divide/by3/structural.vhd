library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider is
    port ( N: in  STD_LOGIC_VECTOR(3 DOWNTO 0);
          F: out STD_LOGIC);
end divider;

architecture divider_arch of divider is
    signal notand_a, notand_b, notand_c, notand_d:std_logic;
    signal out_a, out_b, out_c, out_d, out_e:std_logic;
    component INV
      port(in1: in STD_LOGIC; out1: out STD_LOGIC);
   end component;
   component and4
      port(in1, in2, in3, in4: in STD_LOGIC; out1: out STD_LOGIC);
   end component;
   component or5
      port(in1, in2, in3, in4, in5: in STD_LOGIC; out1: out STD_LOGIC);
   end component;
begin
    U1: INV port map(N(0), notand_a);
    U2: INV port map(N(1), notand_b);
    U3: INV port map(N(2), notand_c);
    U4: INV port map(N(3), notand_d);
    
    F1: and4 port map(notand_a, notand_b, N(2), N(3), out_a);
    F2: and4 port map(notand_a, N(1), N(2), notand_d, out_b);
    F3: and4 port map(N(0), notand_b, notand_c, N(3), out_c);
    F4: and4 port map(N(0), N(1), notand_c, notand_d, out_d);
    F5: and4 port map(N(0), N(1), N(2), N(3), out_e);

    E1: or5 port map(out_a, out_b, out_c, out_d, out_e, F);
end divider_arch;
