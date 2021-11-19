library IEEE;
use IEEE.std_logic_1164.ALL;

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
        position_mem   : out std_logic_vector(1 downto 0);
        direction_vga  : out std_logic_vector(3 downto 0);
        player_state   : out std_logic_vector(3 downto 0);
	go_to	       : out std_logic);
end game_engine;

library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of game_engine is
	type game_state is (reset_state, loading_state, get_ready, wall_shape, check_border, next_position, read_memory_player_0, read_memory_player_1, check_collision, wait_state, write_memory_player_0, write_memory_player_1, change_data, player_0_won, player_1_won, tie, hold_state);
	signal state, new_state: game_state;
	signal direction_0, direction_1, next_direction_0, next_direction_1 : std_logic_vector(1 downto 0);
	signal position_0, position_1, next_position_0, next_position_1 : std_logic_vector (10 downto 0);
	signal wallshape_0, wallshape_1 : std_logic_vector (2 downto 0);
	signal read_memory_0, read_memory_1 : std_logic_vector (7 downto 0);
begin

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
				state_vga 				<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 				<= "0000000000";
				position_vga 				<= "0111110010001111111011";
				position_mem				<= "00";
				direction_vga				<= "0000";
				player_state				<= "1010";
				go_to				<= '0';
			
				new_state <= loading_state;

			when player_0_won =>
				state_vga 				<= "010";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 				<= "0000000000";
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state	(1 downto 0)			<= "11";
				-- player_state (3 downto 2)				<= 
				go_to				<= '0';
				
				new_state <= reset_state;

			when player_1_won =>
				state_vga 				<= "011";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 				<= "0000000000";
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				-- player_state (1 downto 0)				<= 
				player_state	(3 downto 2)			<= "11";
				go_to				<= '0';
				
				new_state <= reset_state;	
				
			when tie =>
				state_vga 				<= "001";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 				<= "0000000000";
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				-- player_state				<= 
				go_to				<= '0';
				
				new_state <= reset_state;	

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
				else new_state <= player_1_won;
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
				else new_state <= player_0_won;
				end if;

				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to		   		<= '0';
				
				new_state <= check_border;

			when read_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 				<= position_0(9 downto 0);
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to		   		<= '1';
				
				if (memory_ready = '1') then  --there can be read from memory
					read_memory_0 <= read_memory;
					new_state <= read_memory_player_1; 
				else new_state <= read_memory_player_0; --wait for memory
				end if;

			when read_memory_player_1 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 				<= position_1(9 downto 0);
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to		   		<= '1';
				
				if (memory_ready = '1') then  --there can be read from memory
					read_memory_1 <= read_memory;
					new_state <= check_collision; 
				else new_state <= read_memory_player_1; --wait for memory
				end if;

			when check_collision =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to		   		<= '0';
				
				if (read_memory_0 = "00000000") and (read_memory_1 = "00000000") then 
					new_state <= wait_state; 
				elsif (next_position_0 = next_position_1) then
					new_state <= tie;
				elsif (position_0 = next_position_1) and (position_1 = next_position_0) then
					new_state <= tie;
				elsif (position_0 = next_position_1) then
					new_state <= player_0_won;
				elsif (position_1 = next_position_0) then
					new_state <= player_1_won;
				elsif (read_memory_0 = "00000000") nand (read_memory_1 = "00000000") then
					new_state <= tie;
				elsif (read_memory_0 = "00000000") then
					new_state <= player_0_won;
				else new_state<= player_1_won;
				end if;

			when write_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 				<= "00000";
				write_memory(2 downto 0) 				<= wallshape_0;
				address 				<= position_0(9 downto 0);
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to 				<= '1';
				
				if (memory_ready = '1') then
					new_state <= write_memory_player_1;
				else
					new_state <= write_memory_player_0;
				end if;

			when write_memory_player_1 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 				<= "00001" ;
				write_memory(2 downto 0) 				<= wallshape_1;
				address 				<= position_1(9 downto 0);
				position_vga(10 downto 0) 				<= position_0;
				position_vga(21 downto 11) 				<= position_1;
				position_mem   				<= "00";
				direction_vga (1 downto 0)				<= direction_0;
				direction_vga (3 downto 2)				<= direction_1;
				player_state   				<= "1111";
				go_to 				<= '1';
		
				if (memory_ready = '1') then
					new_state <= write_memory_player_1;
				else
					new_state <= change_data;
				end if;
				
		
				
		end case;
	end process;
end behaviour;
