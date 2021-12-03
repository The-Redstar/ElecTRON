library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of graphics_top is

	component pixelator is
	port(dx				: in  std_logic_vector(3 downto 0);
		dy				: in  std_logic_vector(3 downto 0);

		player0_en		: in  std_logic;
		player1_en		: in  std_logic;
		player0_layer	: in  std_logic;
		player1_layer	: in  std_logic;
		player0_dir		: in  std_logic_vector(1 downto 0);
		player1_dir		: in  std_logic_vector(1 downto 0);
		player0_mode	: in  std_logic_vector(1 downto 0);
		player1_mode	: in  std_logic_vector(1 downto 0);

		walls			: in  std_logic_vector(7 downto 0);
		layer0_player	: in  std_logic;
		layer1_player	: in  std_logic;
		
		borders			: in  std_logic_vector(7 downto 0);
		jumps			: in  std_logic_vector(7 downto 0);

		color			: out std_logic_vector(3 downto 0));
	end component;
	
	component wall_decoder is
	port(encoded	: in  std_logic_vector(2 downto 0);
		north		: out std_logic;
		east		: out std_logic;
		south		: out std_logic;
		west		: out std_logic);
	end component;




	--VGA/timing signals
	signal h_count, next_h_count, v_count, next_v_count:	unsigned(9 downto 0);
	signal h_count_x_component:								unsigned(5 downto 0);--6 msb
	signal v_count_y_component:								unsigned(5 downto 0);--6 msb

	signal dx,dy:											unsigned(3 downto 0);
	signal dx_vec,dy_vec:									std_logic_vector(3 downto 0);
	signal x,y:												unsigned(4 downto 0);--32x32 grid
	signal x_vec,y_vec:										std_logic_vector(4 downto 0);
	
	signal next_v_sync, next_h_sync:						std_logic;
	
	signal in_visible_y:									std_logic; --basically internal busy signal
	signal in_visible_x:									std_logic;
	
	--output
	signal next_color,pixelator_color:						std_logic_vector(3 downto 0);
	


	--data signals
	signal data_synced, next_data_synced:					std_logic_vector(7 downto 0);--data from memory passed on
	signal borders_synced, next_borders_synced:				std_logic_vector(7 downto 0);--data from grid manager
	signal jumps_synced, next_jumps_synced:					std_logic_vector(7 downto 0);--data from grid manager
	signal walls:											std_logic_vector(7 downto 0);--walls; decoded data
	
	signal player0_en,player1_en:							std_logic;
	
	

	--VGA constants
	constant B : natural := 96;  -- horizontal sync
	constant C : natural := 48;  -- back porch + border
	constant D : natural := 640; -- visible area
	constant E : natural := 16;  -- border + front porch
	constant A : natural := B + C + D + E;  -- line

	constant P : natural := 2;   -- vertical sync
	constant Q : natural := 33;  -- back porch + border
	constant R : natural := 480; -- visible area
	constant S : natural := 10;  -- border + front porch
	constant O : natural := P + Q + R + S;  -- all lines



begin

--decode walls on layer 0
dec0: wall_decoder port map(
		encoded=>data_synced(2 downto 0),
		north=>walls(0),
		east=>walls(3),
		south=>walls(2),
		west=>walls(1)
	);
	
--decode walls on layer 1
dec1: wall_decoder port map(
		encoded=>data_synced(6 downto 4),
		north=>walls(4),
		east=>walls(7),
		south=>walls(6),
		west=>walls(5)
	);
	
--calculate pixel from game data
pxl: pixelator port map(
		dx=>dx_vec,
		dy=>dy_vec,
		player0_en=>player0_en,
		player1_en=>player1_en,
		player0_layer=>player0_pos(10),
		player1_layer=>player1_pos(10),
		player0_dir=>player0_dir,
		player1_dir=>player1_dir,
		player0_mode=>player0_state,
		player1_mode=>player1_state,
		walls=>walls,
		layer0_player=>data_synced(3),
		layer1_player=>data_synced(7),
		borders=>borders_synced,
		jumps=>jumps_synced,
		color=>pixelator_color
	);


--some useful values for coordinates and counting
	dx<=h_count(3 downto 0); --4 lsb
	dy<=v_count(3 downto 0);
	dx_vec<=std_logic_vector(dx);
	dy_vec<=std_logic_vector(dy);
	x<=h_count(8 downto 4)-to_unsigned(9+5,5); --5 more significant bits --9 offscreen + 80p left half of screen
	y<=v_count(8 downto 4);
	x_vec<=std_logic_vector(x);
	y_vec<=std_logic_vector(y);
	h_count_x_component<=h_count(9 downto 4); --when comparing multiples of 16 don't create comparison logic for the lower bits
	v_count_y_component<=h_count(9 downto 4);


