library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of counter8b is
	signal count, new_count : unsigned(7 downto 0);
begin
	count_process: process(clk, rst)
	begin
		if rst = '1' then
			count <= (others => '0');
		elsif rising_edge(clk) then
			count <= new_count;
		end if;
	
	end process;

	new_count <= count + 1;
	count_out <= std_logic_vector(count);
end behaviour;

