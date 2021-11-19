library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of graphics_top_tb is
   component graphics_top
      port(clk    : in  std_logic;
           reset  : in  std_logic;
   
           h_sync : out std_logic;
           v_sync : out std_logic;
   	
   	colorA0: out std_logic;
   	colorA1: out std_logic;
   	colorB0: out std_logic;
   	colorB1: out std_logic;
   
   	incrx  : out std_logic;
   	incry  : out std_logic;
   	memrst : out std_logic;
   	data   : in  std_logic_vector(7 downto 0);
   
   	borders : in std_logic_vector(7 downto 0);
   	jumps	: in std_logic_vector(7 downto 0);
   
   	player0_pos   : in std_logic_vector(10 downto 0);
   	player1_pos   : in std_logic_vector(10 downto 0);
   	player0_dir   : in std_logic_vector(1 downto 0);
   	player1_dir   : in std_logic_vector(1 downto 0);
   	player0_state : in std_logic_vector(1 downto 0);
   	player1_state : in std_logic_vector(1 downto 0);
   
   	busy   : out std_logic;
   
   	game_state : in std_logic_vector(2 downto 0)
   
           );
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal h_sync : std_logic;
   signal v_sync : std_logic;
   signal colorA0: std_logic;
   signal colorA1: std_logic;
   signal colorB0: std_logic;
   signal colorB1: std_logic;
   signal incrx  : std_logic;
   signal incry  : std_logic;
   signal memrst : std_logic;
   signal data   : std_logic_vector(7 downto 0);
   signal borders : std_logic_vector(7 downto 0);
   signal jumps	: std_logic_vector(7 downto 0);
   signal player0_pos   : std_logic_vector(10 downto 0);
   signal player1_pos   : std_logic_vector(10 downto 0);
   signal player0_dir   : std_logic_vector(1 downto 0);
   signal player1_dir   : std_logic_vector(1 downto 0);
   signal player0_state : std_logic_vector(1 downto 0);
   signal player1_state : std_logic_vector(1 downto 0);
   signal busy   : std_logic;
   signal game_state : std_logic_vector(2 downto 0);
begin
   test: graphics_top port map (clk, reset, h_sync, v_sync, colorA0, colorA1, colorB0, colorB1, incrx, incry, memrst, data, borders, jumps, player0_pos, player1_pos, player0_dir, player1_dir, player0_state, player1_state, busy, game_state);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   data(0) <= '0' after 0 ns;
   data(1) <= '0' after 0 ns;
   data(2) <= '0' after 0 ns;
   data(3) <= '0' after 0 ns;
   data(4) <= '0' after 0 ns;
   data(5) <= '0' after 0 ns;
   data(6) <= '0' after 0 ns;
   data(7) <= '0' after 0 ns;
   borders(0) <= '0' after 0 ns;
   borders(1) <= '0' after 0 ns;
   borders(2) <= '0' after 0 ns;
   borders(3) <= '0' after 0 ns;
   borders(4) <= '0' after 0 ns;
   borders(5) <= '0' after 0 ns;
   borders(6) <= '0' after 0 ns;
   borders(7) <= '0' after 0 ns;
   jumps(0) <= '0' after 0 ns;
   jumps(1) <= '0' after 0 ns;
   jumps(2) <= '0' after 0 ns;
   jumps(3) <= '0' after 0 ns;
   jumps(4) <= '0' after 0 ns;
   jumps(5) <= '0' after 0 ns;
   jumps(6) <= '0' after 0 ns;
   jumps(7) <= '0' after 0 ns;
   player0_pos(0) <= '0' after 0 ns;
   player0_pos(1) <= '0' after 0 ns;
   player0_pos(2) <= '0' after 0 ns;
   player0_pos(3) <= '0' after 0 ns;
   player0_pos(4) <= '0' after 0 ns;
   player0_pos(5) <= '0' after 0 ns;
   player0_pos(6) <= '0' after 0 ns;
   player0_pos(7) <= '0' after 0 ns;
   player0_pos(8) <= '0' after 0 ns;
   player0_pos(9) <= '0' after 0 ns;
   player0_pos(10) <= '0' after 0 ns;
   player1_pos(0) <= '0' after 0 ns;
   player1_pos(1) <= '0' after 0 ns;
   player1_pos(2) <= '0' after 0 ns;
   player1_pos(3) <= '0' after 0 ns;
   player1_pos(4) <= '0' after 0 ns;
   player1_pos(5) <= '0' after 0 ns;
   player1_pos(6) <= '0' after 0 ns;
   player1_pos(7) <= '0' after 0 ns;
   player1_pos(8) <= '0' after 0 ns;
   player1_pos(9) <= '0' after 0 ns;
   player1_pos(10) <= '0' after 0 ns;
   player0_dir(0) <= '0' after 0 ns;
   player0_dir(1) <= '0' after 0 ns;
   player1_dir(0) <= '0' after 0 ns;
   player1_dir(1) <= '0' after 0 ns;
   player0_state(0) <= '0' after 0 ns;
   player0_state(1) <= '0' after 0 ns;
   player1_state(0) <= '0' after 0 ns;
   player1_state(1) <= '0' after 0 ns;
   game_state(0) <= '0' after 0 ns;
   game_state(1) <= '0' after 0 ns;
   game_state(2) <= '0' after 0 ns;
end behaviour;

