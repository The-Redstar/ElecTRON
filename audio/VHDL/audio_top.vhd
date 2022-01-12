library IEEE;
use IEEE.std_logic_1164.ALL;

entity audio_top is
	port(	clk				: in  std_logic;
			reset			: in  std_logic;
			
			game_state		: in  std_logic_vector(2 downto 0);
			
			beep_clk		: in  std_logic;
			button			: in  std_logic;
			
			player0_dir 	: in  std_logic_vector(1 downto 0);
			player1_dir 	: in  std_logic_vector(1 downto 0);
			player0_boost	: in  std_logic;
			player1_boost	: in  std_logic;
			
			wave        	: out std_logic_vector(1 downto 0));
end audio_top;

