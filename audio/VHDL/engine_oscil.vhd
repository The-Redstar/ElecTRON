library IEEE;
use IEEE.std_logic_1164.ALL;

entity engine_oscil is
	port(	clk			: in  std_logic;
			reset		: in  std_logic;
			audio_clk	: in  std_logic;
			step_clk	: in  std_logic;
			player		: in  std_logic;
			dir			: in  std_logic_vector(1 downto 0);
			boost		: in  std_logic;
			wave		: out std_logic);
end engine_oscil;

