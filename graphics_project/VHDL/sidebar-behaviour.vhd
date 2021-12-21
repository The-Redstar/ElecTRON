library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


architecture behaviour of sidebar is

	signal dirs			: std_logic_vector(3 downto 0);
	
	signal sxo10,sxo2								: std_logic_vector(6 downto 0);
	signal sprite_x_o12, sprite_x_o10, sprite_x_o2	: std_logic_vector(4 downto 0); --offset, /4, max 32 wide
	--signal sprite_y_o212 :std_logic_vector(2 downto 0); --for 8 high sprites
	
	signal x16	: std_logic_vector(2 downto 0); -- scale /16
	signal y16	: std_logic_vector(4 downto 0); -- scale /16
	signal x4	: std_logic_vector(4 downto 0); -- scale /16
	signal y4	: std_logic_vector(6 downto 0); -- scale /16
	
	signal player_mask : std_logic_vector(3 downto 0); --mask that is either 1100 or 0011, for easy color selection
	
	type sprite_table is array (integer range <>,integer range <>) of std_logic;
	
	constant win_sprite : sprite_table(0 to 7, 0 to 15) := ("1000101110100100","1000100100110100","1000100100101100","1010100100100100","0101001110100100","0000000000000000","0000000000000000","0000000000000000");--index (y,x)
	constant lose_sprite : sprite_table(0 to 7, 0 to 15) := ("1000010001101110","1000101010001000","1000101001001100","1000101000101000","1110010011001110","0000000000000000","0000000000000000","0000000000000000");
	constant tie_sprite : sprite_table(0 to 7, 0 to 15) := ("0011101110111000","0001000100100000","0001000100110000","0001000100100000","0001001110111000","0000000000000000","0000000000000000","0000000000000000");
	constant ready_sprite : sprite_table(0 to 7, 0 to 31) := ("11001110010011001010000000000000","10101000101010101010000000000000","11001100111010100100000000000000","10101000101010100100000000000000","10101110101011000100000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000");
	constant boost_sprite : sprite_table(0 to 7, 0 to 31) := ("11000100010001101110000000000000","10101010101010000100000000000000","11001010101001000100000000000000","10101010101000100100000000000000","11000100010011000100000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000");
	constant pick_sprite : sprite_table(0 to 7, 0 to 15) := ("1100111001101010","1010010010001010","1100010010001100","1000010010001010","1000111001101010","0000000000000000","0000000000000000","0000000000000000");
	constant map_sprite : sprite_table(0 to 7, 0 to 15) := ("0100010010011000","0110110101010100","0101010111011000","0100010101010000","0100010101010000","0000000000000000","0000000000000000","0000000000000000");
	constant speed_sprite : sprite_table(0 to 7, 0 to 31) := ("01101100111011101100000000000000","10001010100010001010000000000000","01001100110011001010000000000000","00101000100010001010000000000000","11001000111011101100000000000000","00000000000000000000000000000000","00000000000000000000000000000000","00000000000000000000000000000000");
	constant input_sprite : sprite_table(0 to 7, 0 to 7) := ("00111100","01000010","10000001","10000001","10000001","10000001","01000010","00111100");
	constant input_active_sprite : sprite_table(0 to 7, 0 to 7) := ("00111100","01111110","11111111","11111111","11111111","11111111","01111110","00111100");


begin

	--scaled and offset signals
	x16 <= x(6 downto 4);
	y16 <= y(8 downto 4);
	x4 <= x(6 downto 2);
	y4 <= y(8 downto 2);
	
	sprite_x_o12 <= std_logic_vector(unsigned(x(6 downto 2))-to_unsigned(3,5));
	
	sxo10 <= std_logic_vector(unsigned(x)-to_unsigned(10,7));
	sprite_x_o10 <= sxo10(6 downto 2);
	
	sxo2 <= std_logic_vector(unsigned(x)-to_unsigned(2,7));
	sprite_x_o2 <= sxo2(6 downto 2);

--	sprite_y_o212 <= std_logic_vector(unsigned(y(8 downto 2))-to_unsigned(53,7));



	--mode="010" win0/lose1
	--mode="011" win1/lose0
	--mode="001" tie
	
	--mode="101" waiting for ready
	
	--mode="000" start screen -> draw map/speed
	
	--mode="111" playing game
	

	--win 16x8:
	--x//4-3
	
	--lose/pick 16x8
	--(x-10)//4
	
	--tie 16x8
	--(x-10)//4 with 2 leading empty pixels

	--map 16x8
	--(x-10)//4 with 1 leading empty pixel

	--boost/ready/speed 32x8
	--(x-2)//4
	
	
	process(player)
	begin
		if player='0' then
			player_mask<="0011";
		else
			player_mask<="1100";
		end if;
	end process;
	
	--input indicators
