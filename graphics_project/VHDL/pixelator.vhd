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
-------------------------------------------------------------
signal bbox_dot: std_logic;
signal bbox_jump, bbox_border: std_logic_vector(3 downto 0);--W,E,S,N same order as the walls
signal bbox_wall: std_logic_vector(7 downto 0);--W,E,S,N,W,E,S,N last 4 are of the first layer
signal bbox_h, bbox_v: std_logic;

begin
LUT:	process(dx, dy)-- the needed conditions for making the bounding boxes
	begin
		case dx is
			when "0000"  => xe0<='1';
			when others => xe0<='0'; 
		end case;
		case dx is
			when "0001"  => xe1<='1';
			when others => xe1<='0'; 
		end case;
		case dx is
			when "0000" | "0001" => xg1<='0';
			when others => xg1<='1'; 
		end case;
		case dx is
			when "0000" | "0001" | "0010" | "0011" => xg3<='0';
			when others => xg3<='1';
		end case;
		case dx is
			when "0000" | "0001" | "0010" | "0011" | "0100" => xg4<='0';
			when others => xg4<='1';
		end case;
		case dx is
			when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" => xg5<='0';
			when others => xg5<='1';
		end case;
		case dx is
			when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" | "0110" => xg6<='0';
			when others => xg6<='1';
		end case;
		case dx is
			when "1111" | "1110" | "1101" | "1100" | "1011" | "1010" | "1001" => xs9<='0';
			when others => xs9<='1';
		end case;
		case dx is
			when "1111" | "1110" | "1101" | "1100" | "1011" | "1010" => xs10<='0';
			when others => xs10<='1';
		end case;
		case dx is
			when "1111" | "1110" | "1101" | "1100" | "1011" => xs11<='0';
			when others => xs11<='1';
		end case;
		case dx is
			when "1111" | "1110" | "1101" | "1100" => xs12<='0';
			when others => xs12<='1';
		end case;
		case dx is
			when "1111" | "1110"  => xs14<='0';
			when others => xs14<='1';
		end case;
		case dx is
			when "1110"  => xe14<='1';
			when others => xe14<='0'; 
		end case;
		case dx is
			when "1111"  => xe15<='1';
			when others => xe15<='0'; 
		end case;
		

		-----------------------------------------

		case dy is
			when "0000"  => ye0<='1';
			when others => ye0<='0'; 
		end case;
		case dy is
			when "0001"  => ye1<='1';
			when others => ye1<='0'; 
		end case;
		case dy is
			when "0000" | "0001" => yg1<='0';
			when others => yg1<='1'; 
		end case;
		case dy is
			when "0000" | "0001" | "0010" | "0011" => yg3<='0';
			when others => yg3<='1';
		end case;
		case dy is
			when "0000" | "0001" | "0010" | "0011" | "0100" => yg4<='0';
			when others => yg4<='1';
		end case;
		case dy is
			when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" => yg5<='0';
			when others => yg5<='1';
		end case;
		case dy is
			when "0000" | "0001" | "0010" | "0011" | "0100" | "0101" | "0110" => yg6<='0';
			when others => yg6<='1';
		end case;
		case dy is
			when "1111" | "1110" | "1101" | "1100" | "1011" | "1010" | "1001" => ys9<='0';
			when others => ys9<='1';
		end case;
		case dy is
			when "1111" | "1110" | "1101" | "1100" | "1011" | "1010" => ys10<='0';
			when others => ys10<='1';
		end case;
		case dy is
			when "1111" | "1110" | "1101" | "1100" | "1011" => ys11<='0';
			when others => ys11<='1';
		end case;
		case dy is
			when "1111" | "1110" | "1101" | "1100" => ys12<='0';
			when others => ys12<='1';
		end case;
		case dy is
			when "1111" | "1110"  => ys14<='0';
			when others => ys14<='1';
		end case;
		case dy is
			when "1110"  => ye14<='1';
			when others => ye14<='0'; 
		end case;
		case dy is
			when "1111"  => ye15<='1';
			when others => ye15<='0'; 
		end case;	
	end process;	
	

bounds:	process(xe0, xe1, xg1, xg3, xg4, xg5, xg6, xs9, xs10, xs11, xs12, xs14, xe14, xe15, ye0, ye1, yg1, yg3, yg4, yg5, yg6, ys9, ys10, ys11, ys12, ys14, ye14, ye15)
	--using the conditions above make the bounding box signals
	begin
		bbox_wall(0)<=xg4 and xs11 and ys11;
		bbox_wall(1)<=yg4  and xg4 and xs11;
		bbox_wall(2)<=yg4 and ys11 and xg4 ;
		bbox_wall(3)<=yg4 and ys11 and xs11;
		--the bounds of the first layer
		-------------------------------------
		--the bounds of the second layer 
		bbox_wall(4)<=xg5 and xs10 and ys11;
		bbox_wall(5)<=xg5 and xs10 and yg4;
		bbox_wall(6)<=yg5 and ys10 and xg4;
		bbox_wall(7)<=yg5 and ys10 and xs11; 
		--(the walls are thinner on the second layer)
		-------------------------------------
		bbox_dot<=xg6 and xs9 and yg6 and ys9;
		-------------------------------------
		bbox_v<=xg3 and xs12 and yg1 and ys14;
		bbox_h<=xg1 and xs14 and yg3 and ys12;
		-------------------------------------
		bbox_border(0)<=ye0;
		bbox_border(1)<=ye15;
		bbox_border(2)<=xe15;
		bbox_border(3)<=xe0;
		-------------------------------------
		bbox_jump(0)<=ye0 or (ye1 and dx(1));
		bbox_jump(1)<=ye15 or (ye14 and dx(0));
		bbox_jump(2)<=xe15 or (xe14 and dy(1));
		bbox_jump(3)<=xe0 or (xe1 and dy(0));
	end process;



end behaviour;
