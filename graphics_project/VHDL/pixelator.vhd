library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity pixelator is
   port(dx            : in  std_logic_vector(3 downto 0);
        dy            : in  std_logic_vector(3 downto 0);

        player0_en    : in  std_logic;
        player1_en    : in  std_logic;
        player0_layer : in  std_logic;
        player1_layer : in  std_logic;
        player0_dir   : in  std_logic_vector(1 downto 0);
        player1_dir   : in  std_logic_vector(1 downto 0);
        player0_mode  : in  std_logic_vector(1 downto 0);
        player1_mode  : in  std_logic_vector(1 downto 0);

	walls	      : in  std_logic_vector(7 downto 0);
        borders       : in  std_logic_vector(7 downto 0);
        jumps         : in  std_logic_vector(7 downto 0);

        colour        : out std_logic_vector(3 downto 0));
end pixelator;

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

begin
LUT:	process(dx, dy)-- the needed conditions for making the bounding boxes
	begin
		case dx is
			when "0000"=> 
				xe0<='1'; xe1<='0'; xg1<='0'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "0001"=>
				xe0<='0'; xe1<='1'; xg1<='0'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			
			when "0010"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
			
			when "0011"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='0'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "0100"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='0'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "0101"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='0'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "0110"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='0'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "0111"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1000"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='1'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1001"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1010"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1011"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1100"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='1'; xe14<='0'; xe15<='0';
				
			when "1101"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='1'; xe14<='0'; xe15<='0';
			
			when "1110"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='0'; xe14<='1'; xe15<='0';
			
			when "1111"=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='0'; xs11<='0'; xs12<='0'; xs14<='0'; xe14<='0'; xe15<='1';
			when others=>
				xe0<='0'; xe1<='0'; xg1<='1'; xg3<='1'; xg4<='1'; xg5<='1'; xg6<='1'; xs9<='0'; xs10<='1'; xs11<='1'; xs12<='1'; xs14<='1'; xe14<='0'; xe15<='1';
		end case;
		------------------------------------------------------------------------------------------------------------------------------------------------------------------
		case dy is
			when "0000"=> 
				ye0<='1'; ye1<='0'; yg1<='0'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "0001"=>
				ye0<='0'; ye1<='1'; yg1<='0'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			
			when "0010"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
			
			when "0011"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='0'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "0100"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='0'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "0101"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='0'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "0110"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='0'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "0111"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1000"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='1'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1001"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1010"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1011"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1100"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='1'; ye14<='0'; ye15<='0';
				
			when "1101"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='1'; ye14<='0'; ye15<='0';
			
			when "1110"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='0'; ye14<='1'; ye15<='0';
			
			when "1111"=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='0'; ys11<='0'; ys12<='0'; ys14<='0'; ye14<='0'; ye15<='1';
			when others=>
				ye0<='0'; ye1<='0'; yg1<='1'; yg3<='1'; yg4<='1'; yg5<='1'; yg6<='1'; ys9<='0'; ys10<='1'; ys11<='1'; ys12<='1'; ys14<='1'; ye14<='0'; ye15<='1';
		
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
	

bounds:	process(xe0, xe1, xg1, xg3, xg4, xg5, xg6, xs9, xs10, xs11, xs12, xs14, xe14, xe15, ye0, ye1, yg1, yg3, yg4, yg5, yg6, ys9, ys10, ys11, ys12, ys14, ye14, ye15, dx, dy)
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

layering: process(bbox_wall, bbox_dot, bbox_v, bbox_h, bbox_border, bbox_jump, bbox_explosion_outer, bbox_explosion_inner)
	begin
		
	end process;

end behaviour;
