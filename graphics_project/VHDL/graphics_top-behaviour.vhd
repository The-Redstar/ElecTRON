library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of graphics_top is


	--VGA signals
	signal h_count, next_h_count, v_count, next_v_count:	unsigned(9 downto 0);
	signal next_colour:										std_logic;
	signal next_v_sync, next_h_sync:						std_logic;

	--VGA constants
	constant B : natural := 96;  -- horizontal sync
	constant C : natural := 48;  -- back porch + border
	constant D : natural := 640; -- visible area
	constant E : natural := 16;  -- border + front porch
	constant A : natural := B + C + D + E;  -- line

	constant P : natural := 2;   -- vertical sync
	constant Q : natural := 32+1;  -- back porch + border, +1 for vsync clocking correction
	constant R : natural := 480; -- visible area
	constant S : natural := 10-1;  -- border + front porch, -1 for vsync clocking correction
	constant O : natural := P + Q + R + S;  -- all lines



begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				h_count <= to_unsigned(0,10);
				v_count <= to_unsigned(0,10);
				h_sync <= '1';
				v_sync <= '1';	
				colour <= '0';
			else
				h_count <= next_h_count;
				v_count <= next_v_count;
				h_sync <= next_h_sync ;
				v_sync <= next_v_sync;
				colour <= next_colour;
			end if;
		end if;
	end process;

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

		if v_count<P then
			next_v_sync <= '0';
		else
			next_v_sync <= '1';
		end if;
	end process;

	process(h_count) --horizontal timing
	begin
		if h_count = A-1 then
			next_h_count <= to_unsigned(0,10);
		else
			next_h_count <= h_count+1;
		end if;

		if h_count<B then --clocking signals means they are delayed by one cycle
			next_h_sync <= '0';
		else
			next_h_sync <= '1';
		end if;
	end process;


	process(h_count,v_count) --calculate output color (gridded pattern)
		variable x,y	: unsigned(9 downto 0);
	begin
		if B+C<=h_count and h_count<B+C+D and P+Q<=v_count and v_count<P+Q+R then
			x:=h_count-(B+C+to_unsigned(80,10));
			y:=v_count-(P+Q);
			
			if x<R then
				next_colour <= x(4) xor y(4);
			else
				next_colour <= '0';
			end if;
		else
			next_colour <= '0';
		end if;
	end process;


end behaviour;
