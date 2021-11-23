library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity game_engine is
   port(clk            : in  std_logic;
        reset          : in  std_logic;
        input          : in  std_logic_vector(3 downto 0);
        busy           : in  std_logic;
        read_memory    : in  std_logic_vector(7 downto 0);
        memory_ready   : in  std_logic;
        state_vga      : out std_logic_vector(2 downto 0);
        write_enable   : out std_logic;
        write_memory   : out std_logic_vector(7 downto 0);
        address        : out std_logic_vector(9 downto 0);
        position_vga   : out std_logic_vector(21 downto 0);
        direction_vga  : out std_logic_vector(3 downto 0);
        player_state   : out std_logic_vector(3 downto 0);
		go_to	       : out std_logic);
end game_engine;

library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of game_engine is
	type game_state is (reset_state, loading_state, get_ready, read_inputs, wall_shape, check_border, next_position, want_to_read_0, want_to_read_1, read_memory_player_0, read_memory_player_1, check_collision, check_who_won, wait_state, want_to_write_0, want_to_write_1, write_memory_player_0, write_memory_player_1, change_data, player_0_won, player_1_won, tie, hold_state);

	signal state, new_state: game_state;
	signal direction_0, direction_1, next_direction_0, next_direction_1 : std_logic_vector(1 downto 0);
	signal position_0, position_1, next_position_0, next_position_1 : std_logic_vector (10 downto 0);
	signal d_position_0, d_position_1, d_next_position_0, d_next_position_1 : std_logic_vector (10 downto 0);
	signal wallshape_0, wallshape_1 : std_logic_vector (2 downto 0);
	signal read_memory_0, read_memory_1 : std_logic_vector (7 downto 0);
	signal player_0_state, player_1_state: std_logic_vector (1 downto 0);
	signal busy_counter_reset: std_logic;
	signal unsigned_busy_count: unsigned (4 downto 0):= (others => '0');
	
	component busy_counter is
	port(clk               : in  std_logic;
		 global_reset 	   : in  std_logic;
		 game_engine_reset : in  std_logic;
         busy              : in  std_logic;
         busy_count        : out unsigned(4 downto 0));
	end component;
	
	signal e_position_0, e_position_1, e_wallshape_0, e_wallshape_1, e_read_mem_0, e_read_mem_1, e_next_pos_0, e_next_pos_1, e_direction_0, e_direction_1, e_next_dir_0, e_next_dir_1, e_p_state_0, e_p_state_1: std_logic;
	
	component ge_register is
		port(clk, reset	  : in  std_logic;	
			e_position_0  : in  std_logic;
			e_position_1  : in  std_logic;
			d_position_0  : in  std_logic_vector(10 downto 0);
			d_position_1  : in  std_logic_vector(10 downto 0);
			e_wallshape_0 : in  std_logic;
			e_wallshape_1 : in  std_logic;
			d_wallshape_0 : in  std_logic_vector(2 downto 0);
			d_wallshape_1 : in  std_logic_vector(2 downto 0);
			e_read_mem_0  : in  std_logic;
			e_read_mem_1  : in  std_logic;
			d_read_mem_0  : in  std_logic_vector(7 downto 0);
			d_read_mem_1  : in  std_logic_vector(7 downto 0);
			e_next_pos_0  : in  std_logic;
			e_next_pos_1  : in  std_logic;
			d_next_pos_0  : in  std_logic_vector(10 downto 0);
			d_next_pos_1  : in  std_logic_vector(10 downto 0);
			e_direction_0 : in  std_logic;
			e_direction_1 : in  std_logic;
			d_direction_0 : in  std_logic_vector(1 downto 0);
			d_direction_1 : in  std_logic_vector(1 downto 0);
			e_next_dir_0  : in  std_logic;
			e_next_dir_1  : in  std_logic;
			d_next_dir_0  : in  std_logic_vector(1 downto 0);
			d_next_dir_1  : in  std_logic_vector(1 downto 0);
			e_p_state_0   : in  std_logic;
			e_p_state_1   : in  std_logic;
			d_p_state_0   : in  std_logic_vector(1 downto 0);
			d_p_state_1   : in  std_logic_vector(1 downto 0);
			q_position_0  : out std_logic_vector(10 downto 0);
			q_position_1  : out std_logic_vector(10 downto 0);
			q_wallshape_0 : out std_logic_vector(2 downto 0);
			q_wallshape_1 : out std_logic_vector(2 downto 0);
			q_read_mem_0  : out std_logic_vector(7 downto 0);
			q_read_mem_1  : out std_logic_vector(7 downto 0);
			q_next_pos_0  : out std_logic_vector(10 downto 0);
			q_next_pos_1  : out std_logic_vector(10 downto 0);
			q_direction_0 : out std_logic_vector(1 downto 0);
			q_direction_1 : out std_logic_vector(1 downto 0);
			q_next_dir_0  : out std_logic_vector(1 downto 0);
			q_next_dir_1  : out std_logic_vector(1 downto 0);
			q_p_state_0   : out std_logic_vector(1 downto 0);
			q_p_state_1   : out std_logic_vector(1 downto 0));
	end component;

