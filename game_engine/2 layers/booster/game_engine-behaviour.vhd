library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of game_engine is

	type game_state is (reset_state, loading_state, check_booster, home_screen, get_ready, before_start_state, read_inputs, read1_memory_player_0, read1_memory_player_1, read2_memory_player_0, read2_memory_player_1, check_who_won, wait_state, write_memory_player_0, write_memory_player_1, change_data, check_how_collision, player_0_won, player_1_won, tie, busy_reset, check_jump_0, check_jump_1, initial_conditions);


	signal state, new_state: game_state;
	--signals for registers
	signal direction_0, direction_1, d_direction_0, d_direction_1 : std_logic_vector(1 downto 0);
	signal d_next_direction_0, d_next_direction_1, next_direction_0, next_direction_1 : std_logic_vector(1 downto 0);
	signal position_0, position_1, next_position_0, next_position_1 : std_logic_vector (9 downto 0);
	signal d_position_0, d_position_1 : std_logic_vector (9 downto 0);
	signal layer_0, layer_1, d_layer_0, d_layer_1, e_layer_0, e_layer_1, d_booster_0, d_booster_1, e_booster_0, e_booster_1, d_booster_sync, e_booster_sync, e_map_select, e_speed_select, e_boost_audio: std_logic;
	signal next_layer_0, next_layer_1, d_next_layer_0, d_next_layer_1, e_next_layer_0, e_next_layer_1 : std_logic;
	signal border_0, border_1, d_border_0, d_border_1, e_border_0, e_border_1: std_logic;
	signal d_read_data_reg, read_data_reg : std_logic_vector (7 downto 0);
	signal player_0_state, player_1_state, d_player_0_state, d_player_1_state, d_map_select, d_speed_select, speed_select, d_boost_audio: std_logic_vector (1 downto 0);
	signal e_position_0, e_position_1, e_read_data_reg, e_direction_0, e_direction_1, e_next_direction_0, e_next_direction_1, e_player_0_state, e_player_1_state: std_logic;
	--signals for memory communication
	signal read_data_fsm, write_data_fsm : std_logic_vector(7 downto 0);
    signal write_enable_fsm, clear_fsm, read_enable_fsm, mem_com_ready : std_logic;	
	signal address_fsm 	   : std_logic_vector(9 downto 0);
	--signals for busy counter
	signal busy_counter_reset: std_logic;
	signal unsigned_busy_count: std_logic_vector(6 downto 0);
	--other signals
	signal booster_begin_0, booster_begin_1, booster_0, booster_1, booster_sync, collision_middle, collision_head: std_logic;
	signal wallshape_0, wallshape_1 : std_logic_vector(2 downto 0);
	signal unsigned_speed : unsigned (4 downto 0);

	component busy_counter is
	port(clk               : in  std_logic;
		 global_reset 	   : in  std_logic;
		 game_engine_reset : in  std_logic;
         busy              : in  std_logic;
         busy_count        : out std_logic_vector(6 downto 0));
	end component;	

	component memory_communication is
	port (  clk                : in  std_logic;
        	reset              : in  std_logic;
			address_fsm	   	   : in  std_logic_vector(9 downto 0);
			write_enable_fsm   : in  std_logic;
        	read_enable_fsm    : in  std_logic;
			clear_fsm          : in  std_logic;
        	write_data_fsm     : in  std_logic_vector(7 downto 0);
			memory_ready	   : in  std_logic;
			read_data_mem	   : in  std_logic_vector(7 downto 0);
        	mem_com_ready      : out std_logic;
			read_data_fsm	   : out std_logic_vector(7 downto 0);
			go_to	           : out std_logic;
			clear_mem	       : out std_logic;
			write_enable_mem   : out std_logic;
        	write_data_mem     : out std_logic_vector(7 downto 0);
        	address_mem        : out std_logic_vector(9 downto 0));
	end component;

	component ge_register is
		port(clk, reset	  	: in  std_logic;	
			e_position_0	: in  std_logic;
			e_position_1 	: in  std_logic;
			d_position_0 	: in  std_logic_vector(9 downto 0);
			d_position_1  	: in  std_logic_vector(9 downto 0);
			e_layer_0	  	: in  std_logic;		
			e_layer_1	  	: in  std_logic;
			d_layer_0	  	: in  std_logic;
			d_layer_1	  	: in  std_logic;
			e_booster_0	  	: in  std_logic;		
			e_booster_1	  	: in  std_logic;
			d_booster_0	  	: in  std_logic;
			d_booster_1	  	: in  std_logic;
			e_boost_audio 	: in  std_logic;
			d_boost_audio 	: in  std_logic_vector(1 downto 0);
			e_booster_sync	: in  std_logic;
			d_booster_sync  : in  std_logic;
			e_next_layer_0	: in  std_logic;
			e_next_layer_1	: in  std_logic;
			d_next_layer_0	: in  std_logic;
			d_next_layer_1	: in  std_logic;
			e_border_0	  	: in  std_logic;
			e_border_1	  	: in  std_logic;
			d_border_0	  	: in  std_logic;
			d_border_1	  	: in  std_logic;
			e_read_mem    	: in  std_logic;
			d_read_mem    	: in  std_logic_vector(7 downto 0);
			e_direction_0 	: in  std_logic;
			e_direction_1 	: in  std_logic;
			d_direction_0 	: in  std_logic_vector(1 downto 0);
			d_direction_1 	: in  std_logic_vector(1 downto 0);
			e_next_dir_0  	: in  std_logic;
			e_next_dir_1  	: in  std_logic;
			d_next_dir_0  	: in  std_logic_vector(1 downto 0);
			d_next_dir_1  	: in  std_logic_vector(1 downto 0);
			e_p_state_0   	: in  std_logic;
			e_p_state_1  	: in  std_logic;
			d_p_state_0   	: in  std_logic_vector(1 downto 0);
			d_p_state_1   	: in  std_logic_vector(1 downto 0);
			e_map_select  	: in  std_logic;
			d_map_select  	: in  std_logic_vector(1 downto 0);
			e_speed_select	: in  std_logic;
			d_speed_select	: in  std_logic_vector(1 downto 0);
			q_position_0  	: out std_logic_vector(9 downto 0);
			q_position_1  	: out std_logic_vector(9 downto 0);
			q_layer_0	  	: out std_logic;
			q_layer_1	  	: out std_logic;
			q_booster_0	  	: out std_logic;
			q_booster_1	  	: out std_logic;
			q_booster_sync	: out std_logic;
			q_boost_audio 	: out std_logic_vector(1 downto 0);
			q_next_layer_0	: out std_logic;
			q_next_layer_1	: out std_logic;
			q_border_0	  	: out std_logic;
			q_border_1	  	: out std_logic;
			q_read_mem    	: out std_logic_vector(7 downto 0);
			q_direction_0 	: out std_logic_vector(1 downto 0);
			q_direction_1 	: out std_logic_vector(1 downto 0);
			q_next_dir_0  	: out std_logic_vector(1 downto 0);
			q_next_dir_1  	: out std_logic_vector(1 downto 0);
			q_p_state_0   	: out std_logic_vector(1 downto 0);
			q_p_state_1   	: out std_logic_vector(1 downto 0);
			q_map_select  	: out std_logic_vector(1 downto 0);
			q_speed_select	: out std_logic_vector(1 downto 0));
	end component;

