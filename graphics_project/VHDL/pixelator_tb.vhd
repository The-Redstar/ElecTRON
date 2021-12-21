library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity pixelator_tb is
end pixelator_tb;
architecture tb of pixelator_tb is
	signal dx, dy, ndx, ndy, colour :std_logic_vector(3 downto 0):="0000";
	signal s1, s2, s3, s4 :  std_logic:='0';   
        signal  s5 , s6 , s7, s8 :  std_logic_vector(1 downto 0):="00"; 
        signal s9, s10, s11 : std_logic_vector(7 downto 0):="00000000";
begin
	lbl1: entity work.pixelator port map(dx,dy, s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,colour);
	process	
	begin
		
		ndx<=std_logic_vector(unsigned(dx)+1);
     		
		if dx="1111" then
			ndy<=std_logic_vector(unsigned(dy)+1);
		end if;
		wait for 10 ns;
	end process;
	dx<=ndx;
	dy<=ndy;
end tb;
	