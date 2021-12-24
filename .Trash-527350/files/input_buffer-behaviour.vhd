library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
   signal temp1: std_logic_vector (3 downto 0);
   signal temp2: std_logic;
begin
   reg: process(clk)
      begin
         if rising_edge(clk) then
            if rst = '1' then
               dir_out <= (others => '0');
               start_out <= '0';
               temp1 <= (others => '0');
               temp2 <= '0';
            else
               dir_out <= temp1;
               temp1 <= dir_in;
               start_out <= temp2;
               temp2 <= start_in;
            end if;
	end if;
   end process;
end behaviour;

