library IEEE;
use IEEE.std_logic_1164.ALL;

entity graphics_top is
	port(clk	: in  std_logic;
		reset	: in  std_logic;

		h_sync	: out std_logic;
		v_sync	: out std_logic;
	
		color	: out std_logic_vector(3 downto 0);

		x_incr	: out std_logic;
		y_incr	: out std_logic;
		mem_rst	: out std_logic;

		data	: in  std_logic_vector(7 downto 0);
		borders	: in  std_logic_vector(7 downto 0);
		jumps	: in  std_logic_vector(7 downto 0);

		player0_pos		: in  std_logic_vector(10 downto 0);
		player1_pos		: in  std_logic_vector(10 downto 0);
		player0_dir		: in  std_logic_vector(1 downto 0);
		player1_dir		: in  std_logic_vector(1 downto 0);
		player0_state	: in  std_logic_vector(1 downto 0);
		player1_state	: in  std_logic_vector(1 downto 0);

		busy			: out std_logic;
		audio_clock		: out std_logic;

		game_state		: in  std_logic_vector(2 downto 0)

		);
end graphics_top;

