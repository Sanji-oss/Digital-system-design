library ieee;
use ieee.std_logic_1164.all;

-- entity full_adder is port (
--     A, B, Ci : in std_logic;
--     S, Co: out std_logic);
-- end full_adder;

-- architecture structural of full_adder is 
-- begin
--     s <= A xor B xor Ci;
--     co <= (A and B) or (Ci and (A xor B));
-- end structural;

entity full_adder is port(
    A, B, Ci : in std_logic;
    S, Co: std_logic);
end full_adder;

architecture adder_arch of full_adder is

    signal IN1, IN2, IN3 :std_logic;

    component xor_gate port map(A: std_logic, B: std_logic, IN1: std_logic);
    component and_gate port map(A: std_logic, B: std_logic, IN2: std_logic);
    component xor_gate port map(Ci: std_logic, IN1: std_logic, S: std_logic);
    

begin

end adder_arch ; -- adder_arch