--	process(dir)
--	begin
--		case dir is
--			when "00" => dirs <= "0001";
--			when "01" => dirs <= "0010";
--			when "10" => dirs <= "0100";
--			when others => dirs <= "1000";
--		end case;
--	end process;
	
	--color selection process
	process(x,y,x16,y16,dir,sprite_x_o12, sprite_x_o10, sprite_x_o2, player, mode, ready, boost, player_mask)
		variable input_pixel,input_active_pixel	: boolean;
	begin
		
		--default to black
		color <= "0000";
		
		--top: win/lose/tie text
		if to_unsigned(8,7)<=unsigned(y4) and unsigned(y4)<to_unsigned(16,7) then --win/lose/tie sprites
			if mode="001" then --tie
				if tie_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o10(3 downto 0))))='1' and sprite_x_o10(4)='0' then
					color<=player_mask;
				end if;
			elsif (mode="010" and player='0')  or (mode="011" and player='1') then --win
				if win_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o12(3 downto 0))))='1' and sprite_x_o12(4)='0' then
					color<=player_mask;
				end if;
			elsif (mode="010" and player='1')  or (mode="011" and player='0') then --lose
				if lose_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o10(3 downto 0))))='1' and sprite_x_o10(4)='0' then
					color<=player_mask;
				end if;
			end if;
		end if;
		
		--ready/boost
		if to_unsigned(56,7)<=unsigned(y4) and unsigned(y4)<to_unsigned(64,7) then --win/lose/tie sprites
			if mode="101" then --waiting for ready
				if ready_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o2)))='1' then
					if ready='1' then
						color<=player_mask;
					else
						color<="0101";
					end if;
				end if;
			elsif mode="111" and boost='1' then --playing state
				if boost_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o2)))='1' then
					color<=player_mask;
				end if;
			end if;
		end if;
		
		--pick map/speed
		if mode="000" then --homescreen
			if to_unsigned(80,7)<=unsigned(y4) and unsigned(y4)<to_unsigned(88,7) then --pick
				if pick_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o10(3 downto 0))))='1' and sprite_x_o10(4)='0' then
					color<=player_mask;
				end if;
			elsif to_unsigned(88,7)<=unsigned(y4) and unsigned(y4)<to_unsigned(96,7) then --map/speed
				if player='0' then --map
					if map_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o10(3 downto 0))))='1' and sprite_x_o10(4)='0' then
						color<=player_mask;
					end if;
				else --speed
					if speed_sprite(to_integer(unsigned(y4(2 downto 0))),to_integer(unsigned(sprite_x_o2)))='1' then
						color<=player_mask;
					end if;
				end if;
			end if;
		end if;
		
		--input indicators
		--coordinate x16,y16 correct, and correct dirs, and sprite output correct -> player color
		input_pixel := (input_sprite(to_integer(unsigned(y(3 downto 1))),to_integer(unsigned(x(3 downto 1))))='1');
		input_active_pixel := (input_active_sprite(to_integer(unsigned(y(3 downto 1))),to_integer(unsigned(x(3 downto 1))))='1');
		
		if (unsigned(x16)=to_unsigned(2,3) and unsigned(y16)=to_unsigned(26,5)) and (input_pixel or (input_active_pixel and dir="00")) then
			color<=player_mask;
		elsif (unsigned(x16)=to_unsigned(1,3) and unsigned(y16)=to_unsigned(27,5)) and (input_pixel or (input_active_pixel and dir="01")) then
			color<=player_mask;
		elsif (unsigned(x16)=to_unsigned(3,3) and unsigned(y16)=to_unsigned(27,5)) and (input_pixel or (input_active_pixel and dir="11")) then
			color<=player_mask;
		elsif (unsigned(x16)=to_unsigned(2,3) and unsigned(y16)=to_unsigned(26,5)) and (input_pixel or (input_active_pixel and dir="10")) then
			color<=player_mask;
		end if;
			
		
	end process;
	
	




end behaviour;

