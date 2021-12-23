library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

architecture behaviour of memory_communication is 
	type mem_com_state is (reset_state, want_to_write, write_wait, write_finished, want_to_read, read_wait, read_finished, want_to_clear, clear_wait, clear_finished);
	
	signal state, new_state: mem_com_state;
	
begin

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
	
