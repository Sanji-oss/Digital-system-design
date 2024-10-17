library IEEE; 
use IEEE.std_logic_1164.ALL;

entity jk_ff is
port (clock,J,K,reset,preset: in std_logic;
	    Q1,Q2,Q3,Q4: out std_logic);
end jk_ff;

architecture arch_jk_ff of jk_ff is
    signal Q1i,Q2i,Q3i,Q4i: std_logic;
    begin
    process(clock,reset)
    begin
    if reset = '1' then
                Q1i <= '0';
            elsif (clock'EVENT and clock='1') then
                if (J = '0' and K = '1') then
                    Q1i <= '0';
                elsif (J = '1' and K = '0') then
                    Q1i <= '1';
                elsif (J = '1' and K = '1') then
                    Q1i <= not Q1i;
                end if;
            end if;
    Q1 <= Q1i;
    end process;
    process(clock)
    begin
            if (clock'EVENT and clock='1') then
                if reset = '1' then
                    Q2i <= '0';    
                else
                    if (J = '0' and K = '1') then
                        Q2i <= '0';   
                    elsif (J = '1' and K = '0') then
                        Q2i <= '1';
                    elsif (J = '1' and K = '1') then
                        Q2i <= not Q2i;
                    end if;
                end if;
            end if;
    Q2<=Q2i;
    end process;
    process (clock, reset, preset)
    begin
        if reset = '1' then
            Q3i <= '0';
        elsif preset = '1' then
            Q3i <= '1';
        elsif (clock'EVENT and clock='1') then
            if (J = '0' and K = '1') then
                Q3i <= '0';
            elsif (J = '1' and K = '0') then
                Q3i <= '1';
            elsif (J = '1' and K = '1') then
                Q3i <= not Q3i;
            end if;
        end if;
    Q3<=Q3i;
    end process;
    process (clock, reset, preset)
    begin
        if reset = '1' then
            Q4i <= '0';
        elsif preset = '1' then
            Q4i <= '1';
        elsif (clock'EVENT and clock='0') then
            if (J = '0' and K = '1') then
                Q4i <= '0';
            elsif (J = '1' and K = '0') then
                Q4i <= '1';
            elsif (J = '1' and K = '1') then
                Q4i <= not Q4i;
            end if;
        end if;
    Q4<=Q4i;
    end process;
end arch_jk_ff;