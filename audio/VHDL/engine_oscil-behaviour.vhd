library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
--if dir changes, reset PWM period to start (based on dir and player)
--count period down on step_clk

--for pwm:
--count on audio_clk
--reset on period value
--output on count<period/4

architecture behaviour of engine_oscil is

	signal count, next_count, period_noboost, next_period_noboost, period, next_period, period_start:	unsigned(8 downto 0);
	signal next_wave:	std_logic;
	signal prev_dir:	std_logic_vector(1 downto 0);
	
begin

--clocking
	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				next_period<=unsigned(period_start);
				next_period_noboost<=unsigned(period_start);
				next_count<=to_unsigned(0,9);
				wave<='0';
			else
				count<=next_count;
				period_noboost<=next_period_noboost;
				period<=next_period;
				wave<=next_wave;
			end if;
			
			prev_dir<=dir;
		end if;
	end process;

--period
	process(player,dir)
	begin
		period_start<="100000000"; --100Dd000P, dir h/v, dir f/b, player
		period_start(0)<=player;
		period_start(5)<=dir(0);
		period_start(4)<=dir(1);
	end process;

	process(step_clk,dir,prev_dir,period_noboost)
	begin
		if dir/=prev_dir then --reset period on direction change
			next_period_noboost <= unsigned(period_start);
		elsif step_clk='1' then --decrease period to increase frequency
			next_period_noboost<=period_noboost-1;
		else
			next_period_noboost<=period_noboost;
		end if;
	
	end process;
	
	process(next_period_noboost,boost)
	begin
		if boost='1' then --double frequency when boosting
			next_period <= shift_right(next_period_noboost,1);
		else
			next_period <= next_period_noboost;
		end if;
	end process;

--count
	process(audio_clk,count)
	begin
		if audio_clk='1' then
			if count=period then --reset on period
				next_count <= to_unsigned(0,9);
			else --otherwise, increase
				next_count <= count+1;
			end if;
		else
			next_count <= count;
		end if;
	end process;

--wave output
	process(count,period)
	begin
		if count<shift_right(period,2) then
			next_wave<='1';
		else
			next_wave<='0';
		end if;
	end process;



end behaviour;

