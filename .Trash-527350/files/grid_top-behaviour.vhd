library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;



--	map 1:
--		normal TRON, no jumps
--	map 2:
--		spiral array of small jumps
--		x and y both: e3,e4,e7,e8,r4_7, e15,e16,r14_15,r16_17, e21,e22,e25,e26,r22_25
--	map 3:
--		"butterfly" 2-way symmetry
--		????
--	map 4:
--		3 jumps, 2 smaller and 1 large
--		x e7,e8,r6_9, e9,e10,e19,e20,r10_19, e21,e22,r20_23
--		y e8,e9,r6_11,e21,e22,e25,e26

-- RAMPS:
-- rotation 1:
--
--  L0     L1
--
-- __A__ __B__
-- --C-- --D-- y1
--     | |
--     | |
--     E F
--     | |
-- __A_| |_B__ y2
-- --C-- --D--
-- x1  m n   x2

architecture behaviour of grid_top is

-- is this better? (+for loop)
--	type booleans is array (integer range <>) of b;

	signal x,y : unsigned(4 downto 0);

begin

	x<=unsigned(x_addr);
	y<=unsigned(y_addr);

	process(x,y)
		--comparison variables
		--variable xe0,xe29, xe3,xe4,xe7,xe8,xe9,xe10,xe15,xe16,xe19,xe20,xe21,xe22,xe25,xe26 : boolean;
		--variable ye0,ye29, ye3,ye4,ye7,ye8,ye9,		ye15,ye16,			ye21,ye22,ye25,ye26 : boolean;
		variable xe0, xe1, xe2, xe3, xe4, xe5, xe6, xe7, xe8, xe9, xe10, xe11, xe12, xe13, xe14, xe15, xe16, xe17, xe18, xe19, xe20, xe21, xe22, xe23, xe24, xe25, xe26, xe27, xe28, xe29, ye0, ye1, ye2, ye3, ye4, ye5, ye6, ye7, ye8, ye9, ye10, ye11, ye12, ye13, ye14, ye15, ye16, ye17, ye21, ye22, ye23, ye24, ye25, ye26, ye27, ye28, ye29 : boolean;
		variable xr0_4, xr10_19, xr12_17, xr13_14, xr15_16, xr20_21, xr22_23, xr24_25, xr25_29, xr4_5, xr6_7, xr8_9, yr0_4, yr13_14, yr13_16, yr15_16, yr21_22, yr23_24, yr25_29, yr26_29, yr5_6, yr6_8, yr7_8, yr9_11 : boolean;
		--variable xr4_7,				xr14_15,xr16_17,xr22_25									: boolean;
		--variable yr4_7,yr6_8,yr9_11,yr14_15,yr16_17,yr22_25									: boolean;
	begin
		--precompute comparisons
		xe0:=(x=to_unsigned(0,5));
		xe1:=(x=to_unsigned(1,5));
		xe2:=(x=to_unsigned(2,5));
		xe3:=(x=to_unsigned(3,5));
		xe4:=(x=to_unsigned(4,5));
		xe5:=(x=to_unsigned(5,5));
		xe6:=(x=to_unsigned(6,5));
		xe7:=(x=to_unsigned(7,5));
		xe8:=(x=to_unsigned(8,5));
		xe9:=(x=to_unsigned(9,5));
		xe10:=(x=to_unsigned(10,5));
		xe11:=(x=to_unsigned(11,5));
		xe12:=(x=to_unsigned(12,5));
		xe13:=(x=to_unsigned(13,5));
		xe14:=(x=to_unsigned(14,5));
		xe15:=(x=to_unsigned(15,5));
		xe16:=(x=to_unsigned(16,5));
		xe17:=(x=to_unsigned(17,5));
		xe18:=(x=to_unsigned(18,5));
		xe19:=(x=to_unsigned(19,5));
		xe20:=(x=to_unsigned(20,5));
		xe21:=(x=to_unsigned(21,5));
		xe22:=(x=to_unsigned(22,5));
		xe23:=(x=to_unsigned(23,5));
		xe24:=(x=to_unsigned(24,5));
		xe25:=(x=to_unsigned(25,5));
		xe26:=(x=to_unsigned(26,5));
		xe27:=(x=to_unsigned(27,5));
		xe28:=(x=to_unsigned(28,5));
		xe29:=(x=to_unsigned(29,5));
		ye0:=(y=to_unsigned(0,5));
		ye1:=(y=to_unsigned(1,5));
		ye2:=(y=to_unsigned(2,5));
		ye3:=(y=to_unsigned(3,5));
		ye4:=(y=to_unsigned(4,5));
		ye5:=(y=to_unsigned(5,5));
		ye6:=(y=to_unsigned(6,5));
		ye7:=(y=to_unsigned(7,5));
		ye8:=(y=to_unsigned(8,5));
		ye9:=(y=to_unsigned(9,5));
		ye10:=(y=to_unsigned(10,5));
		ye11:=(y=to_unsigned(11,5));
		ye12:=(y=to_unsigned(12,5));
		ye13:=(y=to_unsigned(13,5));
		ye14:=(y=to_unsigned(14,5));
		ye15:=(y=to_unsigned(15,5));
		ye16:=(y=to_unsigned(16,5));
		ye17:=(y=to_unsigned(17,5));
		ye21:=(y=to_unsigned(21,5));
		ye22:=(y=to_unsigned(22,5));
		ye23:=(y=to_unsigned(23,5));
		ye24:=(y=to_unsigned(24,5));
		ye25:=(y=to_unsigned(25,5));
		ye26:=(y=to_unsigned(26,5));
		ye27:=(y=to_unsigned(27,5));
		ye28:=(y=to_unsigned(28,5));
		ye29:=(y=to_unsigned(29,5));
		xr0_4:=xe0 or xe1 or xe2 or xe3 or xe4;
		xr10_19:=xe10 or xe11 or xe12 or xe13 or xe14 or xe15 or xe16 or xe17 or xe18 or xe19;
		xr12_17:=xe12 or xe13 or xe14 or xe15 or xe16 or xe17;
		xr13_14:=xe13 or xe14;
		xr15_16:=xe15 or xe16;
		xr20_21:=xe20 or xe21;
		xr22_23:=xe22 or xe23;
		xr24_25:=xe24 or xe25;
		xr25_29:=xe25 or xe26 or xe27 or xe28 or xe29;
		xr4_5:=xe4 or xe5;
		xr6_7:=xe6 or xe7;
		xr8_9:=xe8 or xe9;
		yr0_4:=ye0 or ye1 or ye2 or ye3 or ye4;
		yr13_14:=ye13 or ye14;
		yr13_16:=ye13 or ye14 or ye15 or ye16;
		yr15_16:=ye15 or ye16;
		yr21_22:=ye21 or ye22;
		yr23_24:=ye23 or ye24;
		yr25_29:=ye25 or ye26 or ye27 or ye28 or ye29;
		yr26_29:=ye26 or ye27 or ye28 or ye29;
		yr5_6:=ye5 or ye6;
		yr6_8:=ye6 or ye7 or ye8;
		yr7_8:=ye7 or ye8;
		yr9_11:=ye9 or ye10 or ye11;
		
		--old manual signals
		--xe0 := (x=to_unsigned(0,5));
		--ye0 := (y=to_unsigned(0,5));
		--xe29 := (x=to_unsigned(29,5));
		--xe29 := (y=to_unsigned(29,5));
		
		--xe3 := (x=to_unsigned(3,5));
		--xe4 := (x=to_unsigned(4,5));
		--xe7 := (x=to_unsigned(7,5));
		--xe8 := (x=to_unsigned(8,5));
		--xe9 := (x=to_unsigned(9,5));
		--xe10 := (x=to_unsigned(10,5));
		--xe15 := (x=to_unsigned(15,5));
		--xe16 := (x=to_unsigned(16,5));
		--xe19 := (x=to_unsigned(19,5));
		--xe20 := (x=to_unsigned(20,5));
		--xe21 := (x=to_unsigned(21,5));
		--xe22 := (x=to_unsigned(22,5));
		--xe25 := (x=to_unsigned(25,5));
		--xe26 := (x=to_unsigned(26,5));
		
		--ye3 := (y=to_unsigned(3,5));
		--ye4 := (y=to_unsigned(4,5));
		--ye7 := (y=to_unsigned(7,5));
		--ye8 := (y=to_unsigned(8,5));
		--ye9 := (y=to_unsigned(9,5));
		--ye15 := (y=to_unsigned(15,5));
		--ye16 := (y=to_unsigned(16,5));
		--ye21 := (y=to_unsigned(21,5));
		--ye22 := (y=to_unsigned(22,5));
		--ye25 := (y=to_unsigned(25,5));
		--ye26 := (y=to_unsigned(26,5));
		
		--xr4_7 := (x>=to_unsigned(4,5)) and (x<=to_unsigned(7,5));
		--xr14_15 := xe15 or (x=to_unsigned(14,5));
		--xr16_17 := xe16 or (x=to_unsigned(17,5));
		--xr22_25 := (x>=to_unsigned(22,5)) and (x<=to_unsigned(25,5));
		
		--yr4_7 := (y>=to_unsigned(4,5)) and (y<=to_unsigned(7,5));
		--yr6_8 := (y>=to_unsigned(6,5)) and (y<=to_unsigned(8,5));
		--yr9_11 := (y>=to_unsigned(9,5)) and (y<=to_unsigned(11,5));
		--yr14_15 := ye15 or (y=to_unsigned(14,5));
		--yr16_17 := ye16 or (y=to_unsigned(17,5));
		--yr22_25 := (y>=to_unsigned(22,5)) and (y<=to_unsigned(25,5));

		--calculate borders and jumps
		borders <= (others => '0');
		jumps <= (others => '0');

		--grid outside borders
		if ye0 then --N
			borders(0)<='1';
			borders(4)<='1';
		end if;
		if xe0 then --W
			borders(1)<='1';
			borders(5)<='1';
		end if;
		if ye29 then --S
			borders(2)<='1';
			borders(6)<='1';
		end if;
		if xe29 then --E
			borders(3)<='1';
			borders(7)<='1';
		end if;
		
		--map dependent ramps
		case map_select is
			when "00" => --no ramps, normal TRON
				player0_start_pos <= "10111000000"; --1 14 0
				player1_start_pos <= "10111111101"; --1 15 29
				player0_start_dir <= "11";
				player1_start_dir <= "01";
				
			when "01" => --spiral
				player0_start_pos <= "10000000110"; --1 0 6
				player1_start_pos <= "11110110111"; --1 29 23
				player0_start_dir <= "10";
				player1_start_dir <= "00";
