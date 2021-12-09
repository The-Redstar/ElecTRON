library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


architecture behaviour of test_data_gen is

	signal x,y,next_x,next_y:	unsigned(4 downto 0);
	signal x_vec,y_vec:			std_logic_vector(4 downto 0);

begin

	x_vec<=std_logic_vector(x);
	y_vec<=std_logic_vector(y);

	process(clk)
	begin
		if rising_edge(clk) then
			if rst='1' or mem_rst='1' then
				x <= to_unsigned(0,5);
				y <= to_unsigned(0,5);
			else
				x <= next_x;
				y <= next_y;
			end if;
		end if;
	end process;


	process(x_incr,y_incr)
	begin
		if x_incr='1' then
			next_x<=x+1;
		else
			next_x<=x;
		end if;
		
		if y_incr='1' then
			next_y<=y+1;
		else
			next_y<=y;
		end if;
	end process;
	
	process(x,y)
	begin
		if y=to_unsigned(0,5) then --empty
			data   <="00000000";
			borders<="00000000";
			jumps  <="00000000";
		elsif y=to_unsigned(1,5) then --borders
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="000";
		elsif y=to_unsigned(2,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="001";
		elsif y=to_unsigned(3,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="010";
		elsif y=to_unsigned(4,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="011";
		elsif y=to_unsigned(5,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="100";
		elsif y=to_unsigned(6,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="101";
		elsif y=to_unsigned(7,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="110";
		elsif y=to_unsigned(8,5) then
			data   <="00000000";
			jumps  <="00000000";
			borders(4 downto 0)<=x_vec;
			borders(7 downto 5)<="111";
			
		elsif y=to_unsigned(9,5) then --jumps
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="000";
		elsif y=to_unsigned(10,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="001";
		elsif y=to_unsigned(11,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="010";
		elsif y=to_unsigned(12,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="011";
		elsif y=to_unsigned(13,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="100";
		elsif y=to_unsigned(14,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="101";
		elsif y=to_unsigned(15,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="110";
		elsif y=to_unsigned(16,5) then
			data   <="00000000";
			borders<="00000000";
			jumps(4 downto 0)<=x_vec;
			jumps(7 downto 5)<="111";
		
		elsif y=to_unsigned(17,5) then --data
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="000";
		elsif y=to_unsigned(18,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="001";
		elsif y=to_unsigned(19,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="010";
		elsif y=to_unsigned(20,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="011";
		elsif y=to_unsigned(21,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="100";
		elsif y=to_unsigned(22,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="101";
		elsif y=to_unsigned(23,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="110";
		elsif y=to_unsigned(24,5) then
			jumps  <="00000000";
			borders<="00000000";
			data(4 downto 0)<=x_vec;
			data(7 downto 5)<="111";
		else
			jumps  <="00000000";
			borders<="00000000";
			data   <="00000000";
		end if;
	end process;

	player0_pos<="01110100000";
	player0_dir<="00";
	player0_state<="00";
	
	player1_pos<="11110100001";
	player1_dir<="11";
	player1_state<="11";
	
	game_state<="111"; --playing game


end behaviour;

