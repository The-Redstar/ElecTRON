library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of reg_11_tb is
   component reg_11
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(10 downto 0);
           q     : out std_logic_vector(10 downto 0));
   end component;
   signal clk   : std_logic;
   signal reset : std_logic;
   signal e     : std_logic;
   signal d     : std_logic_vector(10 downto 0);
   signal q     : std_logic_vector(10 downto 0);
begin
   test: reg_11 port map (clk, reset, e, d, q);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   e <= '0' after 0 ns,
	'1' after 99 ns,
	'0' after 140 ns,
	'1' after 230 ns;

   d(0) <= '1' after 0 ns;
   d(1) <= '0' after 0 ns;
   d(2) <= '0' after 0 ns;
   d(3) <= '0' after 0 ns;
   d(4) <= '0' after 0 ns;
   d(5) <= '0' after 0 ns,
	   '1' after 200 ns;
   d(6) <= '0' after 0 ns;
   d(7) <= '0' after 0 ns;
   d(8) <= '0' after 0 ns;
   d(9) <= '0' after 0 ns;
   d(10) <= '0' after 0 ns;
end behaviour;

