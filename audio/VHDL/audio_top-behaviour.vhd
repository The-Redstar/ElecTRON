library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of audio_top is
	component engine_oscil is
	port(	clk			: in  std_logic;
			reset		: in  std_logic;
			audio_clk	: in  std_logic;
			step_clk	: in  std_logic;
			player		: in  std_logic;
			dir			: in  std_logic_vector(1 downto 0);
			boost		: in  std_logic;
			wave		: out std_logic);
	end component;
	
	
	component rng is
	port(	clk		: in  std_logic;
			reset	: in  std_logic;
			wave	: out std_logic);
	end component;

	
	signal en0_rst, en1_rst, rng_rst:	std_logic;
	signal en0_wave, en1_wave, rng_wave:	std_logic;
begin

en0: engine_oscil port map(
		clk=>clk,
		reset=>en0_rst,
		audio_clk=>audio_clk,
		step_clk=>step_clk,
		player=>'0',
		dir=>player0_dir,
		boost=>player0_boost,
		wave=>en0_wave);
en1: engine_oscil port map(
		clk=>clk,
		reset=>en1_rst,
		audio_clk=>audio_clk,
		step_clk=>step_clk,
		player=>'1',
		dir=>player1_dir,
		boost=>player1_boost,
		wave=>en1_wave);
expl: rng port map(
		clk=>clk,
		reset=>rng_rst,
		wave=>rng_wave);


	en0_rst <= reset or not(engine_en);
	en1_rst <= en0_rst;
	rng_rst <= reset or not(crash_en);

	wave(0) <= en0_wave xor en1_wave xor rng_wave;
	wave(1) <= en0_wave and en1_wave;




end behaviour;

