library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of audio_top is
	component engine_oscil is
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
	end component;
	
	
	component rng is
	port(	clk			: in  std_logic;
			reset		: in  std_logic;
			bits		: out std_logic_vector(3 downto 0));
	end component;

	signal engine_en, crash_en, beep_en:	std_logic;
	
	signal en0_rst, en1_rst, rng_rst:		std_logic;
	signal en0_wave, en1_wave:				std_logic;
	signal bits:							std_logic_vector(3 downto 0);
begin

en0: engine_oscil port map(
		clk=>clk,
		reset=>en0_rst,
		engine=>engine_en,
		crash=>crash_en,
		beep=>beep_en,
		player=>'0',
		dir=>player0_dir,
		boost=>player0_boost,
		bits=>bits,
		wave=>en0_wave);
en1: engine_oscil port map(
		clk=>clk,
		reset=>en1_rst,
		engine=>engine_en,
		crash=>crash_en,
		beep=>beep_en,
		player=>'1',
		dir=>player1_dir,
		boost=>player1_boost,
		bits=>bits,
		wave=>en1_wave);
expl: rng port map(
		clk=>clk,
		reset=>rng_rst,
		bits=>bits);


	process(game_state, beep_clk, button)
	begin
		if game_state="111" then -- playing
			engine_en<='1';
		else
			engine_en<='0';
		end if;
		
		if game_state="001" or game_state="010" or game_state="011" then -- win, win, tie
			crash_en<='1';
		else
			crash_en<='0';
		end if;
		
		if (game_state="101" and beep_clk='1') or button='1' then -- countdown
			beep_en<='1';
		else
			beep_en<='0';
		end if;
		
	end process;


	en0_rst <= reset or not(engine_en or crash_en or beep_en);
	en1_rst <= en0_rst;
	rng_rst <= reset;

	wave(0) <= en0_wave;
	wave(1) <= en1_wave;




end behaviour;

