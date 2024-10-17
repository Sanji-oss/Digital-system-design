library IEEE;
  use IEEE.std_logic_1164.all;

entity DFFs is
  port (D, Clock, Reset, Enable : in  std_logic;
        Q1, Q2, Q3, Q4          : out std_logic);
end entity;

architecture dff_behav of DFFs is
begin
  process (clock) -- өсөх фронтоор төлвөө солидог(positive edge triggered) D флип-флоп
  begin
    if (clock'EVENT and clock = '1') then
      Q1 <= D;
    end if;
  end process;

  process (clock) -- Синхрон reset-тэй
  begin -- өсөх фронтоор төлвөө солидог(positive edge triggered) D флип-флоп
    if (clock'EVENT and clock = '1') then
      if Reset = '1' then
        Q2 <= '0';
      else
        Q2 <= D;
      end if;
    end if;
  end process;

  process (clock, Reset) -- Асинхрон reset- тэй
  begin -- өсөх фронтоор төлвөө солидог(positive edge triggered) D флип-флоп
    if Reset = '1' then
      Q3 <= '0';
    elsif (clock'EVENT and clock = '1') then
      Q3 <= D;
    end if;
  end process;

  process (clock, Reset) -- Асинхрон reset болон зөвшөөрөх сигнал (enable)-тай
  begin -- өсөх фронтоор төлвөө солидог(positive edge triggered) D флип-флоп
    if Reset = '1' then
      Q4 <= '0';
    elsif (clock'EVENT and clock = '1') then
      if Enable = '1' then
        Q4 <= D;
      end if;
    end if;
  end process;
end architecture;
