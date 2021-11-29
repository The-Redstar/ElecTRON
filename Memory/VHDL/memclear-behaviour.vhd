library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memclear is
	type memclr_state is (SLEEP, rstALL, fix1, fix2, fix3, wait1, wait2, wait3, wait4, wait5, fixback1, fixback2, incr, rstcnt);
	signal state, new_state: memclr_state;
begin
	memclr_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if rst = '1' then
				state <= SLEEP;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	memclear_fsm : process(state, clearmem, curX, curY)
	begin
		case state is
			when SLEEP =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				rstMEM <= '0';
				readyOUT <= '1';
				
				if clearmem = '1' then
					new_state <= rstALL;
				else
					new_state <= SLEEP;
				end if;

			when rstALL =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				rstMEM <= '1';
				readyOUT <= '0';
				
				new_state <= fix1;

			when fix1 =>
				WEMEM <= '1';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fix2;

			when fix2 =>
				WEMEM <= '0';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fix3;

			when fix3 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait2;

			when wait1 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait2;

			when wait2 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait3;

			when wait3 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait4;

			when wait4 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait5;

			when wait5 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fixback1;

			when fixback1 =>
				WEMEM <= '0';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fixback2;

			when fixback2 =>
				WEMEM <= '1';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incr;

			when incr =>
				WEMEM <= '1';
				MEMEM <= '0';
				rstMEM <= '0';
				readyOUT <= '0';
				XincrMEM <= '1';

				if new_state = incr and curX = "11111" then
					YincrMEM <= '1';
					if curY = "11111" then
						new_state <= rstcnt;
					else
						new_state <= fix1;
					end if;
				else
					YincrMEM <= '0';
					new_state <= fix1;
				end if;

			when rstcnt =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				rstMEM <= '1';
				readyOUT <= '0';
				
				new_state <= SLEEP;

		end case;
	end process;
end behaviour;

