library IEEE;
use IEEE.std_logic_1164.ALL;

entity busy_counter is
   port(clk               : in  std_logic;
        global_reset 			  : in  std_logic;
		game_engine_reset : in  std_logic;
        busy              : in  std_logic;
        busy_count        : out std_logic_vector(4 downto 0));
end busy_counter;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of busy_counter is

--implemeted as a FSM with the count increasing when busy changes from high to low
	type busy_counter_state_type is (reset, busy_low, busy_high, busy_high_to_low);
	signal busy_counter_state, next_busy_counter_state: busy_counter_state_type;
	signal unsigned_busy_count, next_unsigned_busy_count: unsigned (4 downto 0);

begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (global_reset = '1' or game_engine_reset = '1') then
				busy_counter_state <= reset;
				unsigned_busy_count <= (others => '0');
			else
				busy_counter_state <= next_busy_counter_state;
				unsigned_busy_count <= next_unsigned_busy_count;
			end if;
		end if;
	end process;
	
	process (busy, busy_counter_state)
	begin
		case busy_counter_state is
		
			when reset =>
				next_busy_counter_state <= busy_low;
				next_unsigned_busy_count <= (others => '0');
				
			when busy_low =>
				next_unsigned_busy_count <= unsigned_busy_count;
				if (busy = '1') then
					next_busy_counter_state <= busy_high;
				else
					next_busy_counter_state <= busy_low;
				end if;
				
			when busy_high =>
				next_unsigned_busy_count <= unsigned_busy_count;
				if (busy = '0') then 
					next_busy_counter_state <= busy_high_to_low;
				else
					next_busy_counter_state <= busy_high;
				end if;
				
			when busy_high_to_low =>
				next_unsigned_busy_count <= unsigned_busy_count + 1;
				next_busy_counter_state <= busy_low;
		end case;
	end process;
	busy_count <= std_logic_vector(unsigned_busy_count);

end behaviour;

library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity game_engine is
   port(clk                : in  std_logic;
        reset              : in  std_logic;
        input              : in  std_logic_vector(3 downto 0);
        busy               : in  std_logic;
        read_memory        : in  std_logic_vector(7 downto 0);
        memory_ready       : in  std_logic;
        state_vga          : out std_logic_vector(2 downto 0);
        write_enable       : out std_logic;
        write_memory       : out std_logic_vector(7 downto 0);
        address            : out std_logic_vector(9 downto 0);
        position_0_vga     : out std_logic_vector(10 downto 0);
        position_1_vga     : out std_logic_vector(10 downto 0);
        direction_0_vga    : out std_logic_vector(1 downto 0);
        direction_1_vga    : out std_logic_vector(1 downto 0);
        player_state_0_vga : out std_logic_vector(1 downto 0);
        player_state_1_vga : out std_logic_vector(1 downto 0);
		go_to	           : out std_logic;
		clear_memory       : out std_logic);
end game_engine;

library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of game_engine is
	type game_state is (reset_state, want_to_load, loading_state, get_ready, read_inputs, wall_shape, check_border, want_to_read_0, want_to_read_1, read_memory_player_0, read_memory_player_1, check_collision, check_who_won, wait_state, want_to_write_0, want_to_write_1, write_memory_player_0, write_memory_player_1, change_data, player_0_won, player_1_won, tie);

	signal state, new_state: game_state;
	signal direction_0, direction_1, next_direction_0, next_direction_1 : std_logic_vector(1 downto 0);
	signal d_direction_0, d_direction_1, d_next_direction_0, d_next_direction_1 : std_logic_vector(1 downto 0);
	signal position_0, position_1, next_position_0, next_position_1 : std_logic_vector (10 downto 0);
	signal d_position_0, d_position_1, d_next_position_0, d_next_position_1 : std_logic_vector (10 downto 0);
	signal wallshape_0, wallshape_1 : std_logic_vector (2 downto 0);
	signal d_wallshape_0, d_wallshape_1 : std_logic_vector (2 downto 0);
	signal read_memory_0, read_memory_1 : std_logic_vector (7 downto 0);
	signal d_read_memory_0, d_read_memory_1 : std_logic_vector (7 downto 0);
	signal player_0_state, player_1_state: std_logic_vector (1 downto 0);
	signal d_player_0_state, d_player_1_state: std_logic_vector (1 downto 0);
	signal e_position_0, e_position_1, e_wallshape_0, e_wallshape_1, e_read_memory_0, e_read_memory_1, e_next_position_0, e_next_position_1, e_direction_0, e_direction_1, e_next_direction_0, e_next_direction_1, e_player_0_state, e_player_1_state: std_logic;
	signal busy_counter_reset: std_logic;
	signal unsigned_busy_count: std_logic_vector(4 downto 0);
	
	component busy_counter is
	port(clk               : in  std_logic;
		 global_reset 	   : in  std_logic;
		 game_engine_reset : in  std_logic;
         busy              : in  std_logic;
         busy_count        : out std_logic_vector(4 downto 0));
	end component;	


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

