architecture behaviour of pixelator is

signal  xe0, xe1, xg1, xg3, xg4, xg5, xg6, xs9, xs10, xs11, xs12, xs14, xe14, xe15: std_logic;
signal  ye0, ye1, yg1, yg3, yg4, yg5, yg6, ys9, ys10, ys11, ys12, ys14, ye14, ye15: std_logic;
signal rounding: std_logic;
signal rel_x, rel_y: std_logic_vector(1 downto 0);
-------------------------------------------------------------
signal bbox_dot: std_logic;
signal bbox_jump, bbox_border: std_logic_vector(3 downto 0);--W,E,S,N same order as the walls
signal bbox_wall: std_logic_vector(7 downto 0);--W,E,S,N,W,E,S,N last 4 are of the first layer
signal bbox_h, bbox_v: std_logic;
signal bbox_explosion_inner, bbox_explosion_outer: std_logic;
-------------------------------------------------------------
signal player0_wall,player1_wall: std_logic_vector(3 downto 0);
-------------------------------------------------------------

constant C_player0_explosion_outer 			: std_logic_vector(3 downto 0):= "1101";
constant C_player1_explosion_outer 			: std_logic_vector(3 downto 0):= "0111";
constant C_player0_explosion_inner 			: std_logic_vector(3 downto 0):= "1111";
constant C_player1_explosion_inner 			: std_logic_vector(3 downto 0):= "1111";

constant C_player0 					: std_logic_vector(3 downto 0):= "0011";
constant C_player0_inactive 		: std_logic_vector(3 downto 0):= "0110";
constant C_player1	 				: std_logic_vector(3 downto 0):= "1100";
constant C_player1_inactive			: std_logic_vector(3 downto 0):= "1001";

constant C_wall0 					: std_logic_vector(3 downto 0):= "0101";
constant C_player0_wall0			: std_logic_vector(3 downto 0):= "0001";
constant C_player1_wall0			: std_logic_vector(3 downto 0):= "0100";
constant C_wall1 					: std_logic_vector(3 downto 0):= "1010";
constant C_player0_wall1			: std_logic_vector(3 downto 0):= "0010";
constant C_player1_wall1			: std_logic_vector(3 downto 0):= "1000";

constant C_jump0 					: std_logic_vector(3 downto 0):= "0101";
constant C_jump1 					: std_logic_vector(3 downto 0):= "1010";

constant C_border0 					: std_logic_vector(3 downto 0):= "0101";
constant C_border1 					: std_logic_vector(3 downto 0):= "1010";
constant C_border2 					: std_logic_vector(3 downto 0):= "1111";

constant C_dot	 					: std_logic_vector(3 downto 0):= "0101";
constant C_background				: std_logic_vector(3 downto 0):= "0000";

begin
LUT:	process(dx, dy)-- the needed conditions for making the bounding boxes
	begin
		case dx is
			when "0000"=> xe0<='1'; xe1<='0'; xg1<='0'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0001"=> xe0<='0'; xe1<='1'; xg1<='0'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0010"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0011"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0100"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0101"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0110"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "0111"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1000"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1001"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1010"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1011"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1100"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1101"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='1'; xe14<='0'; xe15<='0';
			when "1110"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='0'; xe14<='1'; xe15<='0';
			when "1111"=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='0'; xe14<='0'; xe15<='1';
			when others=> xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='1';
		end case;
		------------------------------------------------------------------------------------------------------------------------------------------------------------------
		case dy is
			when "0000"=> ye0<='1'; ye1<='0'; yg1<='0'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0001"=> ye0<='0'; ye1<='1'; yg1<='0'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0010"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0011"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0100"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0101"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0110"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "0111"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1000"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1001"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1010"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1011"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1100"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1101"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='1'; ye14<='0'; ye15<='0';
			when "1110"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='0'; ye14<='1'; ye15<='0';
			when "1111"=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='0'; ye14<='0'; ye15<='1';
			when others=> ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='1';
		end case;
		
		------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
		--determining relative position to the axis
		if (dx(3) = '0') then
			rel_x(1) <= not(dx(1));
			rel_x(0) <= not(dx(0));
		else
			rel_x(1) <= dx(1);
			rel_x(0) <= dx(0);
		end if;
		if (dy(3) = '1') then
			rel_y(1) <= not(dy(1));
			rel_y(0) <= not(dy(0));
		else
			rel_y(1) <= dy(1);
			rel_y(0) <= dy(0);
		end if;
	end process;
	
