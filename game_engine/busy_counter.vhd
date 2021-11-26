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