reg: ge_register port map (clk => clk,
			reset         => reset,	
			e_position_0  => e_position_0,
			e_position_1  => e_position_1,
			d_position_0  => d_position_0,
			d_position_1  => d_position_1,
			e_wallshape_0 => e_wallshape_0,
			e_wallshape_1 => e_wallshape_1,
			d_wallshape_0 => d_wallshape_0,
			d_wallshape_1 => d_wallshape_1,
			e_read_mem_0  => e_read_memory_0,
			e_read_mem_1  => e_read_memory_1,
			d_read_mem_0  => d_read_memory_0,
			d_read_mem_1  => d_read_memory_1,
			e_next_pos_0  => e_next_position_0,
			e_next_pos_1  => e_next_position_1,
			d_next_pos_0  => d_next_position_0,
			d_next_pos_1  => d_next_position_1,
			e_direction_0 => e_direction_0,
			e_direction_1 => e_direction_1,
			d_direction_0 => d_direction_0,
			d_direction_1 => d_direction_1,
			e_next_dir_0  => e_next_direction_0,
			e_next_dir_1  => e_next_direction_1,
			d_next_dir_0  => d_next_direction_0,
			d_next_dir_1  => d_next_direction_1,
			e_p_state_0   => e_player_0_state,
			e_p_state_1   => e_player_1_state,
			d_p_state_0   => d_player_0_state,
			d_p_state_1   => d_player_1_state,
			q_position_0  => position_0,
			q_position_1  => position_1,
			q_wallshape_0 => wallshape_0,
			q_wallshape_1 => wallshape_1,
			q_read_mem_0  => read_memory_0,
			q_read_mem_1  => read_memory_1,
			q_next_pos_0  => next_position_0,
			q_next_pos_1  => next_position_1,
			q_direction_0 => direction_0,
			q_direction_1 => direction_1,
			q_next_dir_0  => next_direction_0,
			q_next_dir_1  => next_direction_1,
			q_p_state_0   => player_0_state,
			q_p_state_1   => player_1_state);
			
counter: busy_counter 
			port map (clk => clk,
						global_reset => reset,
						game_engine_reset => busy_counter_reset,
						busy => busy,
						busy_count => unsigned_busy_count);
				
-- outputs from the register to the vga				
position_0_vga  <= position_0;
position_1_vga  <= position_1;
direction_0_vga <= direction_0;
direction_1_vga <= direction_1;
player_state_0_vga <= player_0_state;
player_state_1_vga <= player_1_state;