begin

reg: ge_register port map (clk => clk,
			reset         	=> reset,	
			e_position_0  	=> e_position_0,
			e_position_1  	=> e_position_1,
			d_position_0  	=> d_position_0,
			d_position_1  	=> d_position_1,
			e_layer_0	  	=> e_layer_0,
			e_layer_1	  	=> e_layer_1,
			d_layer_0	  	=> d_layer_0,
			d_layer_1	  	=> d_layer_1,
			e_booster_0	  	=> e_booster_0,
			e_booster_1	  	=> e_booster_1,
			d_booster_0	  	=> d_booster_0,
			d_booster_1	  	=> d_booster_1,
			e_boost_audio 	=> e_boost_audio,
			d_boost_audio 	=> d_boost_audio,
			e_booster_sync	=> e_booster_sync,
			d_booster_sync	=> d_booster_sync,
			e_next_layer_0	=> e_next_layer_0,
			e_next_layer_1	=> e_next_layer_1,
			d_next_layer_0	=> d_next_layer_0,
			d_next_layer_1	=> d_next_layer_1,
			e_border_0	  	=> e_border_0,
			e_border_1	  	=> e_border_1,
			d_border_0	  	=> d_border_0,
			d_border_1	  	=> d_border_1,
			e_read_mem    	=> e_read_data_reg,
			d_read_mem    	=> d_read_data_reg,
			e_direction_0	=> e_direction_0,
			e_direction_1 	=> e_direction_1,
			d_direction_0 	=> d_direction_0,
			d_direction_1 	=> d_direction_1,
			e_next_dir_0  	=> e_next_direction_0,
			e_next_dir_1  	=> e_next_direction_1,
			d_next_dir_0 	=> d_next_direction_0,
			d_next_dir_1  	=> d_next_direction_1,
			e_p_state_0   	=> e_player_0_state,
			e_p_state_1   	=> e_player_1_state,
			d_p_state_0   	=> d_player_0_state,
			d_p_state_1   	=> d_player_1_state,
			e_map_select  	=> e_map_select,
			d_map_select  	=> d_map_select,
			e_speed_select	=> e_speed_select,
			d_speed_select	=> d_speed_select,
			q_position_0  	=> position_0,
			q_position_1 	=> position_1,
			q_layer_0	  	=> layer_0,
			q_layer_1	  	=> layer_1,
			q_booster_0	  	=> booster_0,
			q_booster_1	  	=> booster_1,
			q_boost_audio 	=> boost_audio,
			q_booster_sync	=> booster_sync,
			q_next_layer_0	=> next_layer_0,
			q_next_layer_1	=> next_layer_1,
			q_border_0	  	=> border_0,
			q_border_1	  	=> border_1,
			q_read_mem    	=> read_data_reg,
			q_direction_0 	=> direction_0,
			q_direction_1 	=> direction_1,
			q_next_dir_0  	=> next_direction_0,
			q_next_dir_1 	=> next_direction_1,
			q_p_state_0   	=> player_0_state,
			q_p_state_1   	=> player_1_state,
			q_map_select 	=> map_select,
			q_speed_select	=> speed_select);
			
