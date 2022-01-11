library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
   signal temp: std_logic_vector (4 downto 0);
begin
   reg: process(clk)
      begin
         if rising_edge(clk) then
            if rst = '1' then
               output <= (others => '0');
               temp <= (others => '0');
            else
               output <= temp;
               temp <= input;
            end if;
	end if;
   end process;
end behaviour;

