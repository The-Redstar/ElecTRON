library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg_11 is
begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				q <= "00000000000";
			elsif (e = '1') then
				q <= d;
			end if;
		end if;
	end process;

end behaviour;

