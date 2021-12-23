library IEEE;
use IEEE.std_logic_1164.ALL;

--shift based noise generator
--as described by https://pages.mtu.edu/~suits/LFSR.html


architecture behaviour of rng is
	signal shifter: std_logic_vector(23 downto 0);
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				shifter <= (others => '0');
			else
				shifter(23 downto 1) <= shifter(22 downto 0);
				shifter(0) <= shifter(6) xnor shifter(15) xnor shifter(21) xnor shifter(23);
			end if;
		end if;
	end process;

	wave <= shifter(23);

end behaviour;