updates: 	process (clk)
	begin
		if (clk'event and clk = '1') then
			if (reset = '1') then
				state <= reset_state;
			else
				state <= new_state;
			end if;
		end if;
	end process;

create_next_state: 	process (state, reset, input, busy, read_memory, memory_ready, clk, unsigned_busy_count)
	begin
		case state is
			when reset_state =>
				state_vga 					<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";			  
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
			
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
			
				new_state <= want_to_load;
			
			when want_to_load =>
				state_vga 					<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				busy_counter_reset			<= '0';
				go_to						<= '0';
				
				clear_memory				<= '1';
				
				e_position_0				<= '1';
				e_position_1				<= '1';
				e_direction_0				<= '1';
				e_direction_1				<= '1';
				e_player_0_state			<= '1';
				e_player_1_state			<= '1';
				
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				
				d_position_0				<= "01110111001";
				d_position_1				<= "01110100100";
				d_direction_0				<= "00";
				d_direction_1				<= "00";
				
				d_player_0_state			<= "10";
				d_player_1_state			<= "10";
				
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				
				new_state <= loading_state;
			
			when loading_state =>
				state_vga 					<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				busy_counter_reset			<= '0';
				go_to						<= '0';
				
				clear_memory				<= '1';
				
				e_position_0				<= '0';
				e_position_1				<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';

				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				
				
				if (memory_ready = '1') then 
					new_state <= get_ready;
				else 
					new_state <= loading_state;
				end if;
				
			when get_ready =>
				state_vga 					<= "000";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				go_to						<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
			
				
				if ((input(3 downto 2) = direction_1) and (input(1 downto 0) = direction_0)) then
					-- normally it should go to the wait state however for testing reasons we skip that state for now since we know it works
					-- new_state <= wait_state;
					new_state <= read_inputs;
					e_player_0_state			<= '1';
					e_player_1_state			<= '1';
					d_player_0_state			<= "11";
					d_player_1_state			<= "11";
				else 
					new_state <= get_ready;
					e_player_0_state			<= '0';
					e_player_1_state			<= '0';
					d_player_0_state			<= (others => '0');
					d_player_1_state			<= (others => '0');
				end if;
				

			when player_0_won =>
				state_vga 					<= "010";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				if (reset = '1') then
					new_state <= reset_state;
				else 
					new_state <= player_0_won;
				end if;

			when player_1_won =>
				state_vga 					<= "011";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				if (reset = '1') then
					new_state <= reset_state;
				else 
					new_state <= player_1_won;
				end if;	
				
			when tie =>
				state_vga 					<= "001";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				if (reset = '1') then
					new_state <= reset_state;
				else 
					new_state <= tie;
				end if;
				
			when wait_state =>
				state_vga 					<= "111";
				write_enable 				<= '0';
				write_memory 				<= "00000000";
				address 					<= "0000000000";
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
			
				if (unsigned( unsigned_busy_count) >= 16) then
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
				go_to						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_next_direction_0			<= '1';	
				e_next_direction_1			<= '1';
				d_next_direction_0			<= input(1 downto 0);
				d_next_direction_1			<= input(3 downto 2);										
	
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				new_state <= wall_shape;

			when wall_shape => 
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				
				if ((direction_0= "01") and (next_direction_0  ="01")) or  ((direction_0= "11") and (next_direction_0  ="11")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "001"; -- previous: left, next: left -- previous: right, next: right 
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				elsif ((direction_0= "00") and (next_direction_0  ="00")) or  ((direction_0= "10") and (next_direction_0  ="10")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "010"; -- previous: up, next: up -- previous: down, next: down
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				elsif ((direction_0= "00") and (next_direction_0  ="11")) or  ((direction_0= "01") and (next_direction_0  ="10")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "110"; -- previous: up, next: right -- previous: left, next: down
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				elsif ((direction_0= "00") and (next_direction_0  ="01")) or  ((direction_0= "11") and (next_direction_0  ="10")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "101"; -- previous: up, next: left -- previous: right, next: down
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				elsif ((direction_0= "11") and (next_direction_0  ="00")) or  ((direction_0= "10") and (next_direction_0  ="01")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "100"; -- previous: right, next: up -- previous: down, next: left
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				elsif ((direction_0= "10") and (next_direction_0 ="11")) or  ((direction_0= "01") and (next_direction_0  ="00")) then 
					e_wallshape_0 <= '1';	
					d_wallshape_0 <= "111"; -- previous: down, next: right -- previous: left, next: up
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				else
					e_wallshape_0 <= '0';
					d_wallshape_0 <= (others => '0');
					e_player_0_state <= '1';
					d_player_0_state <= "00";
				end if;
				-- player states moeten ook in de elsifs aangegeven worden!!!!!!

				if ((direction_1= "01") and (next_direction_1 ="01")) or  ((direction_1= "11") and (next_direction_1 ="11")) then 	
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "001"; -- previous: left, next: left -- previous: right, next: right 
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				elsif ((direction_1= "00") and (next_direction_1 ="00")) or  ((direction_1= "10") and (next_direction_1 ="10")) then 
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "010"; -- previous: up, next: up -- previous: down, next: down
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				elsif ((direction_1= "00") and (next_direction_1 ="11")) or  ((direction_1= "01") and (next_direction_1 ="10")) then 
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "110"; -- previous: up, next: right -- previous: left, next: down
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				elsif ((direction_1= "00") and (next_direction_1 ="01")) or  ((direction_1= "11") and (next_direction_1 ="10")) then 
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "101"; -- previous: up, next: left -- previous: right, next: down
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				elsif ((direction_1= "11") and (next_direction_1 ="00")) or  ((direction_1= "10") and (next_direction_1 ="01")) then 
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "100"; -- previous: right, next: up -- previous: down, next: left
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				elsif ((direction_1= "10") and (next_direction_1 ="11")) or  ((direction_1= "01") and (next_direction_1 ="00")) then 
					e_wallshape_1 <= '1';
					d_wallshape_1 <= "111"; -- previous: down, next: right -- previous: left, next: up
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				else 
					e_player_1_state <= '1';
					d_player_1_state <= "00";	
					e_wallshape_1 <= '0';
					d_wallshape_1 <= (others => '0');
				end if;
	
				e_next_position_0 <= '1';
				if (next_direction_0 = "01") then 		-- moves to the left, x is decreased with 1
					d_next_position_0(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) - 1, 5));
					d_next_position_0(9 downto 5) <= position_0(9 downto 5);
					d_next_position_0(10)		  <= position_0(10);
				elsif (next_direction_0 = "11") then 	-- moves to the right, x is increased with 1
					d_next_position_0(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(4 downto 0))) + 1, 5));
					d_next_position_0(9 downto 5) <= position_0(9 downto 5);
					d_next_position_0(10)		  <= position_0(10);
				elsif (next_direction_0 <= "00") then 	-- moves up, y is decreased with 1
					d_next_position_0(4 downto 0) <= position_0(4 downto 0);
					d_next_position_0(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(9 downto 5))) - 1, 5));
					d_next_position_0(10)		  <= position_0(10);
				else 					--moves down, y is increased with 1
					d_next_position_0(4 downto 0) <= position_0(4 downto 0);
					d_next_position_0(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_0(9 downto 5))) + 1, 5));
					d_next_position_0(10)		  <= position_0(10)	;	
				end if;

				e_next_position_1 <= '1';
				if (next_direction_1 = "01") then 		-- moves to the left, x is decreased with 1
					d_next_position_1(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(4 downto 0))) - 1, 5));
					d_next_position_1(9 downto 5) <= position_1(9 downto 5);
					d_next_position_1(10)		  <= position_1(10)	;	
				elsif (next_direction_1 = "11") then 	-- moves to the right, x is increased with 1
					d_next_position_1(4 downto 0)  <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(4 downto 0))) + 1, 5));
					d_next_position_1(9 downto 5) <= position_1(9 downto 5);
					d_next_position_1(10)		  <= position_1(10)	;	
				elsif (next_direction_1 <= "00") then 	-- moves up, y is decreased with 1
					d_next_position_1(4 downto 0) <= position_1(4 downto 0);
					d_next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) - 1, 5));
					d_next_position_1(10)		  <= position_1(10)	;	
				else 					--moves down, y is increased with 1
					d_next_position_1(4 downto 0) <= position_1(4 downto 0);
					d_next_position_1(9 downto 5) <= std_logic_vector(to_unsigned(to_integer(unsigned(position_1(9 downto 5))) + 1, 5));	
					d_next_position_1(10)		  <= position_1(10)	;	
				end if;
				
				new_state <= check_border;
				
			when check_border =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
			
				if (((position_0(4 downto 0) = "00000") and (next_direction_0 = "01")) or (next_position_0(4 downto 0) = "11110")) or (((position_0(9 downto 5) = "00000") and (next_direction_0 = "00")) or (next_position_0(9 downto 5) = "11110"))then 
					e_player_0_state <= '1';
					d_player_0_state <= "01";
				else 
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
				end if;

				if (((position_1(4 downto 0) = "00000") and (next_direction_1 = "01")) or (next_position_1(4 downto 0) = "11110")) or (((position_1(9 downto 5) = "00000") and (next_direction_1 = "00")) or (next_position_1(9 downto 5) = "11110"))then 
					e_player_1_state <= '1';
					d_player_1_state <= "01";
				else
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
				end if;

				new_state <= want_to_read_0;

			when want_to_read_0 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address						<= next_position_0 (9 downto 0);
				go_to		   				<= '1';	
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');

				new_state <= read_memory_player_0;	

			when read_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= next_position_0(9 downto 0);
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_1_state			<= (others => '0');

				
				if (memory_ready = '1') then
					if (read_memory = "00000000") then
						--no wall found
						e_player_0_state <= '0';
						d_player_0_state <= (others => '0');
					else 
						--boom
						e_player_0_state <= '1';
						d_player_0_state <= "00";
					end if;
					new_state <= want_to_read_1; 
				else 
					e_player_0_state <= '0';
					d_player_0_state <= (others => '0');
					new_state <= read_memory_player_0;
				end if;

			when want_to_read_1 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= position_1(9 downto 0);
				go_to		   				<= '1';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');

				new_state <= read_memory_player_1;

			when read_memory_player_1 =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address 					<= next_position_1(9 downto 0);
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '1';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');

				
				if (memory_ready = '1') then
					if (read_memory = "00000000") then
						--next cell is empty
						e_player_1_state <= '0';
						d_player_1_state <= (others => '0');
					else 
						--boom
						e_player_1_state <= '1';
						d_player_1_state <= "00";
					end if;
					new_state <= check_collision; 
				else 
					e_player_1_state <= '0';
					d_player_1_state <= (others => '0');
					new_state <= read_memory_player_1;
				end if;

			when check_collision =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				
				if (next_position_0 = next_position_1) then
					e_player_0_state <= '1';
					e_player_1_state <= '1';
					d_player_0_state <= "00"; --collide at eachother at middle of square
					d_player_1_state <= "00";
				elsif (position_0 = next_position_1) and (position_1 = next_position_0) then
					e_player_0_state <= '1';
					e_player_1_state <= '1';
					d_player_0_state <= "01"; --collide at eachother at border
					d_player_1_state <= "01";
				elsif (position_0 = next_position_1) then
					e_player_0_state <= '0';
					e_player_1_state <= '1';
					d_player_0_state <= (others => '0');
					d_player_1_state <= "00"; --collide at wall other player
				elsif (position_1 = next_position_0) then
					e_player_0_state <= '1';
					e_player_1_state <= '0';
					d_player_0_state <= "00"; --collide at wall other player
					d_player_1_state <= (others => '0');
				else 
					e_player_0_state <= '0';
					e_player_1_state <= '0';
					d_player_0_state <= (others => '0');
					d_player_1_state <= (others => '0');
				end if;
				
				new_state<= want_to_write_0;

			when want_to_write_0 =>
				state_vga   				<= "111";
				
				--if collide on border, there shall be no writing
				if (player_0_state = "01") then 
					write_enable 				<= '0';
					write_memory			 	<= "00000000";
					address 					<= "0000000000";
					go_to 						<= '0';
					new_state 					<= want_to_write_1;
				else 
					write_enable 				<= '1';
					write_memory(7 downto 3) 	<= "00000";
					write_memory(2 downto 0) 	<= wallshape_0;
					address 					<= position_0(9 downto 0);
					go_to 						<= '1';
					new_state 					<= write_memory_player_0;
				end if;
				
				busy_counter_reset			<= '0';
				clear_memory				<= '0';

				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				--new_state is in if statement above

			when write_memory_player_0 =>
				state_vga   				<= "111";
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00000";
				write_memory(2 downto 0) 	<= wallshape_0;
				address 					<= position_0(9 downto 0);
				go_to 						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				if (memory_ready = '1') then
					new_state <= want_to_write_1;
				else 
					new_state <= write_memory_player_0;
				end if;

			when want_to_write_1 =>
				state_vga   				<= "111";
				
				--if collide on border, there shall be no writing
				if (player_1_state = "01") then 
					write_enable 				<= '0';
					write_memory			 	<= "00000000";
					address 					<= "0000000000";
					go_to 						<= '0';
					new_state 					<= change_data;
				else 
					write_enable 				<= '1';
					write_memory(7 downto 3) 	<= "00001";
					write_memory(2 downto 0) 	<= wallshape_1;
					address 					<= position_1(9 downto 0);
					go_to 						<= '1';
					new_state 					<= write_memory_player_1;
				end if;
				
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				--new_state is in if statement above

			when write_memory_player_1 =>
				state_vga   				<= "111";
				
				write_enable 				<= '1';
				write_memory(7 downto 3) 	<= "00001" ;
				write_memory(2 downto 0) 	<= wallshape_1;
				address 					<= position_1(9 downto 0);
				go_to 						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
		
				if (memory_ready = '1') then
					new_state <= change_data;
				else
					new_state <= write_memory_player_1;
				end if;
				
		
			when change_data =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory				<= "00000000";
				address 					<= "0000000000";
				go_to 						<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
			
				e_direction_0 <= '1';
				e_direction_1 <= '1';
				d_direction_0 <= next_direction_0;
				d_direction_1 <= next_direction_1;
				
				if (player_0_state <= "01") then
					e_position_0 <= '0';
					d_position_0 <= (others => '0');					
				else
					e_position_0 <= '1';
					d_position_0 <= next_position_0;
				end if;
					
				if (player_1_state <= "01") then
					e_position_1 <= '0';
					d_position_1 <= (others => '0');
				else 
					e_position_1 <= '1';
					d_position_1 <= next_position_1;
				end if; 
				
				new_state <= check_who_won;		
				
			when check_who_won =>
				state_vga   				<= "111";
				write_enable 				<= '0';
				write_memory  				<= "00000000";
				address      				<= "0000000000";
				go_to		   				<= '0';
				busy_counter_reset			<= '0';
				clear_memory				<= '0';
				
				e_position_0				<= '0';
				e_position_1				<= '0';	
				e_wallshape_0				<= '0';	
				e_wallshape_1				<= '0';
				e_read_memory_0				<= '0';
				e_read_memory_1				<= '0';
				e_next_position_0			<= '0';
				e_next_position_1			<= '0';
				e_direction_0				<= '0';
				e_direction_1				<= '0';
				e_next_direction_0			<= '0';	
				e_next_direction_1			<= '0';
				e_player_0_state			<= '0';
				e_player_1_state			<= '0';
				
				d_position_0				<= (others => '0');
				d_position_1				<= (others => '0');	
				d_wallshape_0				<= (others => '0');	
				d_wallshape_1				<= (others => '0');
				d_read_memory_0				<= (others => '0');
				d_read_memory_1				<= (others => '0');
				d_next_position_0			<= (others => '0');
				d_next_position_1			<= (others => '0');
				d_direction_0				<= (others => '0');
				d_direction_1				<= (others => '0');
				d_next_direction_0			<= (others => '0');	
				d_next_direction_1			<= (others => '0');
				d_player_0_state			<= (others => '0');
				d_player_1_state			<= (others => '0');
				
				if ((player_0_state = "11") and (player_1_state = "11")) then
					-- normally it should go to the wait state however for testing reasons we skip that state for now since we know it works
					-- new_state <= wait_state;
					new_state <= read_inputs;
				elsif (player_0_state = "11") then 
					new_state <= player_0_won;
				elsif (player_1_state = "11") then
					new_state <= player_1_won;
				else 
					new_state <= tie;
				end if;
		
				
		end case;
	end process;
end behaviour;
