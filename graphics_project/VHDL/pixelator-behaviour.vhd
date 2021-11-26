architecture behaviour of pixelator is

signal xe0, xg1, xg3, xg4, xs11, xs12, xs14, xe15: std_logic;
signal ye0, yg1, yg3, yg4, ys11, ys12, ys14, ye15: std_logic;
-------------------------------------------------------------
signal bbox_dot: std_logic;
signal bbox_jump, bbox_border: std_logic_vector(3 downto 0);
signal bbox_wall: std_logic_vector(7 downto 0);--W,E,S,N,W,E,S,N last 4 are of the first layer
signal bbox_ph, bbox_v: std_logic;

begin
LUT:	process
	begin
		xge0<='1' when unsigned(dx)>=0 else '0';
		xg1<='1' when unsigned(dx)>1 else '0';
		xg3<='1' when unsigned(dx)>3 else '0';
		xg4<='1' when unsigned(dx)>4 else '0';
		xg5<='1' when unsigned(dx)>5 else '0';
		xg6<='1' when unsigned(dx)>6 else '0';
		xs9<='1' when unsigned(dx)<9 else '0';
		xs10<='1' when unsigned(dx)<10 else '0';
		xs11<='1' when unsigned(dx)<11 else '0';
		xs12<='1' when unsigned(dx)<12 else '0';
		xs14<='1' when unsigned(dx)<14 else '0';
		xse15<='1' when unsigned(dx)<=15 else '0';
		

		-----------------------------------------

		yge0<='1' when unsigned(dy)>=0 else '0';
		yg1<='1' when unsigned(dy)>1 else '0';
		yg3<='1' when unsigned(dy)>3 else '0';
		yg4<='1' when unsigned(dy)>4 else '0';
		yg5<='1' when unsigned(dy)>5 else '0';
		yg6<='1' when unsigned(dy)>6 else '0';
		ys9<='1' when unsigned(dy)<9 else '0';
		ys10<='1' when unsigned(dy)<10 else '0';
		ys11<='1' when unsigned(dy)<11 else '0';
		ys12<='1' when unsigned(dy)<12 else '0';
		ys14<='1' when unsigned(dy)<14 else '0';
		yse15<='1' when unsigned(dy)<=15 else '0';
			
	end process;	
	

bounds:	process
	begin
		bbox_wall(0)<=xg4 and xs11 and yge0 and ys11;
		bbox_wall(1)<=yg4 and yse15 and xg4 and xs11;
		bbox_wall(2)<=yg4 and ys11 and xg4 and xse15;
		bbox_wall(3)<=yg4 and ys11 and xge0 and xs11;
		--the bounds of the first layer
		--------------------------------------------
		--the bounds of the second layer 
		bbox_wall(4)<=xg5 and xs10 and yge0 and ys11;
		bbox_wall(5)<=xg5 and xs10 and yg4 and yse15;
		bbox_wall(6)<=yg5 and ys10 and xg4 and xse15;
		bbox_wall(7)<=yg5 and ys10 and xge0 and xs11; 
		--(the walls are thinner on the second layer)

	end process



end behaviour;