library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of wall_decoder is
	signal en0, en1, en2: std_logic;
begin
	en0<=encoded(0);--C
	en1<=encoded(1);--B
	en2<=encoded(2);--A

	north<=(not(en2) and en1) or (en1 and en0) or (en2 and not(en1) and not(en0));--up A'B+BC+AB'C'
	east<=(en2 and en1) or (not(en2) and en0);--right
	south<=(en1 and not(en0)) or (not(en2) and en1) or (en2 and not(en1) and en0);--down
	west<=(en2 and not(en1)) or (not(en2) and en0);--left
end behaviour; 

