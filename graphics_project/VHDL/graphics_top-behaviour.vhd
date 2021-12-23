library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of graphics_top is

	component pixelator is
	port(	dx				: in  std_logic_vector(3 downto 0);
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
	port(	encoded		: in  std_logic_vector(2 downto 0);
			north		: out std_logic;
			east		: out std_logic;
			south		: out std_logic;
			west		: out std_logic);
	end component;

	component sidebar is
	port(	x			: in  std_logic_vector(6 downto 0);
			y			: in  std_logic_vector(8 downto 0);
			player		: in  std_logic;
			mode		: in  std_logic_vector(2 downto 0);
			ready		: in  std_logic;
			boost		: in  std_logic;
			dir			: in  std_logic_vector(1 downto 0);
			color		: out std_logic_vector(3 downto 0));
	end component;

	component homescreen is
	port(	x			: in  std_logic_vector(8 downto 0);
			y			: in  std_logic_vector(8 downto 0);
			pixelator	: in  std_logic_vector(3 downto 0);
			color		: out std_logic_vector(3 downto 0));
	end component;



	--VGA/timing signals
	signal h_count, next_h_count, v_count, next_v_count:	unsigned(9 downto 0);
	signal h_vec, v_vec:									std_logic_vector(9 downto 0);
	signal h_count_x_component:								unsigned(5 downto 0);--6 msb
	signal v_count_y_component:								unsigned(5 downto 0);--6 msb

	signal dx,dy:											unsigned(3 downto 0);
	signal dx_vec,dy_vec:									std_logic_vector(3 downto 0);
	signal x,y:												unsigned(4 downto 0);--32x32 grid
	signal x_vec,y_vec:										std_logic_vector(4 downto 0);
	
	signal next_v_sync, next_h_sync:						std_logic;
	
	signal in_visible_y:									std_logic; --basically internal busy signal
	signal in_visible_x:									std_logic;
	
	signal central_x:										unsigned(9 downto 0); --x, 0 at start of central 480 pixels
	signal central_x_vec:									std_logic_vector(9 downto 0);
	
	--pixelator
	signal pixelator_color:									std_logic_vector(3 downto 0);
	
	--sidebar
	signal sidebar_x:										std_logic_vector(6 downto 0);
	signal sidebar_y:										std_logic_vector(8 downto 0);
	signal sidebar_player, sidebar_ready, sidebar_boost:	std_logic;
	signal sidebar_dir:										std_logic_vector(1 downto 0);
	signal sidebar_color:									std_logic_vector(3 downto 0);
	
	--homescreen
	signal homescreen_x, homescreen_y:						std_logic_vector(8 downto 0);
	signal homescreen_color:								std_logic_vector(3 downto 0);
	
	--output
	signal next_color:										std_logic_vector(3 downto 0);
	


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
		dx=>dx_vec,--pixelator_dx_vec,
		dy=>dy_vec,--pixelator_dy_vec,
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

sdb: sidebar port map(
		x=>sidebar_x,
		y=>sidebar_y,
		player=>sidebar_player,
		mode=>game_state,
		ready=>sidebar_ready,
		boost=>sidebar_boost,
		dir=>sidebar_dir,
		color=>sidebar_color
	);

hscr: homescreen port map(
		x=>homescreen_x,
		y=>homescreen_y,
		pixelator=>pixelator_color,
		color=>homescreen_color
	);


--some useful values for coordinates and counting
	h_vec<=std_logic_vector(h_count);
	v_vec<=std_logic_vector(v_count);
	
	--switching pixelator/memory coordinates to fit either the normal game or the homescreen
	process(h_count,v_count,h_vec,v_vec)
		variable v_x, hcxc	: unsigned(9 downto 0);
	begin
		if game_state/="000" then --standard, not homescreen
			dx_vec<=h_vec(3 downto 0); --4 lsb
			dy_vec<=v_vec(3 downto 0);
			
			x_vec<=std_logic_vector(h_count(8 downto 4)-to_unsigned(9+5,5)); --5 more significant bits --9 offscreen + 80p left half of screen
			y_vec<=std_logic_vector(v_count(8 downto 4));
			
			h_count_x_component<=h_count(9 downto 4); --when comparing multiples of 16 don't create comparison logic for the lower bits
			v_count_y_component<=h_count(9 downto 4);
		
		else --homescreen, display grid on 1/2 scale starting at (120,200) relative to central_x, v
			dx_vec(0)<='0';
			dx_vec(3 downto 1)<=std_logic_vector(h_count(2 downto 0)-to_unsigned(120,3)); --120 is only misalignment relative to 8pixel grid
			dy_vec(0)<='0';
			dy_vec(3 downto 1)<=v_vec(2 downto 0); --200==0mod8, no shift
			
			v_x:=h_count-to_unsigned(120+80+9*16,10); --shift to start of screen, past sidebar, to start of homescreen map preview
			x_vec<=std_logic_vector(v_x(7 downto 3)); --5 more significant bits --9 offscreen + 80p left half of screen
			y_vec<=std_logic_vector(v_count(7 downto 3)-to_unsigned(25,5)); --offset by 200, but 200/8=25
			
			--most difficult to change
			--original: h_count//16
			--new: shifted h_count//8

			--original must be 14 at start of game grid; h~(9+5)x16 +0..15
			--original 0 at h=0 +0..15
			--new signal must be 14 at start of preview; h~(9+5)x16+120
			--new 0 at (9+5)x16+120 - (9+5)*8 +0..7= 232+0..7
			--so take hcount-232 and divide by 8
			
			hcxc:=h_count-to_unsigned(232,10);
			h_count_x_component<=hcxc(8 downto 3); --when comparing multiples of 16 don't create comparison logic for the lower bits
			
			if h_count<to_unsigned(8*16,10) then --prevent the scaled down value from being repeated at the start of the line, 8*16 skips the first 16 blocks
				h_count_x_component<=to_unsigned(0,6);
			end if;
			
			--rescale by factor 1/2, move original 0 mark to 200
			v_count_y_component<=h_count(8 downto 3)-to_unsigned(25,6); --move by 200=8x25
		
		end if;
	end process;
	
	dx<=unsigned(dx_vec);
	dy<=unsigned(dy_vec);
	
	x<=unsigned(x_vec);
	y<=unsigned(y_vec);
	

	
	central_x<=h_count-(B+C+to_unsigned(80,10));
	central_x_vec<=std_logic_vector(central_x);
	
--	pixelator_dx_vec<=dx_vec;
--	pixelator_dy_vec<=dy_vec;
	
	homescreen_y<=v_vec(8 downto 0);
	homescreen_x<=central_x_vec(8 downto 0);

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
	process(dx, x, in_visible_y, data_synced, borders_synced, jumps_synced, data, borders, jumps,h_count_x_component, game_state)
	begin
		if dx=unsigned(std_logic_vector(to_signed(-1,4))) or (game_state="000" and dx=unsigned(std_logic_vector(to_signed(-2,4))))then --highest dx value -> pass data on
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
		else --keep data
			next_data_synced<=data_synced;
			next_borders_synced<=borders_synced;
			next_jumps_synced<=jumps_synced;
		
			x_incr <= '0';
		end if;
		
		if game_state="100" then --erasing memory, block output
			x_incr <= '0';
		end if;
	end process;
	
	--y_incr/mem reset
	process(h_count, y, dy, in_visible_y, game_state)
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
		
		if game_state="100" then --erasing memory, block output
			mem_rst <= '0';
			y_incr <= '0';
		end if;
		
	end process;

--sidebar
	process(h_vec,h_count,v_vec,player0_dir,player1_dir,player0_state,player1_state)
	begin
		if h_vec(9)='0' then --player0
			sidebar_player<='0';
			sidebar_dir<=player0_dir;
			sidebar_ready<=player0_state(0);
			sidebar_boost<='0';
			sidebar_x<=std_logic_vector(unsigned(h_vec(6 downto 0))-to_unsigned(B+C,7)); --take 7 LSB and shift to start of sidebar
		else --player1
			sidebar_player<='1';
			sidebar_dir<=player1_dir;
			sidebar_ready<=player1_state(0);
			sidebar_boost<='0';
			sidebar_x<=std_logic_vector(unsigned(h_vec(6 downto 0))-to_unsigned(B+C+80+R,7)); --take 7 LSB and shift to start of sidebar
		end if;
		sidebar_y<=v_vec(8 downto 0);
	end process;


--pixelator player enables
	--check player positions against current position
	process(player0_pos,x_vec,y_vec,game_state)
	begin
		if player0_pos(9 downto 5)=y_vec and player0_pos(4 downto 0)=x_vec then
			player0_en<='1';
		else
			player0_en<='0';
		end if;
		
		if game_state="000" then --homescreen
			player0_en<='0';
		end if;
	end process;
	
	process(player1_pos,x_vec,y_vec,game_state)
	begin
		if player1_pos(9 downto 5)=y_vec and player1_pos(4 downto 0)=x_vec then
			player1_en<='1';
		else
			player1_en<='0';
		end if;
		
		if game_state="000" then --homescreen
			player1_en<='0';
		end if;
	end process;


--output color selection
	process(h_count,v_count,in_visible_x,in_visible_y,pixelator_color,sidebar_color,game_state) --calculate output color (gridded pattern)
		--variable px	: unsigned(9 downto 0);
	begin
		if in_visible_x='1' and in_visible_y='1' then
			--px:=h_count-(B+C+to_unsigned(80,10));
			
			if central_x<R then
				--depending on mode
				if game_state="000" then --homescreen!
					next_color<=homescreen_color;
				else --game
					next_color<=pixelator_color;
				end if;
			else
				next_color <= sidebar_color;
			end if;
		else
			next_color <= "0000";
		end if;
		
		if game_state="100" then
			next_color <= "0000";
		end if;
	end process;

end behaviour;
