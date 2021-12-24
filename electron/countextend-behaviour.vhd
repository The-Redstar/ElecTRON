library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of countextend is
	type countext_state is (sleep, high_1, high_2, wait_1);
	signal state, new_state: countext_state;
begin
	countext_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if rst = '1' then
				state <= sleep;
			else
				state <= new_state;
			end if;
		end if;
	end process;

<<<<<<< HEAD
	clkext_fsm : process(state, incr_in, busy_in)
=======
	clkext_fsm : process(state, incr_in)
>>>>>>> origin/game_engine
	begin
		case state is
			when sleep =>
				incr_out <= '0';
				if busy_in = '0' and incr_in = '1' then
					new_state <= high_1;
				else
					new_state <= sleep;
				end if;
			when high_1 =>
				incr_out <= '1';
				new_state <= high_2;
			when high_2 =>
				incr_out <= '1';
				new_state <= wait_1;
			when wait_1 =>
				incr_out <= '0';
				if incr_in = '0' then
					new_state <= sleep;
				else
					new_state <= wait_1;
				end if;
		end case;
	end process;
end behaviour;

