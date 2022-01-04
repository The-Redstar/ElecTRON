library IEEE;
use IEEE.std_logic_1164.ALL;

entity engine_oscil is
	port(	clk			: in  std_logic;
			reset		: in  std_logic;

			engine		: in  std_logic;
			crash		: in  std_logic;
			beep		: in  std_logic;

			player		: in  std_logic;
			dir			: in  std_logic_vector(1 downto 0);
			boost		: in  std_logic;

			bits		: in  std_logic_vector(3 downto 0);

			wave		: out std_logic);
end engine_oscil;

