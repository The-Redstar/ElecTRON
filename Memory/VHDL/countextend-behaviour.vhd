library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of countextend is
	type cntext_state is (SLEEP, HIGH1, HIGH2, WAIT1);
	signal state, new_state: cntext_state;
begin
	clkext_process: process(clk)
	begin
		if (rising_edge(clk)) then
			if rst = '1' then
				state <= SLEEP;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	clkext_fsm : process(state, incrIN)
	begin
		case state is
			when SLEEP =>
				incrOUT <= '0';
				if incrIN = '1' then
					new_state <= HIGH1;
				else
					new_state <= SLEEP;
				end if;
			when HIGH1 =>
				incrOUT <= '1';
				new_state <= HIGH2;
			when HIGH2 =>
				incrOUT <= '1';
				new_state <= WAIT1;
			when WAIT1 =>
				incrOUT <= '0';
				if incrIN = '0' then
					new_state <= SLEEP;
				else
					new_state <= WAIT1;
				end if;
		end case;
	end process;
end behaviour;