counter: busy_counter port map (
			clk 				=> clk,
			global_reset 		=> reset,
			game_engine_reset 	=> busy_counter_reset,
			busy 				=> busy,
			busy_count 				=> unsigned_busy_count);

mem_com: memory_communication port map (
					clk 				=> clk,
					reset 				=> reset,
					address_fsm 		=> address_fsm,
					write_enable_fsm 	=> write_enable_fsm,
					read_enable_fsm 	=> read_enable_fsm,
					clear_fsm 			=> clear_fsm,
					write_data_fsm 		=> write_data_fsm,
					memory_ready 		=> memory_ready,
					read_data_mem 		=> read_memory,
					mem_com_ready 		=> mem_com_ready,
					read_data_fsm 		=> read_data_fsm,
					go_to 				=> go_to,
					clear_mem 			=> clear_memory,
					write_enable_mem 	=> write_enable,
					write_data_mem 		=> write_memory,
					address_mem 		=> address);
		
-- outputs from the register to the graphics engine			
position_0_vga (9 downto 0) <= position_0;
position_0_vga (10) 		<= layer_0;
position_1_vga (9 downto 0) <= position_1;
position_1_vga (10)			<= layer_1;
direction_0_vga 			<= direction_0;
direction_1_vga			 	<= direction_1;
player_state_0_vga 			<= player_0_state;
player_state_1_vga 			<= player_1_state;





