library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of counter5b is
	signal new_count : unsigned(4 downto 0);
	
begin
	count_process: process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				countOUT <= "00000";
			else
				countOUT <= std_logic_vector(new_count);
			end if;
		end if;
	end process;

	incr_process : process(incr)
	begin
		if incr = '1' then
			new_count <= unsigned(countOUT) + 1;
		else
			new_count <= unsigned(countOUT);
		end if;
	end process;
	
end behaviour;