--				--N ramp
--				--sides
--				if xr16_17 and (ye3 or ye7) then
--					borders(2)<='1';
--				end if;
--				if xr16_17 and (ye4 or ye8) then
--					borders(0)<='1';
--				end if;
--				if xr14_15 and (ye3 or ye7) then
--					borders(6)<='1';
--				end if;
--				if xr14_15 and (ye4 or ye8) then
--					borders(4)<='1';
--				end if;
--				
--				--jump bit
--				if yr4_7 and xe15 then
--					borders(3)<='1';
--					jumps(7)<='1';
--				end if;
--				if yr4_7 and xe16 then
--					borders(5)<='1';
--					jumps(1)<='1';
--				end if;
--				
--				
--				
--				--W ramp
--				--side
--				if yr16_17 and (xe3 or xe7) then
--					borders(6)<='1';
--				end if;
--				if yr16_17 and (xe4 or xe8) then
--					borders(4)<='1';
--				end if;
--				if yr14_15 and (xe3 or xe7) then
--					borders(2)<='1';
--				end if;
--				if yr14_15 and (xe4 or xe8) then
--					borders(0)<='1';
--				end if;
--				
--				--jump bit
--				if xr4_7 and ye15 then
--					borders(7)<='1';
--					jumps(3)<='1';
--				end if;
--				if xr4_7 and ye16 then
--					borders(1)<='1';
--					jumps(5)<='1';
--				end if;
--				
--				
--				
--				--S ramp
--				--side
--				if xr16_17 and (ye21 or ye25) then
--					borders(6)<='1';
--				end if;
--				if xr16_17 and (ye22 or ye26) then
--					borders(4)<='1';
--				end if;
--				if xr14_15 and (ye21 or ye25) then
--					borders(2)<='1';
--				end if;
--				if xr14_15 and (ye22 or ye26) then
--					borders(0)<='1';
--				end if;
--				
--				--jump bit
--				if yr4_7 and xe15 then
--					borders(7)<='1';
--					jumps(3)<='1';
--				end if;
--				if yr4_7 and xe16 then
--					borders(1)<='1';
--					jumps(5)<='1';
--				end if;
--				
--				
--				
--				--E ramp
--				--side
--				if yr16_17 and (xe21 or xe25) then
--					borders(2)<='1';
--				end if;
--				if yr16_17 and (xe22 or xe26) then
--					borders(0)<='1';
--				end if;
--				if yr14_15 and (xe21 or xe25) then
--					borders(6)<='1';
--				end if;
--				if yr14_15 and (xe22 or xe26) then
--					borders(4)<='1';
--				end if;
--				
--				--jump bit
--				if xr4_7 and ye15 then
--					borders(3)<='1';
--					jumps(7)<='1';
--				end if;
--				if xr4_7 and ye16 then
--					borders(5)<='1';
--					jumps(1)<='1';
--				end if;

				--signals: ['xe-1', 'xe0', 'xe14', 'xe15', 'xe24', 'xe25', 'xe29', 'xe30', 'xe4', 'xe5', 'xr0_4', 'xr13_14', 'xr15_16', 'xr25_29', 'ye-1', 'ye0', 'ye14', 'ye15', 'ye24', 'ye25', 'ye29', 'ye30', 'ye4', 'ye5', 'yr0_4', 'yr13_14', 'yr15_16', 'yr25_29']


				-- RAMP from (0, 13) to (4, 16), orientation N
				-- A
				if yr13_14 and (xe4) then
					borders(7)<='1';
				end if;
				-- B
				if yr15_16 and (xe4) then
					borders(3)<='1';
				end if;
				-- C
				if yr13_14 and (xe5) then
					borders(5)<='1';
				end if;
				-- D
				if yr15_16 and (xe5) then
					borders(1)<='1';
				end if;
				-- E
				if xr0_4 and ye14 then
					borders(2)<='1';
					jumps(6)<='1';
				end if;
				-- F
				if xr0_4 and ye15 then
					borders(4)<='1';
					jumps(0)<='1';
				end if;
				

				-- RAMP from (13, 0) to (16, 4), orientation E
				-- A
				if xr13_14 and (ye4) then
					borders(2)<='1';
				end if;
				-- B
				if xr15_16 and (ye4) then
					borders(6)<='1';
				end if;
				-- C
				if xr13_14 and (ye5) then
					borders(0)<='1';
				end if;
				-- D
				if xr15_16 and (ye5) then
					borders(4)<='1';
				end if;
				-- E
				if yr0_4 and xe14 then
					borders(7)<='1';
					jumps(3)<='1';
				end if;
				-- F
				if yr0_4 and xe15 then
					borders(1)<='1';
					jumps(5)<='1';
				end if;


				-- RAMP from (25, 13) to (29, 16), orientation S
				-- A
				if yr13_14 and (xe24) then
					borders(3)<='1';
				end if;
				-- B
				if yr15_16 and (xe24) then
					borders(7)<='1';
				end if;
				-- C
				if yr13_14 and (xe25) then
					borders(1)<='1';
				end if;
				-- D
				if yr15_16 and (xe25) then
					borders(5)<='1';
				end if;
				-- E
				if xr25_29 and ye14 then
					borders(6)<='1';
					jumps(2)<='1';
				end if;
				-- F
				if xr25_29 and ye15 then
					borders(0)<='1';
					jumps(4)<='1';
				end if;
				

				-- RAMP from (13, 25) to (16, 29), orientation W
				-- A
				if xr13_14 and (ye24) then
					borders(6)<='1';
				end if;
				-- B
				if xr15_16 and (ye24) then
					borders(2)<='1';
				end if;
				-- C
				if xr13_14 and (ye25) then
					borders(4)<='1';
				end if;
				-- D
				if xr15_16 and (ye25) then
					borders(0)<='1';
				end if;
				-- E
				if yr25_29 and xe14 then
					borders(3)<='1';
					jumps(7)<='1';
				end if;
				-- F
				if yr25_29 and xe15 then
					borders(5)<='1';
					jumps(1)<='1';
				end if;
				
			when "10" => --4way
				player0_start_pos <= "10000001110"; --l1 y0  x14
				player1_start_pos <= "11110101111"; --l1 y29 x15
				player0_start_dir <= "10";
				player1_start_dir <= "00";
				
				-- RAMP from (12, 5) to (17, 8), orientation S
				-- A
				if yr5_6 and (xe11 or xe17) then
					borders(3)<='1';
				end if;
				-- B
				if yr7_8 and (xe11 or xe17) then
					borders(7)<='1';
				end if;
				-- C
				if yr5_6 and (xe12 or xe18) then
					borders(1)<='1';
				end if;
				-- D
				if yr7_8 and (xe12 or xe18) then
					borders(5)<='1';
				end if;
				-- E
				if xr12_17 and ye6 then
					borders(6)<='1';
					jumps(2)<='1';
				end if;
				-- F
				if xr12_17 and ye7 then
					borders(0)<='1';
					jumps(4)<='1';
				end if;
				
				--signals used: yr5_6 xe11 xe17 yr7_8 xe12 xe18 xr12_17 ye6 ye7
				

				-- RAMP from (12, 21) to (17, 24), orientation N
				-- A
				if yr21_22 and (xe11 or xe17) then
					borders(7)<='1';
				end if;
				-- B
				if yr23_24 and (xe11 or xe17) then
					borders(3)<='1';
				end if;
				-- C
				if yr21_22 and (xe12 or xe18) then
					borders(5)<='1';
				end if;
				-- D
				if yr23_24 and (xe12 or xe18) then
					borders(1)<='1';
				end if;
				-- E
				if xr12_17 and ye22 then
					borders(2)<='1';
					jumps(6)<='1';
				end if;
				-- F
				if xr12_17 and ye23 then
					borders(4)<='1';
					jumps(0)<='1';
				end if;
				
				--signals used: yr21_22 xe11 xe17 yr23_24 xe12 xe18 xr12_17 ye22 ye23
				

				-- RAMP from (4, 13) to (7, 16), orientation W
				-- A
				if xr4_5 and (ye12 or ye16) then
					borders(6)<='1';
				end if;
				-- B
				if xr6_7 and (ye12 or ye16) then
					borders(2)<='1';
				end if;
				-- C
				if xr4_5 and (ye13 or ye17) then
					borders(4)<='1';
				end if;
				-- D
				if xr6_7 and (ye13 or ye17) then
					borders(0)<='1';
				end if;
				-- E
				if yr13_16 and xe5 then
					borders(3)<='1';
					jumps(7)<='1';
				end if;
				-- F
				if yr13_16 and xe6 then
					borders(5)<='1';
					jumps(1)<='1';
				end if;
				
				--signals used: xr4_5 ye12 ye16 xr6_7 ye13 ye17 yr13_16 xe5 xe6
				


				-- RAMP from (22, 13) to (25, 16), orientation E
				-- A
				if xr22_23 and (ye12 or ye16) then
					borders(2)<='1';
				end if;
				-- B
				if xr24_25 and (ye12 or ye16) then
					borders(6)<='1';
				end if;
				-- C
				if xr22_23 and (ye13 or ye17) then
					borders(0)<='1';
				end if;
				-- D
				if xr24_25 and (ye13 or ye17) then
					borders(4)<='1';
				end if;
				-- E
				if yr13_16 and xe23 then
					borders(7)<='1';
					jumps(3)<='1';
				end if;
				-- F
				if yr13_16 and xe24 then
					borders(1)<='1';
					jumps(5)<='1';
				end if;
				
				--signals used: xr22_23 ye12 ye16 xr24_25 ye13 ye17 yr13_16 xe23 xe24
				
				
				--signals: ['xe11', 'xe12', 'xe17', 'xe18', 'xe23', 'xe24', 'xe5', 'xe6', 'xr12_17', 'xr22_23', 'xr24_25', 'xr4_5', 'xr6_7', 'ye12', 'ye13', 'ye16', 'ye17', 'ye22', 'ye23', 'ye6', 'ye7', 'yr13_16', 'yr21_22', 'yr23_24', 'yr5_6', 'yr7_8']
				
			when others => --3 ramps
				player0_start_pos <= "10111000000"; --1 14 0
				player1_start_pos <= "10111011101"; --1 14 29
				player0_start_dir <= "11";
				player1_start_dir <= "01";
				
				-- RAMP from (10, 6) to (19, 11), orientation S
				-- A
				if yr6_8 and (xe9 or xe19) then
					borders(3)<='1';
				end if;
				-- B
				if yr9_11 and (xe9 or xe19) then
					borders(7)<='1';
				end if;
				-- C
				if yr6_8 and (xe10 or xe20) then
					borders(1)<='1';
				end if;
				-- D
				if yr9_11 and (xe10 or xe20) then
					borders(5)<='1';
				end if;
				-- E
				if xr10_19 and ye8 then
					borders(6)<='1';
					jumps(2)<='1';
				end if;
				-- F
				if xr10_19 and ye9 then
					borders(0)<='1';
					jumps(4)<='1';
				end if;
				
				--signals used: yr6_8 xe9 xe19 yr9_11 xe10 xe20 xr10_19 ye8 ye9
				

				-- RAMP from (6, 26) to (9, 29), orientation W
				-- A
				if xr6_7 and (ye25) then
					borders(6)<='1';
				end if;
				-- B
				if xr8_9 and (ye25) then
					borders(2)<='1';
				end if;
				-- C
				if xr6_7 and (ye26) then
					borders(4)<='1';
				end if;
				-- D
				if xr8_9 and (ye26) then
					borders(0)<='1';
				end if;
				-- E
				if yr26_29 and xe7 then
					borders(3)<='1';
					jumps(7)<='1';
				end if;
				-- F
				if yr26_29 and xe8 then
					borders(5)<='1';
					jumps(1)<='1';
				end if;
				
				--signals used: xr6_7 ye25  xr8_9 ye26  yr26_29 xe7 xe8
				

				-- RAMP from (20, 26) to (23, 29), orientation E
				-- A
				if xr20_21 and (ye25) then
					borders(2)<='1';
				end if;
				-- B
				if xr22_23 and (ye25) then
					borders(6)<='1';
				end if;
				-- C
				if xr20_21 and (ye26) then
					borders(0)<='1';
				end if;
				-- D
				if xr22_23 and (ye26) then
					borders(4)<='1';
				end if;
				-- E
				if yr26_29 and xe21 then
					borders(7)<='1';
					jumps(3)<='1';
				end if;
				-- F
				if yr26_29 and xe22 then
					borders(1)<='1';
					jumps(5)<='1';
				end if;
				
				--signals used: xr20_21 ye25  xr22_23 ye26  yr26_29 xe21 xe22
				
				--signals:['xe10', 'xe19', 'xe20', 'xe21', 'xe22', 'xe7', 'xe8', 'xe9', 'xr10_19', 'xr20_21', 'xr22_23', 'xr6_7', 'xr8_9', 'ye25', 'ye26', 'ye29', 'ye30', 'ye8', 'ye9', 'yr26_29', 'yr6_8', 'yr9_11']
		end case;
		

	end process;



end behaviour;