--clocking process
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				h_count <= to_unsigned(0,10);
				v_count <= to_unsigned(0,10);
				h_sync <= '1';
				v_sync <= '1';	
				color <= "0000"; --color must be reset to low
			else
				h_count <= next_h_count;
				v_count <= next_v_count;
				h_sync <= next_h_sync ;
				v_sync <= next_v_sync;
				color <= next_color;
			end if;
			
			data_synced<=next_data_synced; --giving these a reset would increase the size at 24 places
			borders_synced<=next_borders_synced;
			jumps_synced<=next_jumps_synced;
		end if;
	end process;

--VGA timing
	process(v_count, h_count) --vertical timing
	begin
		if h_count = A-1 then --go to next line when line is finished
			if v_count = O-1 then
				next_v_count <= to_unsigned(0,10);--back to start
			else
				next_v_count <= v_count+1;--continue
			end if;
		else
			next_v_count <= v_count;
		end if;

		if R+S<=v_count and v_count<R+S+P then
			next_v_sync <= '0';
		else
			next_v_sync <= '1';
		end if;
	end process;

	process(h_count) --horizontal timing
	begin
		if h_count = A-1 then
			next_h_count <= to_unsigned(0,10);
			audio_clock <= '1';
		else
			next_h_count <= h_count+1;
			audio_clock <= '0';
		end if;

		if h_count<B then --clocking signals means they are delayed by one cycle
			next_h_sync <= '0';
		else
			next_h_sync <= '1';
		end if;
	end process;

--screen output
	--visible section detection
	process(h_count)
	begin
		if B+C<=h_count and h_count<B+C+D then--in visible section
			in_visible_x <= '1';
		else
			in_visible_x <= '0';
		end if;
	end process;
	
	process(v_count)
	begin
		if v_count<R then--in visible section
			in_visible_y <= '1';
		else
			in_visible_y <= '0';
		end if;
	end process;
	
	busy <= in_visible_y;

--memory access
	--x_incr, pass data
	process(dx, x, in_visible_y, data_synced, borders_synced, jumps_synced, data, borders, jumps,h_count_x_component)
	begin
		if dx=unsigned(std_logic_vector(to_signed(-1,4))) then
			--pass data
			next_data_synced<=data;
			next_borders_synced<=borders;
			next_jumps_synced<=jumps;
			
			--check for x increment
			if to_unsigned(13,6)<=h_count_x_component and h_count_x_component<to_unsigned(13+32,6) and in_visible_y='1' then
				x_incr <= '1';
			else
				x_incr <= '0';
			end if;
		else
			next_data_synced<=data_synced;
			next_borders_synced<=borders_synced;
			next_jumps_synced<=jumps_synced;
		
			x_incr <= '0';
		end if;
	end process;
	
	--y_incr/mem reset
	process(h_count, y, dy, in_visible_y)
	begin
		if in_visible_y='1' and h_count=to_unsigned(0,10) then --on first timing pixel if output is enabled
			if y=to_unsigned(0,5) then --reset memory at start of first cell row
				mem_rst<='1';
				y_incr<='0';
			else
				mem_rst<='0';
				if dy=to_unsigned(0,4) then--increment y on first line of new cell row
					y_incr <= '1';
				else
					y_incr <= '0';
				end if;
			end if;
		else
			mem_rst <= '0';
			y_incr  <= '0';
		end if;
		
	end process;
	
--output
	--check player positions
	process(player0_pos,x_vec,y_vec)
	begin
		if player0_pos(9 downto 5)=y_vec and player0_pos(4 downto 0)=x_vec then
			player0_en<='1';
		else
			player0_en<='0';
		end if;
	end process;
	process(player1_pos,x_vec,y_vec)
	begin
		if player1_pos(9 downto 5)=y_vec and player1_pos(4 downto 0)=x_vec then
			player1_en<='1';
		else
			player1_en<='0';
		end if;
	end process;
	
	--output calculations -- dummy, not actual data
	process(h_count,v_count,in_visible_x,in_visible_y,pixelator_color) --calculate output color (gridded pattern)
		variable px,py	: unsigned(9 downto 0);
	begin
		if in_visible_x='1' and in_visible_y='1' then
			px:=h_count-(B+C+to_unsigned(80,10));
			py:=v_count;
			
			if px<R then
				next_color<=pixelator_color;
--				next_color(3) <= px(4) xor py(4);
--				next_color(2 downto 0) <= "000";
			else
				next_color <= "0000";
			end if;
		else
			next_color <= "0000";
		end if;
	end process;
end behaviour;
