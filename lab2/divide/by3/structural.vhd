library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity boolean_function is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           F : out STD_LOGIC);
end boolean_function;

architecture Structural of boolean_function is

    -- Intermediate signals for NOT gates
    signal A_bar, B_bar, C_bar, D_bar : STD_LOGIC;
    
    -- Intermediate signals for AND and OR results
    signal CD, BD_bar, CD_or_BD_bar : STD_LOGIC;
    signal A_bar_and_CD_or_BD_bar : STD_LOGIC;
    signal AB_barC_bar : STD_LOGIC;
    signal ABCD : STD_LOGIC;

begin

    -- NOT gates
    A_bar <= not A;
    B_bar <= not B;
    C_bar <= not C;
    D_bar <= not D;

    -- AND gates
    CD <= C and D;                        -- for CD
    BD_bar <= B and D_bar;                -- for BD̅
    AB_barC_bar <= A and B_bar and C_bar;  -- for AB̅C̅
    ABCD <= A and B and C and D;           -- for ABCD

    -- OR gate for CD + BD̅
    CD_or_BD_bar <= CD or BD_bar;

    -- AND gate for A̅(CD + BD̅)
    A_bar_and_CD_or_BD_bar <= A_bar and CD_or_BD_bar;

    -- OR gate to combine the terms
    F <= A_bar_and_CD_or_BD_bar or AB_barC_bar or ABCD;

end Structural;