rounding_process: process(rel_x, rel_y)
	begin
		if (rel_x<rel_y) then
			rounding<= '1';
		else
			rounding<= '0';
		end if;
	end process;
	





bounds:	process(xe0, xe1, xg1, xg3, xg4, xg5, xg6, xs9, xs10, xs11, xs12, xs14, xe14, xe15, ye0, ye1, yg1, yg3, yg4, yg5, yg6, ys9, ys10, ys11, ys12, ys14, ye14, ye15, dx, dy,rounding)
	--using the conditions above make the bounding box signals
	begin
		--the bounds of the first layer
		bbox_wall(0)<=xg4 and xs11 and ys11;
		bbox_wall(1)<=yg4  and xg4 and xs11;
		bbox_wall(2)<=yg4 and ys11 and xg4 ;
		bbox_wall(3)<=yg4 and ys11 and xs11;
		-------------------------------------
		--the bounds of the second layer 
		--(the walls are thinner on the second layer)
		bbox_wall(4)<=xg5 and xs10 and ys11;
		bbox_wall(5)<=xg5 and xs10 and yg4;
		bbox_wall(6)<=yg5 and ys10 and xg4;
		bbox_wall(7)<=yg5 and ys10 and xs11; 
		-------------------------------------
		--the bounds of the dot
		bbox_dot<=xg6 and xs9 and yg6 and ys9;
		-------------------------------------
		--the bounds of the player (horizontal and vertical)
		bbox_v<=xg3 and xs12 and yg1 and ys14;
		bbox_h<=xg1 and xs14 and yg3 and ys12;
		-------------------------------------
		--the bounds of the borders
		bbox_border(0)<=ye0;
		bbox_border(1)<=ye15;
		bbox_border(2)<=xe15;
		bbox_border(3)<=xe0;
		-------------------------------------
		--the bounds of the jumps
		bbox_jump(0)<=ye0 or (ye1 and dx(1));
		bbox_jump(1)<=ye15 or (ye14 and dx(1));
		bbox_jump(2)<=xe15 or (xe14 and dy(1));
		bbox_jump(3)<=xe0 or (xe1 and dy(1));
		-------------------------------------
		--the bounds of the explosions
		bbox_explosion_outer<= (xg3 and xs12) or (yg3 and ys12) or rounding;
		bbox_explosion_inner<= (xg3 and xs12) and (yg3 and ys12) and rounding;
	end process;



--small decoding for later
	process(player0_dir,player1_dir)
	begin
		case player0_dir is
			when "00" => player0_wall<="0100";
			when "01" => player0_wall<="1000";
			when "10" => player0_wall<="0001";
			when others => player0_wall<="0010";
		end case;
		case player1_dir is
			when "00" => player1_wall<="0100";
			when "01" => player1_wall<="1000";
			when "10" => player1_wall<="0001";
			when others => player1_wall<="0010";
		end case;
	end process;

--combine bboxes and data and stack the layers

