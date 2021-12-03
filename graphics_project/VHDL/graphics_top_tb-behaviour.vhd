library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of graphics_top_tb is
   component graphics_top
      port(clk    : in  std_logic;
           reset  : in  std_logic;
   
           h_sync : out std_logic;
           v_sync : out std_logic;
   	
   	color	: out std_logic_vector(3 downto 0);
   
   	x_incr  : out std_logic;
   	y_incr  : out std_logic;
   	mem_rst : out std_logic;
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
	audio_clock : out std_logic;
   
   	game_state : in std_logic_vector(2 downto 0)
   
           );
   end component;
   signal clk    : std_logic;
   signal reset  : std_logic;
   signal h_sync : std_logic;
   signal v_sync : std_logic;
   signal color	 : std_logic_vector(3 downto 0);
   signal x_incr : std_logic;
   signal y_incr : std_logic;
   signal mem_rst : std_logic;
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
   signal audio_clock	: std_logic;
   signal game_state : std_logic_vector(2 downto 0);
   
   signal x,y,next_x,next_y:unsigned(4 downto 0);
   
begin
   test: graphics_top port map (clk, reset, h_sync, v_sync, color, x_incr, y_incr, mem_rst, data, borders, jumps, player0_pos, player1_pos, player0_dir, player1_dir, player0_state, player1_state, busy, audio_clock, game_state);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
		
--   data <= "00000000" after 0 ns;
   borders <= "00000000" after 0 ns;
   jumps <= "00000000" after 0 ns;
   player0_pos <= "00000000000" after 0 ns;
   player1_pos <= "00000000000" after 0 ns;
   player0_dir <= "00" after 0 ns;
   player1_dir <= "00" after 0 ns;
   player0_state <= "00" after 0 ns;
   player1_state <= "00" after 0 ns;
   game_state <= "000"   after 0 ns;
   
   
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1' or mem_rst='1') then
				x <= to_unsigned(0,5);
				y <= to_unsigned(0,5);
			else
				x <= next_x;
				y <= next_y;
			end if;
		end if;
	end process;
   
   process(x_incr,x)
   begin
		if x_incr='1' then
			next_x<=x+to_unsigned(1,5);
		else
			next_x<=x;
		end if;
	end process;
	
	process(y_incr,y)
	begin
		if y_incr='1' then
			next_y<=y+to_unsigned(1,5);
		else
			next_y<=y;
		end if;
	end process;
	
	process(x,y)
	begin
		data(3 downto 0)<=std_logic_vector(x(3 downto 0)) after 400 ns; --"read" register
		data(7 downto 4)<=std_logic_vector(y(3 downto 0)) after 400 ns;
	end process;
   
   
   
end behaviour;

