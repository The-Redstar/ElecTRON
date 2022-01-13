library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of test_data_gen is
	signal vga_x,vga_y	: unsigned(9 downto 0);
	signal frames	: unsigned(3 downto 0);
begin


	process(clk)
	begin
		if rising_edge(clk) then
			audio_clk<='0';
			step_clk<='0';
			if reset='1' then
				vga_x <= (others => '0');
				vga_y <= (others => '0');
				frames <= (others => '0');
			else
				if vga_x=to_unsigned(799,10) then
					vga_x<=(others => '0');
					audio_clk<='1';
					if vga_y=to_unsigned(514,10) then
						vga_y<=(others => '0');
						if frames=to_unsigned(8,10) then
							frames<=(others => '0');
							step_clk<='1';
						else
							frames<=frames+1;
						end if;
					else
						vga_y<=vga_y+1;
						frames<=frames;
					end if;
				else
					vga_x<=vga_x+1;
					vga_y<=vga_y;
					frames<=frames;
				end if;
			end if;
		end if;
	end process;



end behaviour;

