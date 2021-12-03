library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of readwrite is
	type MEM_state is (SLEEP, rstALL, wait1, Check, incrX1, incrX2, incrY1, incrY2, incrXY1, incrXY2, incrW1, incrW2, incrXW1, incrXW2, incrYW1, incrYW2, incrXYW1, incrXYW2, preCheck, wait2, wait3, wait4, wait5, wait6, wait2W, wait3W, wait4W, wait5W, wait6W, fix1, fix2, fix3, fixback1, fixback2);
	signal state, new_state: MEM_state;
begin
	MEM_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if rstIN = '1' then
				state <= SLEEP;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	MEM_fsm : process(state, WEIN, GOTOIN, AddressIN, WriteIN)
	begin
		case state is
			when SLEEP =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '1';
				rstMEM <= '0';
				
				if GOTOIN = '1' then
					new_state <= rstALL;
				else
					new_state <= SLEEP;
				end if;
				

			when rstALL =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '1';

				new_state <= wait1;

			when wait1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';
	
				new_state <= Check;

			when Check =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				if WEIN = '1' then
					if curX = AddressIN(4 downto 0) then
						if curY = AddressIN(9 downto 5) then
							if curW = WriteIN(7 downto 0) then
								new_state <= fix1;
							else
								new_state <= incrW1;
							end if;
						else
							if curW = WriteIN(7 downto 0) then
								new_state <= incrY1;
							else
								new_state <= incrYW1;
							end if;
						end if;
					else
						if curY = AddressIN(9 downto 5) then
							if curW = WriteIN(7 downto 0) then
								new_state <= incrX1;
							else
								new_state <= incrXW1;
							end if;
						else
							if curW = WriteIN(7 downto 0) then
								new_state <= incrXY1;
							else
								new_state <= incrXYW1;
							end if;
						end if;
					end if;
				else
					if curX = AddressIN(4 downto 0) then
						if curY = AddressIN(9 downto 5) then
							new_state <= wait2;
						else
							new_state <= incrY1;
						end if;
					else
						if curY = AddressIN(9 downto 5) then
							new_state <= incrX1;
						else
							new_state <= incrXY1;
						end if;
					end if;
				end if;


			when incrX1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrX2;

			when incrX2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrY1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '1';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrY2;

			when incrY2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '1';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrXY1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '1';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrXY2;

			when incrXY2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '1';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrW1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrW2;

			when incrW2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrXW1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '0';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrXW2;

			when incrXW2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '0';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrYW1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '1';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrYW2;

			when incrYW2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '1';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when incrXYW1 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '1';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= incrXYW2;

			when incrXYW2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '1';
				YincrMEM <= '1';
				WincrMEM <= '1';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= preCheck;

			when preCheck =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= Check;

			when fix1 =>
				WEMEM <= '1';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fix2;

			when fix2 =>
				WEMEM <= '0';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fix3;

			when fix3 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait2W;

			when wait2 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait3;

			when wait3 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait4;

			when wait4 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait5;

			when wait5 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait6;

			when wait6 =>
				WEMEM <= '1';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= SLEEP;

			when wait2W =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait3;

			when wait3W =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait4;

			when wait4W =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait5;

			when wait5W =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= wait6;

			when wait6W =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fixback1;

			when fixback1 =>
				WEMEM <= '0';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= fixback2;

			when fixback2 =>
				WEMEM <= '1';
				MEMEM <= '1';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				new_state <= SLEEP;

		end case;
	end process;
end behaviour;

