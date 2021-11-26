library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of counter5b is
	signal new_count : unsigned(4 downto 0);
	
begin
	count_process: process(clk, rst)
	begin
		if rst = '1' then
			countOUT <= "00000";
		elsif rising_edge(clk) then
			countOUT <= std_logic_vector(new_count);
		else
			countOUT <= countOUT;
		end if;
	end process;

	new_count <= unsigned(countOUT) + 1;
	
end behaviour;