begin

counter: busy_counter 
			port map (clk => clk,
						global_reset => reset,
						game_engine_reset => busy_counter_reset,
						busy => busy,
						busy_count => unsigned_busy_count);

updates: 	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= reset_state;
				
				position_0 <= "00000000000";
				position_1 <= "00000000000";
				
				direction_0 <= "00";
				direction_1 <= "00";
			else
				state <= new_state;
				
				position_0 <= next_position_0;
				position_1 <= next_position_1;
				
				direction_0 <= next_direction_0;
				direction_1 <= next_direction_1;
			end if;
		end if;
	end process;

create_next_state: 	process (state)
	begin
		case state is
			when reset_state =>
				state_vga 					<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga 				<= "0111110010001111111011";
				direction_vga				<= "0000";
				player_state				<= "1010";
				go_to						<= '0';
			
				new_state <= loading_state;

			when player_0_won =>
				state_vga 					<= "010";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= "11";
				player_state (3 downto 2)	<= player_1_state;
				go_to						<= '0';
				
				new_state <= reset_state;

			when player_1_won =>
				state_vga 					<= "011";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= "11";
				go_to						<= '0';
				
				new_state <= reset_state;	
				
			when tie =>
				state_vga 					<= "001";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state(1 downto 0)	<= player_0_state;
				player_state(3 downto 2)	<= player_1_state;
				go_to						<= '0';
				
				new_state <= reset_state;	
				
			when wait_state =>
				state_vga 					<= "111";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state				<= "1111";
				go_to						<= '0';
			
				if (unsigned_busy_count >= 16) then
					busy_counter_reset <= '1';
					new_state <= read_inputs;
				else
					new_state <= wait_state;
					busy_counter_reset <= '0';
				end if;
				
			when read_inputs =>
				state_vga 					<= "111";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state				<= "1111";
				go_to						<= '0';

			when wall_shape => 
				if ((direction_0= "01") and (input (1 downto 0) ="01")) or  ((direction_0= "11") and (input (1 downto 0) ="11")) then 
					wallshape_0 <= "001"; -- previous: left, next: left -- previous: right, next: right 
				elsif ((direction_0= "00") and (input (1 downto 0) ="00")) or  ((direction_0= "10") and (input (1 downto 0) ="10")) then 
					wallshape_0 <= "010"; -- previous: up, next: up -- previous: down, next: down
				elsif ((direction_0= "00") and (input (1 downto 0) ="11")) or  ((direction_0= "01") and (input (1 downto 0) ="10")) then 
					wallshape_0 <= "110"; -- previous: up, next: right -- previous: left, next: down
				elsif ((direction_0= "00") and (input (1 downto 0) ="01")) or  ((direction_0= "11") and (input (1 downto 0) ="10")) then 
					wallshape_0 <= "101"; -- previous: up, next: left -- previous: right, next: down
				elsif ((direction_0= "11") and (input (1 downto 0) ="00")) or  ((direction_0= "10") and (input (1 downto 0) ="01")) then 
					wallshape_0 <= "100"; -- previous: right, next: up -- previous: down, next: left
				elsif ((direction_0= "10") and (input (1 downto 0) ="11")) or  ((direction_0= "01") and (input (1 downto 0) ="00")) then 
					wallshape_0 <= "111"; -- previous: down, next: right -- previous: left, next: up
				else player_0_state <= "00";
				end if;

				if ((direction_1= "01") and (input (3 downto 2) ="01")) or  ((direction_1= "11") and (input (3 downto 2) ="11")) then 
					wallshape_1 <= "001"; -- previous: left, next: left -- previous: right, next: right 
				elsif ((direction_1= "00") and (input (3 downto 2) ="00")) or  ((direction_1= "10") and (input (3 downto 2) ="10")) then 
					wallshape_1 <= "010"; -- previous: up, next: up -- previous: down, next: down
				elsif ((direction_1= "00") and (input (3 downto 2) ="11")) or  ((direction_1= "01") and (input (3 downto 2) ="10")) then 
					wallshape_1 <= "110"; -- previous: up, next: right -- previous: left, next: down
				elsif ((direction_1= "00") and (input (3 downto 2) ="01")) or  ((direction_1= "11") and (input (3 downto 2) ="10")) then 
					wallshape_1 <= "101"; -- previous: up, next: left -- previous: right, next: down
				elsif ((direction_1= "11") and (input (3 downto 2) ="00")) or  ((direction_1= "10") and (input (3 downto 2) ="01")) then 
					wallshape_1 <= "100"; -- previous: right, next: up -- previous: down, next: left
				elsif ((direction_1= "10") and (input (3 downto 2) ="11")) or  ((direction_1= "01") and (input (3 downto 2) ="00")) then 
					wallshape_1 <= "111"; -- previous: down, next: right -- previous: left, next: up
				else player_1_state <= "00";
				end if;
	
				if (direction_0 = "01") then 		-- moves to the left, x is decreased with 1
					next_position_0(4 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) - 1, 5));
				elsif (direction_0 = "11") then 	-- moves to the right, x is increased with 1
					next_position_0(4 downto 0) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) + 1, 5));
				elsif (direction_1 <= "00") then 	-- moves up, y is decreased with 1
					next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) - 1, 5));
				else 					--moves down, y is increased with 1
					next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) + 1, 5));
				end if;
				

				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state   				<= "1111";
				go_to		   				<= '0';
				
				new_state <= check_border;
				
			when check_border =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state   				<= "1111";
				go_to		   				<= '0';
			
				if ((next_position_0(4 downto 0) = "00000") or (next_position_0(4 downto 0) = "11111")) or ((next_position_0(9 downto 5) = "00000") or (next_position_0(9 downto 5) = "11111"))then 
					player_0_state <= "01";
				--else 
					--register
				end if;

				if ((next_position_1(4 downto 0) = "00000") or (next_position_1(4 downto 0) = "11111")) or ((next_position_1(9 downto 5) = "00000") or (next_position_1(9 downto 5) = "11111"))then 
					player_1_state <= "01";
				--else
					--register
				end if;

				new_state <= read_memory_player_0;

			when want_to_read_0 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= position_0(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '1';	

				new_state <= read_memory_player_0;	

			when read_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= position_0(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '0';
				
				read_memory_0 <= read_memory;
				
				if (memory_ready = '1') then
					if (not read_memory = "00000000") then
						player_0_state <= "00";
					end if;

					new_state <= want_to_read_1; 
				else new_state <= read_memory_player_0;
				end if;

			when want_to_read_1 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= position_1(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '1';

				new_state <= read_memory_player_1;

			when read_memory_player_1 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= position_1(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '0';

				read_memory_1 <= read_memory;
				
				if (memory_ready = '1') then
					if (not read_memory = "00000000") then
						player_1_state <= "00";
					end if;

					new_state <= check_collision; 
				else new_state <= read_memory_player_1;
				end if;

			when check_collision =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '0';
				
				if (next_position_0 = next_position_1) then
					player_0_state <= "00"; --collide at eachother at middle of square
					player_1_state <= "00";
				elsif (position_0 = next_position_1) and (position_1 = next_position_0) then
					player_0_state <= "01"; --collide at eachother at border
					player_1_state <= "01";
				elsif (position_0 = next_position_1) then
					player_1_state <= "00"; --collide at wall other player
				elsif (position_1 = next_position_0) then
					player_0_state <= "00"; --collide at wall other player
				else --iets met register
				end if;
				new_state<= check_who_won;

			when check_who_won =>
<<<<<<< HEAD
=======
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0) 	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to		   				<= '0';
				
>>>>>>> 02eab5dbe4f2d5837c0e42e592a57c52f512a22f
				if ((player_0_state = "11") and (player_1_state = "11")) then
					new_state <= want_to_write_0;
				elsif (player_0_state = "11") then 
					new_state <= player_0_won;
				elsif (player_1_state = "11") then
					new_state <= player_1_won;
				else new_state <= tie;
				end if;
		
			when want_to_write_0 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00000";
				write_memory(2 downto 0) 	<= wallshape_0;
				address 					<= position_0(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to 						<= '1';

				new_state <= write_memory_player_0;

			when write_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00000";
				write_memory(2 downto 0) 	<= wallshape_0;
				address 					<= position_0(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to 						<= '0';
				
				if (memory_ready = '1') then
					new_state <= want_to_write_1;
				else new_state <= write_memory_player_0;
				end if;

			when want_to_write_1 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00001" ;
				write_memory(2 downto 0) 	<= wallshape_1;
				address 					<= position_1(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to 						<= '1';

				new_state <= write_memory_player_1;

			when write_memory_player_1 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00001" ;
				write_memory(2 downto 0) 	<= wallshape_1;
				address 					<= position_1(9 downto 0);
				position_vga(10 downto 0) 	<= position_0;
				position_vga(21 downto 11) 	<= position_1;
				direction_vga (1 downto 0)	<= direction_0;
				direction_vga (3 downto 2)	<= direction_1;
				player_state (1 downto 0)	<= player_0_state;
				player_state (3 downto 2)	<= player_1_state;
				go_to 						<= '1';
		
				if (memory_ready = '1') then
					new_state <= change_data;
				else
					new_state <= write_memory_player_1;
				end if;
			
			when change_data =>
				e_position_0 <= '1';
				e_position_1 <= '1';
				e_direction_0 <= '1';
				e_direction_1 <= '1';

				
		end case;
	end process;
end behaviour;
