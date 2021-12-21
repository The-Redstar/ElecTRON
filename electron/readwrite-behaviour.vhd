library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of readwrite is
	type mem_state is (sleep, rst_all, wait1, check, incr_x1, incr_x2, incr_y1, incr_y2, incr_xy1, incr_xy2, incr_w1, incr_w2, incr_xw1, incr_xw2, incr_yw1, incr_yw2, incr_xyw1, incr_xyw2, precheck, wait2, wait3, wait4, wait5, wait6, wait2w, wait3w, wait4w, wait5w, wait6w, fix1, fix2, fix3, fixback1, fixback2);
	signal state, new_state: mem_state;
begin
	mem_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if rst_in = '1' then
				state <= sleep;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	mem_fsm : process(state, we_in, goto_in, address_in, write_in, cur_x, cur_y, cur_w, busy_in)
	begin
		case state is
			when sleep =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '1';
				rst_mem <= '0';
				
				if busy_in = '0' and goto_in = '1' then
					new_state <= rst_all;
				else
					new_state <= sleep;
				end if;
				

			when rst_all =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '1';

				new_state <= wait1;

			when wait1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';
	
				new_state <= check;

			when check =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				if we_in = '1' then
					if cur_x = address_in(4 downto 0) then
						if cur_y = address_in(9 downto 5) then
							if cur_w = write_in(7 downto 0) then
								new_state <= fix1;
							else
								new_state <= incr_w1;
							end if;
						else
							if cur_w = write_in(7 downto 0) then
								new_state <= incr_y1;
							else
								new_state <= incr_yw1;
							end if;
						end if;
					else
						if cur_y = address_in(9 downto 5) then
							if cur_w = write_in(7 downto 0) then
								new_state <= incr_x1;
							else
								new_state <= incr_xw1;
							end if;
						else
							if cur_w = write_in(7 downto 0) then
								new_state <= incr_xy1;
							else
								new_state <= incr_xyw1;
							end if;
						end if;
					end if;
				else
					if cur_x = address_in(4 downto 0) then
						if cur_y = address_in(9 downto 5) then
							new_state <= wait2;
						else
							new_state <= incr_y1;
						end if;
					else
						if cur_y = address_in(9 downto 5) then
							new_state <= incr_x1;
						else
							new_state <= incr_xy1;
						end if;
					end if;
				end if;


			when incr_x1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_x2;

			when incr_x2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_y1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '1';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_y2;

			when incr_y2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '1';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_xy1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_xy2;

			when incr_xy2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_w1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_w2;

			when incr_w2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_xw1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_xw2;

			when incr_xw2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '0';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_yw1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '1';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_yw2;

			when incr_yw2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '1';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when incr_xyw1 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= incr_xyw2;

			when incr_xyw2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '1';
				y_incr_mem <= '1';
				w_incr_mem <= '1';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= precheck;

			when precheck =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= check;

			when fix1 =>
				we_mem <= '1';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fix2;

			when fix2 =>
				we_mem <= '0';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fix3;

			when fix3 =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait2w;

			when wait2 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait3;

			when wait3 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait4;

			when wait4 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait5;

			when wait5 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait6;

			when wait6 =>
				we_mem <= '1';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= sleep;

			when wait2w =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait3w;

			when wait3w =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait4w;

			when wait4w =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait5w;

			when wait5w =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= wait6w;

			when wait6w =>
				we_mem <= '0';
				me_mem <= '0';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fixback1;

			when fixback1 =>
				we_mem <= '0';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= fixback2;

			when fixback2 =>
				we_mem <= '1';
				me_mem <= '1';
				x_incr_mem <= '0';
				y_incr_mem <= '0';
				w_incr_mem <= '0';
				ready_out <= '0';
				rst_mem <= '0';

				new_state <= sleep;

		end case;
	end process;
end behaviour;

