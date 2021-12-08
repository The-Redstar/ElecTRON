library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter8b_tb is
   component counter8b
      port(clk       : in  std_logic;
           rst       : in  std_logic;
           count_out : out std_logic_vector(7 downto 0));
   end component;
   signal clk       : std_logic;
   signal rst       : std_logic;
   signal count_out : std_logic_vector(7 downto 0);
begin
   test: counter8b port map (clk, rst, count_out);
   clk  <= '0' after 0 ns,
	     '1' after 45 ns,
	     '0' after 75 ns,
	     '1' after 105 ns,
	     '0' after 125 ns,
	     '1' after 155 ns,
	     '0' after 185 ns,
	     '1' after 215 ns,
	     '0' after 245 ns;

   rst <= '1' after 0 ns,
	    '0' after 25 ns,
	    '1' after 265 ns,
	    '0' after 290 ns;

end behaviour;

