library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of counter5b_tb is
   component counter5b
      port(clk      : in  std_logic;
           rst      : in  std_logic;
           countOUT : out std_logic_vector(4 downto 0));
   end component;
   signal incr     : std_logic;
   signal rst      : std_logic;
   signal clk      : std_logic;
   signal countOUT : std_logic_vector(4 downto 0);
begin
   test: counter5b port map (clk, rst, countOUT);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
	  '0' after 15 ns;

end behaviour;