updates: 	process (clk)
	begin
		if (clk'event and clk = '1') then
			-- go to the reset state when the reset button is pressed
			if (reset = '1') then
				state <= reset_state;	
			-- go to the next state according to the FSM
			else
				state <= new_state;
			end if;
		end if;
	end process;

begin_booster: process (input, direction_0, direction_1)
	begin
	-- if a player presses the opposite direction of what it is currently going it starts to boost
		if ((input(1) = (not direction_0(1))) and (input(0) = direction_0(0))) then 
			booster_begin_0 <= '1';
		else
			booster_begin_0 <= '0';
		end if;
		
		if ((input(3) = (not direction_1(1))) and (input(2) = direction_1(0))) then
			booster_begin_1 <= '1';
		else
			booster_begin_1 <= '0';
		end if;
	end process;

wallshape: 	process (direction_0, direction_1, next_direction_0, next_direction_1)
	begin
		
		wallshape_0 <= "000";
		wallshape_1 <= "000";
		
				-- determine the wall shape on the cell of player 0
				-- previous: left, next: left or previous: right, next: right --> horizontal
				if ((direction_0= "01") and (next_direction_0  ="01")) or  ((direction_0= "11") and (next_direction_0  ="11")) then 
					wallshape_0 <= "001"; 
				-- previous: up, next: up or previous: down, next: down --> vertical
				elsif ((direction_0= "00") and (next_direction_0  ="00")) or  ((direction_0= "10") and (next_direction_0  ="10")) then
					wallshape_0 <= "010";
				-- previous: up, next: right or previous: left, next: down --> corner in the lower right
				elsif ((direction_0= "00") and (next_direction_0  ="11")) or  ((direction_0= "01") and (next_direction_0  ="10")) then 
					wallshape_0 <= "110"; 
				-- previous: up, next: left or previous: right, next: down --> corner in the lower left
				elsif ((direction_0= "00") and (next_direction_0  ="01")) or  ((direction_0= "11") and (next_direction_0  ="10")) then 	
					wallshape_0 <= "101"; 
				-- previous: right, next: up or previous: down, next: left --> corner in the upper left
				elsif ((direction_0= "11") and (next_direction_0  ="00")) or  ((direction_0= "10") and (next_direction_0  ="01")) then 
					wallshape_0 <= "100"; 
				-- previous: down, next: right or previous: left, next: up --> corner in the upper right
				elsif ((direction_0= "10") and (next_direction_0 ="11")) or  ((direction_0= "01") and (next_direction_0  ="00")) then 
					wallshape_0 <= "111"; 
				end if;

				-- determine the wall shape on the cell of player 1
				-- previous: left, next: left or previous: right, next: right --> horizontal
				if ((direction_1= "01") and (next_direction_1 ="01")) or  ((direction_1= "11") and (next_direction_1 ="11")) then 
					wallshape_1 <= "001";
				-- previous: up, next: up or previous: down, next: down --> vertical
				elsif ((direction_1= "00") and (next_direction_1 ="00")) or  ((direction_1= "10") and (next_direction_1 ="10")) then 
					wallshape_1 <= "010"; 
				-- previous: up, next: right or previous: left, next: down --> corner in the lower right
				elsif ((direction_1= "00") and (next_direction_1 ="11")) or  ((direction_1= "01") and (next_direction_1 ="10")) then 
					wallshape_1 <= "110"; 
				-- previous: up, next: left or previous: right, next: down --> corner in the lower left
				elsif ((direction_1= "00") and (next_direction_1 ="01")) or  ((direction_1= "11") and (next_direction_1 ="10")) then 
					wallshape_1 <= "101"; 
				-- previous: right, next: up or previous: down, next: left --> corner in the upper left
				elsif ((direction_1= "11") and (next_direction_1 ="00")) or  ((direction_1= "10") and (next_direction_1 ="01")) then 
					wallshape_1 <= "100"; 
				-- previous: down, next: right or previous: left, next: up --> corner in the upper right
				elsif ((direction_1= "10") and (next_direction_1 ="11")) or  ((direction_1= "01") and (next_direction_1 ="00")) then 
					wallshape_1 <= "111"; 
				end if;
	end process;

position: 	process (next_direction_0, next_direction_1, position_0, position_1, layer_0, layer_1, ramp, border) --creating next_position, checking for jumps and the border
	begin
		d_next_layer_0 <= layer_0;
		d_next_layer_1 <= layer_1;
		d_border_0	  <= '0';
		d_border_1	  <= '0';
		if (next_direction_0 = "01") then 		-- moves to the left, x is decreased with 1
			next_position_0(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) - 1, 5));
			next_position_0(9 downto 5) <= position_0(9 downto 5);
			--check if player 0 collides against border of switches from layer
			if (layer_0 = '0') then
				if (ramp(1) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(1) = '1') then
					d_border_0 <= '1';
				end if;
			else 
				if (ramp(5) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(5) = '1') then
					d_border_0 <= '1';
				end if;
			end if;
		elsif (next_direction_0 = "11") then 	-- moves to the right, x is increased with 1
			next_position_0(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) + 1, 5));
			next_position_0(9 downto 5) <= position_0(9 downto 5);
			--check if player 0 collides against border of switches from layer
			if (layer_0 = '0') then
				if (ramp(3) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(3) = '1') then
					d_border_0 <= '1';
				end if;
			else 
				if (ramp(7) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(7) = '1') then
					d_border_0 <= '1';
				end if;
			end if;
		elsif (next_direction_0 <= "00") then 	-- moves up, y is decreased with 1
			next_position_0(4 downto 0) <= position_0(4 downto 0);
			next_position_0(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(9 downto 5))) - 1, 5));
			--check if player 0 collides against border of switches from layer
			if (layer_0 = '0') then
				if (ramp(0) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(0) = '1') then
					d_border_0 <= '1';
				end if;
			else 
				if (ramp(4) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(4) = '1') then
					d_border_0 <= '1';
				end if;
			end if;
		else 									--moves down, y is increased with 1
			next_position_0(4 downto 0) <= position_0(4 downto 0);
			next_position_0(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(9 downto 5))) + 1, 5));
			--check if player 0 collides against border of switches from layer
			if (layer_0 = '0') then
				if (ramp(2) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(2) = '1') then
					d_border_0 <= '1';
				end if;
			else 
				if (ramp(6) = '1') then
					d_next_layer_0 <= not layer_0;
				end if;
				if (border(6) = '1') then
					d_border_0 <= '1';
				end if;
			end if;
		end if;


		-- determine the next position of player 1
		if (next_direction_1 = "01") then 		-- moves to the left, x is decreased with 1
			next_position_1(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(4 downto 0))) - 1, 5));
			next_position_1(9 downto 5) <= position_1(9 downto 5);
			--check if player 1 collides against border of switches from layer
			if (layer_1 = '0') then
				if (ramp(1) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(1) = '1') then
					d_border_1 <= '1';
				end if;
			else 
				if (ramp(5) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(5) = '1') then
					d_border_1 <= '1';
				end if;
			end if;
		elsif (next_direction_1 = "11") then 	-- moves to the right, x is increased with 1
			next_position_1(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(4 downto 0))) + 1, 5));
			next_position_1(9 downto 5) <= position_1(9 downto 5);
			--check if player 1 collides against border of switches from layer
			if (layer_1 = '0') then
				if (ramp(3) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(3) = '1') then
					d_border_1 <= '1';
				end if;
			else 
				if (ramp(7) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(7) = '1') then
					d_border_1 <= '1';
				end if;
			end if;
		elsif (next_direction_1 <= "00") then 	-- moves up, y is decreased with 1
			next_position_1(4 downto 0) <= position_1(4 downto 0);
			next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) - 1, 5));
			--check if player 1 collides against border of switches from layer
			if (layer_1 = '0') then
				if (ramp(0) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(0) = '1') then
					d_border_1 <= '1';
				end if;
			else 
				if (ramp(4) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(4) = '1') then
					d_border_1 <= '1';
				end if;
			end if;
		else 									--moves down, y is increased with 1
			next_position_1(4 downto 0) <= position_1(4 downto 0);
			next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) + 1, 5));	
			--check if player 1 collides against border of switches from layer
			if (layer_1 = '0') then
				if (ramp(2) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(2) = '1') then
					d_border_1 <= '1';
				end if;
			else 
				if (ramp(6) = '1') then
					d_next_layer_1 <= not layer_1;
				end if;
				if (border(6) = '1') then
					d_border_1 <= '1';
				end if;
			end if;
		end if;
	end process;


