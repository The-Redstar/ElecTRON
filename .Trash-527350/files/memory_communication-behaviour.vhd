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
	
creat_new_state:	process (state, new_state, address_fsm, write_enable_fsm, read_enable_fsm, clear_fsm, write_data_fsm, memory_ready, read_data_mem)
begin
	--setting default values (all outputs)
	mem_com_ready	<= '0';
	read_data_fsm	<= "00000000";
	go_to			<= '0';
	clear_mem		<= '0';
	write_enable_mem<= '0';
	write_data_mem	<= "00000000";
	address_mem		<= "0000000000";
	
	case state is
		when reset_state =>
			--go to the correct cycle
			if (write_enable_fsm = '1') then
				new_state <= want_to_write;
			elsif (read_enable_fsm = '1') then
				new_state <= want_to_read;
			elsif (clear_fsm = '1') then
				new_state <= want_to_clear;
			else
				new_state <= reset_state;
			end if;
			
		when want_to_write =>
			--go_to is 1 for one clock cycle
			go_to			<= '1';
			write_enable_mem<= '1';
			write_data_mem	<= write_data_fsm;
			address_mem		<= address_fsm;
			new_state 		<= write_wait;
			
		when write_wait =>
			--keep giving the outputs without go_to
			write_enable_mem<= '1';
			write_data_mem	<= write_data_fsm;
			address_mem		<= address_fsm;
			
			--waiting for memory
			if (memory_ready = '1') then
				new_state <= write_finished;
			else
				new_state <= write_wait;
			end if;
			
		when write_finished =>
			--signal the game engine it can continue
			mem_com_ready	<= '1';
		
			new_state <= reset_state;
			
		when want_to_read =>
			--tell the memory controller to start working
			go_to			<= '1';
			address_mem		<= address_fsm;
			new_state		<= read_wait;
			
		when read_wait =>
			address_mem		<= address_fsm;
			read_data_fsm	<= read_data_mem;
			--waiting for memory
			if (memory_ready = '1') then
				new_state <= read_finished;
			else
				new_state <= read_wait;
			end if;
			
		when read_finished =>
			--signal the game engine the sample the outputs
			mem_com_ready	<= '1';
			read_data_fsm	<= read_data_mem;
			new_state <= reset_state;
			
			
		when want_to_clear =>
			--start doing something, memory controller
			clear_mem		<= '1';
			new_state		<= clear_wait;
			
		when clear_wait =>			
			--waiting for memory
			if (memory_ready = '1') then
				new_state <= clear_finished;
			else
				new_state <= clear_wait;
			end if;
			
		when clear_finished =>
			mem_com_ready	<= '1';
			
			--waiting for fsm
			if (clear_fsm = '0') then
				new_state <= reset_state;
			else
				new_state <= clear_finished;
			end if;
	end case;
end process;
end architecture;
