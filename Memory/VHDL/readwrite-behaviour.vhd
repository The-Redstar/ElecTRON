library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of readwrite is
	type MEM_state is (SLEEP, rstALL, wait1, RCheck, WCheck, Rincr, Wincr, Rwait2, Rwait3, Rwait4, Rwait5, Rwait6, Wwait2, Wwait3, Wwait4, Wwait5, Wwait6);
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
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';
				
				if GOTOIN = '1' then
					new_state <= rstALL;
				end if;
				

			when rstALL =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '1';

				new_state <= wait1;

			when wait1 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';
	
				if WEIN = '1' then
					new_state <= WCheck;
				else
					new_state <= RCheck;
				end if;

			when RCheck =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';
				
				if ((curX(0) = AddressIN(0)) and (curY(0) = AddressIN(5))) then --moet eerste vijf van AddressIN worden
					new_state <= Rwait2;
				else
					new_state <= Rincr;
				end if;

				

			when WCheck =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

				if ((curX(0) = AddressIN(0)) and (curY(0) = AddressIN(5)) and (curW(0) = WriteIN(0))) then --moet eerste vijf van AddressIN worden
					new_state <= Wwait2;
				else
					new_state <= Wincr;
				end if;

			when Rincr =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wincr =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Rwait2 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Rwait3 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Rwait4 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Rwait5 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Rwait6 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wwait2 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wwait3 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wwait4 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wwait5 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

			when Wwait6 =>
				WEMEM <= '0';
				MEMEM <= '0';
				XincrMEM <= '0';
				YincrMEM <= '0';
				WincrMEM <= '0';
				readyOUT <= '0';
				rstMEM <= '0';

		end case;
	end process;
end behaviour;