collision: process (next_position_0, next_position_1, position_0, position_1, layer_0, layer_1, next_layer_0, next_layer_1)
	begin
	--check if the players collide at each other
		collision_middle <= '0';
		collision_head <= '0';
		if ((next_position_0 = next_position_1) and (next_layer_0 = next_layer_1)) then -- collide at eachother at middle of square
			 collision_middle <= '1';	
		elsif ((position_0 = next_position_1) and (layer_0 = next_layer_1)) and ((position_1 = next_position_0) and (layer_1 = next_layer_0)) then -- collide at eachother at border			collision_head_0< = 
			collision_head <= '1';
		end if;
	end process;

game_speed: process(speed_select)
	begin
	--determine the speed of the game
		if (test_button = '1') then --very low speed to test the game
			unsigned_speed <= "11111";
		elsif (speed_select = "00") then
			unsigned_speed <= "01010";
		elsif (speed_select = "01") then
			unsigned_speed <= "01000";
		elsif (speed_select = "10") then
			unsigned_speed <= "00110";
		else unsigned_speed <= "00101";
		end if;
end process;

create_next_state: 	process (state, new_state, reset, input, busy, clk, unsigned_busy_count, direction_0, direction_1, next_direction_0, next_direction_1, position_0, position_1, next_position_0, next_position_1, player_0_state, player_1_state, mem_com_ready, select_button, position_grid_0, position_grid_1, read_data_fsm, layer_0, layer_1, read_data_reg, wallshape_0, wallshape_1, next_layer_0, next_layer_1, border_0, border_1, collision_head, collision_middle)
	begin

		--set all signals to zero if not specified in case statement
		state_vga 					<= "000";		  
		busy_counter_reset			<= '0';
		e_position_0				<= '0';
		e_position_1				<= '0';	
		e_layer_0					<= '0';
		e_layer_1					<= '0';
		e_booster_0					<= '0';
		e_booster_1					<= '0';
		e_boost_audio				<= '0';
		e_booster_sync				<= '0';
		e_next_layer_0				<= '0';
		e_next_layer_1				<= '0';
		e_border_0					<= '0';
		e_border_1					<= '0';
		e_read_data_reg				<= '0';
		e_direction_0				<= '0';
		e_direction_1				<= '0';
		e_next_direction_0			<= '0';	
		e_next_direction_1			<= '0';
		e_player_0_state			<= '0';
		e_player_1_state			<= '0';			
		e_map_select				<= '0';	
		e_speed_select				<= '0';				
		d_position_0				<= (others => '0');
		d_position_1				<= (others => '0');	
		d_layer_0					<= '0';
		d_layer_1					<= '0';
		d_booster_0					<= '0';
		d_booster_1					<= '0';
		d_boost_audio				<= (others => '0');
		d_booster_sync				<= '0';
		d_read_data_reg				<= (others => '0');
		d_direction_0				<= (others => '0');
		d_direction_1				<= (others => '0');
		d_next_direction_0			<= (others => '0');	
		d_next_direction_1			<= (others => '0');
		d_player_0_state			<= (others => '0');
		d_player_1_state			<= (others => '0');
		d_map_select				<= (others => '0');
		d_speed_select				<= (others => '0');
		address_fsm	   				<= (others => '0');
		write_enable_fsm   			<= '0';
        read_enable_fsm    			<= '0';
		clear_fsm         			<= '0';
        write_data_fsm     			<= (others => '0');
		pulse_audio					<= '0';
	

		
		case state is
			when reset_state =>
				-- in this state all the values are set to zero to reset everything
				state_vga 				<= "100";
				if (select_button = '0') then
					new_state <= loading_state;
				else
					new_state <= reset_state;
				end if;
			
			when loading_state =>
				-- let the memory module know to clear the memory and check when the memory is done
				clear_fsm				<= '1';
				state_vga 				<= "100";
				
				-- initialize the state of the players
				e_player_0_state			<= '1';
				e_player_1_state			<= '1';

				d_player_0_state			<= "10";
				d_player_1_state			<= "10";
				
				-- when the memory is finished go to the next state: 'home_screen' otherwise stay in this state
				if (mem_com_ready = '1') then 
					new_state <= home_screen;
				else 
					new_state <= loading_state;
				end if;

			when home_screen =>
				state_vga				<="000";
				if (select_button = '1') then
					new_state <= initial_conditions;
				else 
					new_state <= home_screen;
				end if;
 
				-- speed and map are selected
				e_speed_select			<= '1';
				d_speed_select			<= input(3 downto 2);
				e_map_select			<= '1';
				d_map_select			<= input(1 downto 0);
				
			when initial_conditions =>
				state_vga 					<= "000";
				--setting the initial conditions from de grid controller
				e_position_0				<= '1';
				e_position_1				<= '1';
				d_position_0				<= position_grid_0 (9 downto 0);
				d_position_1				<= position_grid_1 (9 downto 0);
				
				e_layer_0					<= '1';
				e_layer_1					<= '1';
				d_layer_0					<= position_grid_0 (10);
				d_layer_1					<= position_grid_1 (10);
				
				e_direction_0				<= '1';
				e_direction_1				<= '1';
				d_direction_0				<= direction_grid_0;
				d_direction_1				<= direction_grid_1;
				
				e_booster_0					<= '1';
				e_booster_1					<= '1';
				e_booster_sync				<= '1';
				
				--select button has to be pressed twice, to make sure it doesnt go trough two sates with one press, there should be a check for 0.
				if (select_button = '0') then
					new_state <= get_ready;
				else
					new_state <= initial_conditions;
				end if;
				
			when get_ready =>
				-- wait for the player to press the button in the right direction and the select button: meaning they are ready to play
				state_vga 					<= "101";
				e_player_0_state			<= '1';
				e_player_1_state			<= '1';
				
				if ((input(1 downto 0) = direction_0) and (input(3 downto 2) = direction_1) and (select_button = '1')) then
					new_state 				<= before_start_state;
				else 
					new_state				<= get_ready;
				end if;

				if (input(1 downto 0) = direction_0) then
					d_player_0_state			<= "11"; --let graphics engine know player 0 is ready
				else 
					d_player_0_state			<= "10";
				end if;
				
				if (input(3 downto 2) = direction_1) then
					d_player_1_state			<= "11"; --let graphics engine know player 1 is ready
				else 
					d_player_1_state			<= "10";
				end if;
				
			when before_start_state =>
			--wait a bit more then two seconds before the game starts
				state_vga 				<= "101";
				if (unsigned( unsigned_busy_count) >= 127) then 
					new_state <= busy_reset;
				elsif (unsigned(unsigned_busy_count) >= 31) then
					pulse_audio <= not unsigned_busy_count(4);
				else
					new_state <= before_start_state;
				end if;

			when wait_state =>
				-- wait for a certain amount of busy signal cycles before going on
				-- this determines how fast a player moves in the playingfield
				state_vga 				<= "111";
				-- when waited long enough go the next state: busy_reset, otherwise keep waiting
				if (unsigned( unsigned_busy_count) >= unsigned_speed) then
					new_state <= busy_reset;
				else
					new_state <= wait_state;
				end if;

			when busy_reset => 
				-- reset the counter
				busy_counter_reset			<= '1';
				state_vga 					<= "111";
				new_state <= read_inputs;

			when read_inputs =>
				state_vga 					<= "111";
				e_booster_0 				<= '1';
				e_booster_1 				<= '1';
				e_boost_audio 				<= '1';
				e_booster_sync 				<= '1';
				d_booster_sync 				<= not booster_sync;
				
				-- remember the values of the input of the players in 'next_direction_#player'
				-- check if a player is boosting
				if (booster_begin_0 = '1') then
					d_booster_0					<= '1';
					d_boost_audio(0)			<= '1';
				else	
					e_next_direction_0			<= '1';
					d_next_direction_0			<= input(1 downto 0);
					d_booster_0 				<= booster_sync;
					d_boost_audio(0)			<= '0';
				end if;

				if (booster_begin_1 = '1') then
					d_booster_1 				<= '1';
					d_boost_audio(1)			<= '1';
				else	
					e_next_direction_1			<= '1';
					d_next_direction_1			<= input(3 downto 2);
					d_booster_1 				<= booster_sync;
					d_boost_audio(1)			<= '0';
				end if;									
	
				new_state <= check_booster;

			when check_booster =>
				-- go to new state depending on the value of 'booster_#player'
				state_vga 					<= "111";
				if (booster_0 = '1') then 
					new_state <= read1_memory_player_0;
				elsif (booster_1 = '1') then 
					new_state <= read1_memory_player_1;
				else
					new_state <= wait_state;
				end if;
				
			when read1_memory_player_0 =>
				-- read the data from the address of the next position of player 0
				state_vga   				<= "111";
				address_fsm 				<= position_0(9 downto 0);
				read_enable_fsm				<= '1';
				e_read_data_reg				<= '1';
				d_read_data_reg				<= read_data_fsm;
				-- wait till the memory module is done with processing the information to go to the next state.
				if (mem_com_ready = '1') then
					new_state <= check_jump_0; 
				else 
					new_state <= read1_memory_player_0;
				end if;
				
			when check_jump_0 =>
				state_vga   				<= "111";
				
				--check to switch layers
				--d_next_layer_0 is generated in the process for next position
				e_next_layer_0	<= '1';
				
				--checking for the border
				--d_border_0 is generated in the process for next position
				e_border_0 <= '1';
				
				new_state <= write_memory_player_0; 
				
			when write_memory_player_0 =>
				-- send to the memory module the wall shape of player 0 on the address of its position
				state_vga   				<= "111";
				write_enable_fsm			<= '1';
				address_fsm 				<= position_0(9 downto 0);

				--only write to the layer on which the player is and keep the bits of the other layer the same
				if (layer_0 = '0') then
					write_data_fsm(7 downto 4) 		<= read_data_reg(7 downto 4);
					write_data_fsm(3) 				<= '0';
					write_data_fsm(2 downto 0) 		<= wallshape_0;
				else 
					write_data_fsm(7) 				<= '0';
					write_data_fsm(6 downto 4) 		<= wallshape_0;
					write_data_fsm(3 downto 0) 		<= read_data_reg(3 downto 0);
				end if;
				
				-- wait until the memory is ready to go to the next state 
				if (mem_com_ready = '1') then
					if (booster_1 = '1') then 
						new_state <= read1_memory_player_1;
					else
						new_state <= read2_memory_player_0;
					end if;
				else 
					new_state <= write_memory_player_0;
				end if;

			when read1_memory_player_1 =>
				-- read the data from the address of the next position of player 1
				state_vga   				<= "111";
				address_fsm 				<= position_1(9 downto 0);
				read_enable_fsm				<= '1';
				e_read_data_reg				<= '1';
				d_read_data_reg				<= read_data_fsm;

				-- wait till the memory module is done with processing the information to go to the next state
				if (mem_com_ready = '1') then					
					new_state <= check_jump_1; 
				else 
					new_state <= read1_memory_player_1;
				end if;
		

			when check_jump_1 =>
				state_vga   				<= "111";
				
				--check to switch layers
				--d_next_layer_0 is generated in the process for next position
				e_next_layer_1	<= '1';
				
				--checking for the border
				--d_border_0 is generated in the process for next position
				e_border_1 <= '1';
				
				new_state <= write_memory_player_1; 

			when write_memory_player_1 =>
				-- send to the memory module the wall shape of player 1 on the address of its position
				state_vga   				<= "111";
				write_enable_fsm 				<= '1';
				address_fsm					<= position_1(9 downto 0);

				--only write to the layer on which the player is and keep the bits of the other layer the same
				if (layer_1 = '0') then
					write_data_fsm(7 downto 4) 		<= read_data_reg(7 downto 4);
					write_data_fsm(3) 				<= '1';
					write_data_fsm(2 downto 0) 		<= wallshape_1;
				else 
					write_data_fsm(7) 				<= '1';
					write_data_fsm(6 downto 4) 		<= wallshape_1;
					write_data_fsm(3 downto 0) 		<= read_data_reg(3 downto 0);
				end if;
				
				-- wait till the memory is finished before going to the next state
				if (mem_com_ready = '1') then
					if (booster_0 = '1') then
						new_state <= read2_memory_player_0;
					else 
						new_state <= read2_memory_player_1;
					end if;
				else
					new_state <= write_memory_player_1;
				end if;
		
			when read2_memory_player_0 =>
				-- read the data from the address of the next position of player 0
				state_vga   				<= "111";
				address_fsm 				<= next_position_0(9 downto 0);
				read_enable_fsm				<= '1';

				-- wait till the memory module is done with processing the information to go to the next state:
				if (mem_com_ready = '1') then
					-- first check which layer player 0 is on, then check if there is already data on that layer at that address
					-- when there is already data on the next position of player 0, player 0 collides against wall
					if (next_layer_0 = '0') then
						if (read_data_fsm (3 downto 0) /= "0000") then
							e_player_0_state <= '1';
						end if;
					elsif (next_layer_0 = '1') then
						if (read_data_fsm (7 downto 4) /= "0000") then
							e_player_0_state <= '1';
						end if;
					end if;
					if (booster_1 = '1') then
						new_state <= read2_memory_player_1; 
					else
						new_state <= check_how_collision;
					end if;
				else 
					new_state <= read2_memory_player_0;
				end if;
	

			when read2_memory_player_1 =>
				-- read the data from the address of the next position of player 1
				state_vga   				<= "111";
				address_fsm					<= next_position_1(9 downto 0);
				read_enable_fsm				<= '1';

				-- wait till the memory module is done with processing the information to go to the next state
				if (mem_com_ready = '1') then
					-- first check which layer player 1 is on, then check if there is already data on that layer at that address
					-- when there is already data on the next position of player 1, player 1 collides against wall					
					if (next_layer_1 = '0') then
						if (read_data_fsm (3 downto 0) /= "0000") then
							e_player_1_state <= '1';
						end if;
					elsif (next_layer_1 = '1') then
						if (read_data_fsm (7 downto 4) /= "0000") then
							e_player_1_state <= '1';
						end if;
					end if;					
					new_state <= check_how_collision; 
				else 
					new_state <= read2_memory_player_1;
				end if;
			
			when check_how_collision =>
				state_vga   				<= "111";
				if (border_0 = '1') then --player crashed against border
					e_player_0_state <= '1'; 
					d_player_0_state <= "01";
				elsif (collision_head = '1') then --players crash against eachother at the border of a cell
					e_player_0_state <= '1'; 
					d_player_0_state <= "01";
				elsif (collision_middle = '1') then --players crash against eachother in the middle of a cell
					e_player_0_state <= '1';
				end if;

				if (border_1 = '1') then --player crashed against border
					e_player_1_state <= '1'; 
					d_player_1_state <= "01";
				elsif (collision_head = '1') then --players crash against eachother at the border of a cell
					e_player_1_state <= '1'; 
					d_player_1_state <= "01";
				elsif  (collision_middle = '1') then --players crash against eachother in the middle of a cell
					e_player_1_state <= '1';
				end if;

			new_state <= change_data;
					 

			when change_data =>
				-- change the data that is going to the graphics engine and update data in the register
				state_vga   				<= "111";
				e_direction_0 <= '1';
				e_direction_1 <= '1';
				d_direction_0 <= next_direction_0;
				d_direction_1 <= next_direction_1;
				
				-- if player 0 collides on the border of cell do not change its position, otherwise if booster_0 = '1' do
				if ((player_0_state /= "01") and (booster_0 = '1')) then
					e_position_0 <= '1';
					d_position_0 <= next_position_0;
					e_layer_0	 <= '1';
					d_layer_0	 <= next_layer_0;
				end if;
					
				-- if player 0 collides on the border of cell do not change its position, otherwise booster_1 = '1' do
				if ((player_1_state /= "01") and (booster_1 = '1')) then
					e_position_1 <= '1';
					d_position_1 <= next_position_1;
					e_layer_1	 <= '1';
					d_layer_1	 <= next_layer_1;
				end if; 
				
				-- check_who_won is the next state
				new_state <= check_who_won;		
				
			when check_who_won =>
				-- check who won based on the player states
				state_vga   				<= "111";
				
				-- if both players are still playing, go back to the 'wait_state'
				if ((player_0_state = "11") and (player_1_state = "11")) then
					new_state <= wait_state;
				-- if only player 0 is still playing, player 0 won
				elsif (player_0_state = "11") then			
					new_state <= player_0_won;
				-- if only player 1 is still playing, player 1 won
				elsif (player_1_state = "11") then
					new_state <= player_1_won;
				-- when both players collided, nobody won and it is a tie
				else 
					new_state <= tie;
				end if;		

			when player_0_won =>
				-- player 0 won and tell that to the graphics engine
				state_vga 					<= "010";
				if (select_button = '1') then 
					new_state <= reset_state;
				else
					new_state <= player_0_won;
				end if;
	
			when player_1_won =>
				-- player 1 won and tell that to the graphics engine
				state_vga 					<= "011";
				if (select_button = '1') then 
					new_state <= reset_state;
				else
					new_state <= player_1_won;
				end if;
				
				
			when tie =>
				-- both players lost and tell that to the graphics engine
				state_vga 					<= "001";
				if (select_button = '1') then 
					new_state <= reset_state;
				else
					new_state <= tie;
				end if;
		end case;
	end process;
end behaviour;