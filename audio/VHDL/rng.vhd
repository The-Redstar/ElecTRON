library IEEE;
use IEEE.std_logic_1164.ALL;

entity rng is
	port(	clk			: in  std_logic;
			reset		: in  std_logic;
			bits		: out std_logic_vector(3 downto 0));
end rng;