layering: process(bbox_wall, bbox_dot, bbox_v, bbox_h, bbox_border, bbox_jump, bbox_explosion_outer, bbox_explosion_inner, walls, borders, jumps, player0_dir, player0_en, player0_layer, player0_mode, player1_dir, player1_en, player1_layer, player1_mode, layer0_player, layer1_player,player0_wall,player1_wall)

	variable player0_cycle_pixel,player1_cycle_pixel: boolean;
	variable player0_inner_explosion_pixel,player1_inner_explosion_pixel,player0_outer_explosion_pixel,player1_outer_explosion_pixel : boolean;
	variable border0_pixel: boolean;
	begin
	
		player0_cycle_pixel:=player0_en='1' and player0_mode(1)='1' and ((player0_dir(0)='0' and bbox_v='1') or (player0_dir(0)='1' and bbox_h='1'));
		player1_cycle_pixel:=player1_en='1' and player1_mode(1)='1' and ((player1_dir(0)='0' and bbox_v='1') or (player1_dir(0)='1' and bbox_h='1'));
		player0_inner_explosion_pixel:=player0_en='1' and player0_mode(1)='0' and bbox_explosion_inner='1';
		player1_inner_explosion_pixel:=player1_en='1' and player1_mode(1)='0' and bbox_explosion_inner='1';
		player0_outer_explosion_pixel:=player0_en='1' and player0_mode(1)='0' and bbox_explosion_outer='1';
		player1_outer_explosion_pixel:=player1_en='1' and player1_mode(1)='0' and bbox_explosion_outer='1';
	
		border0_pixel:=(borders(3 downto 0) and bbox_border) /= "0000";
	
		--layer 1
		if (borders(7 downto 4) and bbox_border) /= "0000" then --any of the top borders
			if border0_pixel then --both borders (edge of game field) -> white
				color<=c_border2;
			else
				color<=c_border1;
			end if;
			
		elsif player0_layer='1' and player0_cycle_pixel then --player0 cycle
			if player0_mode(0)='1' then --check if player is ready
				color<=c_player0;
			else
				color<=c_player0_inactive;
			end if;
		elsif player1_layer='1' and player1_cycle_pixel then --player1 cycle
			if player1_mode(0)='1' then --check if player is ready
				color<=c_player1;
			else
				color<=c_player1_inactive;
			end if;
		elsif player0_layer='1' and player0_inner_explosion_pixel then
			color<=C_player0_explosion_inner;
		elsif player1_layer='1' and player1_inner_explosion_pixel then
			color<=C_player0_explosion_inner;
		elsif player0_layer='1' and player0_outer_explosion_pixel then
			color<=C_player0_explosion_outer;
		elsif player1_layer='1' and player1_outer_explosion_pixel then
			color<=C_player0_explosion_outer;
			
		elsif player0_en='1' and player0_layer='1' and player0_mode(1)='1' and ((player0_wall and bbox_wall(7 downto 4)) /= "0000") then --player0 wall
			color<=c_player0_wall1;
		elsif player1_en='1' and player1_layer='1' and player1_mode(1)='1' and ((player1_wall and bbox_wall(7 downto 4)) /= "0000") then --player1 wall
			color<=c_player1_wall1;
			
		elsif (bbox_wall(7 downto 4) and walls(7 downto 4)) /= "0000" then --wall
			if layer1_player='0' then --choose color
				color<=c_player0_wall1;
			else
				color<=c_player1_wall1;
			end if;
		elsif (jumps(7 downto 4) and bbox_jump) /= "0000" then --jump
			color<=c_jump1;
		
		--layer 0
		elsif border0_pixel then --border
			color<=c_border0;
			
		elsif player0_cycle_pixel then --player0 cycle
			if player0_mode(0)='1' then --check if player is ready
				color<=c_player0;
			else
				color<=c_player0_inactive;
			end if;
		elsif player1_cycle_pixel then --player1 cycle
			if player1_mode(0)='1' then --check if player is ready
				color<=c_player1;
			else
				color<=c_player1_inactive;
			end if;
		elsif player0_inner_explosion_pixel then
			color<=C_player0_explosion_inner;
		elsif player1_inner_explosion_pixel then
			color<=C_player0_explosion_inner;
		elsif player0_outer_explosion_pixel then
			color<=C_player0_explosion_outer;
		elsif player1_outer_explosion_pixel then
			color<=C_player0_explosion_outer;
			
		elsif player0_en='1' and player0_mode(1)='1' and ((player0_wall and bbox_wall(3 downto 0)) /= "0000") then --player0 wall
			color<=c_player0_wall0;
		elsif player1_en='1' and player1_mode(1)='1' and ((player1_wall and bbox_wall(3 downto 0)) /= "0000") then --player1 wall
			color<=c_player1_wall0;
			
		elsif (bbox_wall(3 downto 0) and walls(3 downto 0)) /= "0000" then --wall
			if layer0_player='0' then --choose color
				color<=c_player0_wall0;
			else
				color<=c_player1_wall0;
			end if;
		elsif (jumps(3 downto 0) and bbox_jump) /= "0000" then --jump
			color<=c_jump0;
		
		--background
		elsif bbox_dot='1' then --dot
			color<=c_dot;
		else
			color<=c_background;
		end if;
	
	end process;
end behaviour;