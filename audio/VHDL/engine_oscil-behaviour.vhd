library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
--if dir changes, reset PWM period to start (based on dir and player)
--count period down on step_clk

--for pwm:
--count on clk
--reset on period value
--increase/decrease period based on certain conditions
--output on count<period/2

--beep: constant frequency
--engine: increasing frequency
--crash: decreasing frequency, period noise(?)

architecture behaviour of engine_oscil is

	signal count, next_count, count_boosted, period, next_period, new_period, next_new_period, period_start, period_boosted:	unsigned(18 downto 0);
	signal next_wave:	std_logic;
	signal prev_dir:	std_logic_vector(1 downto 0);
	signal prev_engine, prev_crash:	std_logic;
	
	signal frozen_bits, next_frozen_bits: std_logic_vector(3 downto 0);
	
	constant ENGINE_START_PERIOD	: unsigned(18 downto 0) := "011ZZ01000Z10010000"; --"0111101000010010000";
	constant BEEP_PERIOD			: unsigned(18 downto 0) := "0100001000010010000";
	constant CRASH_START_PERIOD		: unsigned(18 downto 0) := "0011110000000000000";
	
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
			prev_engine<=engine;
			prev_crash<=crash;
			frozen_bits<=next_frozen_bits;
		end if;
	end process;

--period
	--period on reset
	process(player,dir)
	begin
		period_start<=ENGINE_START_PERIOD; --11DD01000P10010000, dir h/v, dir f/b, player
		period_start(8)<=player;
		period_start(15)<=dir(0);
		period_start(14)<=dir(1);
		--period_start(16 downto 13) <= unsigned(bits);
	end process;

	--period for next period
	process(dir,prev_dir,period,new_period,count_boosted,period_start, crash, prev_crash, engine, prev_engine, beep)
	begin
		next_new_period <= new_period; --default: keep period
		
		if beep='1' then --constant period for beep
			next_new_period <= BEEP_PERIOD;
		end if;
		
		if engine='1' and (prev_engine='0' or dir/=prev_dir) then --reset period on direction change or when starting engine mode
			next_new_period <= period_start;
		elsif crash='1' and prev_crash='0' then --set to crash period when starting crash sound
			next_new_period <= CRASH_START_PERIOD;
			
		elsif count_boosted>=to_unsigned(114688,19) and count_boosted(8 downto 0)=to_unsigned(0,9) then --2^16+2^15+2^14
			if engine='1' then
				next_new_period <= new_period-1;
			elsif crash='1' then
				next_new_period <= new_period+6;
			end if;
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
	process(count,period_boosted,new_period,period,boost,bits,crash)
		--variable long_bits: unsigned(18 downto 0);
		--variable mult_bits: unsigned(4 downto 0);
	begin
		--long_bits:=(others=>'0');
		--long_bits(15 downto 12) := unsigned(bits);
		--mult_bits(4):='1';
		--mult_bits(3 downto 0):=unsigned(bits);
		next_frozen_bits <= frozen_bits;
		if count=period_boosted  then --reset on period
			next_frozen_bits<=bits;
			next_count <= (others => '0');
			if crash='1' then
				--next_period <= new_period+long_bits;
				--next_period(16 downto 13) <= unsigned(bits);
				next_period <= new_period;--new_period(17 downto 4)*mult_bits;
			else
				next_period <= new_period;
			end if;
			
		else --otherwise, increase
			next_count <= count+1;
			next_period <= period;
		end if;
	end process;

--wave output
	process(count,period_boosted)
	begin
		if count<shift_right(period_boosted,2) then
			next_wave<=frozen_bits(0) or not crash;--'1';
		elsif count<shift_right(period_boosted,1) then
			next_wave<=frozen_bits(1) or not crash;--'1';
		elsif count<shift_right(period_boosted,1)+shift_right(period_boosted,2) then
			next_wave<=frozen_bits(2) and crash;--'0';
		else
			next_wave<=frozen_bits(3) and crash;--'0';
		end if;
	end process;



end behaviour;

