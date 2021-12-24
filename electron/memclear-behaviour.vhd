library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memclear is
	type memclr_state is (sleep, rst_all, fix1, fix2, fix3, wait1, wait2, wait3, wait4, wait5, fixback1, fixback2, incr_x1, incr_x2, incr_xy1, incr_xy2, rstcnt);
	signal state, new_state: memclr_state;
begin
	memclr_process: process(clk)
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
	memclear_fsm : process(state, clear_mem, cur_x, cur_y, busy_in)
=======
	memclear_fsm : process(state, clear_mem, cur_x, cur_y)
>>>>>>> origin/game_engine
	begin
		case state is
			when sleep =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				rst_mem <= '0';
				ready_out <= '1';
				
				if busy_in = '0' and clear_mem = '1' then
					new_state <= rst_all;
				else
					new_state <= sleep;
				end if;

			when rst_all =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				rst_mem <= '1';
				ready_out <= '0';
				
				new_state <= fix1;

			when fix1 =>
				we_mem <= '1';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fix2;

			when fix2 =>
				we_mem <= '0';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fix3;

			when fix3 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait1;

			when wait1 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait2;

			when wait2 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait3;

			when wait3 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait4;

			when wait4 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait5;

			when wait5 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fixback1;

			when fixback1 =>
				we_mem <= '0';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fixback2;

			when fixback2 =>
				we_mem <= '1';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				if cur_x = "11111" then
					if cur_y = "11111" then
						new_state <= rstcnt;
					else
						new_state <= incr_xy1;
					end if;
				else
					new_state <= incr_x1;
				end if;

			when incr_x1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				rst_mem <= '0';
				ready_out <= '0';

				new_state <= incr_x2;

			when incr_x2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				rst_mem <= '0';
				ready_out <= '0';

				new_state <= fix1;

			when incr_xy1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				rst_mem <= '0';
				ready_out <= '0';

				new_state <= incr_xy2;

			when incr_xy2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				rst_mem <= '0';
				ready_out <= '0';

				new_state <= fix1;

			when rstcnt =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				rst_mem <= '1';
				ready_out <= '0';
				
				new_state <= sleep;

		end case;
	end process;
end behaviour;

