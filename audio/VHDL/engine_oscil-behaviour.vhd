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

	signal count, next_count, count_boosted, period, next_period, new_period, next_new_period, period_start, period_boosted:	unsigned(17 downto 0);
	signal next_wave:	std_logic;
	signal prev_dir:	std_logic_vector(1 downto 0);
	
begin

--clocking
	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				count<=(others => '0');
				period<=unsigned(period_start);
				new_period<=unsigned(period_start);
				wave<='0';
			else
				count<=next_count;
				period<=next_period;
				new_period<=next_new_period;
				wave<=next_wave;
			end if;
			
			prev_dir<=dir;
		end if;
	end process;

--period
	--period on reset
	process(player,dir)
	begin
		period_start<="111101000010010000"; --11DD01000P10010000, dir h/v, dir f/b, player
		period_start(8)<=player;
		period_start(15)<=dir(0);
		period_start(14)<=dir(1);
	end process;

	--period for next period
	process(dir,prev_dir,period,new_period,count_boosted,period_start)
	begin
		if dir/=prev_dir then --reset period on direction change
			next_new_period <= unsigned(period_start);
		elsif count_boosted>=to_unsigned(114688,18) and count_boosted(8 downto 0)=to_unsigned(0,9) then --2^16+2^15+2^14
			next_new_period <= new_period-1;
		else
			next_new_period <= new_period;
		end if;
	end process;
	
	--boosted period
	process(period,count,boost)
	begin
		if boost='1' then --double frequency when boosting
			period_boosted <= shift_right(period,1);
			count_boosted <= shift_left(count,1);
		else
			period_boosted <= period;
			count_boosted <= count;
		end if;
	end process;
	

--count and new period
	process(count,period_boosted,new_period,period,boost)
	begin
		if count=period_boosted  then --reset on period
			next_count <= (others => '0');
			next_period <= new_period;
		else --otherwise, increase
			next_count <= count+1;
			next_period <= period;
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

