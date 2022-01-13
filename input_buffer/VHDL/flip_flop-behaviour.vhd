library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of flip_flop is
begin
   reg: process(clk)
      begin
         if rising_edge(clk) then
            if rst = '1' then
               output <= (others => '0');
            else
               output <= input;
            end if;
	end if;
   end process;
end behaviour;
