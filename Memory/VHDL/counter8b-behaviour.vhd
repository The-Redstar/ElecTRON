library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of counter8b is
	signal new_count : unsigned(7 downto 0);
	signal lstcnt    : unsigned(7 downto 0);
begin
	count_process: process(clk, rst)
	begin
		if rst = '1' then
			lstcnt <= "00000000";
		elsif rising_edge(clk) then
			lstcnt <= new_count;
		else
			lstcnt <= lstcnt;
		end if;
	end process;

	new_count <= lstcnt + 1;
	countOUT <= std_logic_vector(lstcnt);
end behaviour;

