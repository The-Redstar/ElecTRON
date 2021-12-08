library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of countextend_tb is
   component countextend
      port(clk     : in  std_logic;
   	  rst	    : in  std_logic;
           incrIN  : in  std_logic;
           incrOUT : out std_logic);
   end component;
   signal clk     : std_logic;
   signal rst	    : std_logic;
   signal incrIN  : std_logic;
   signal incrOUT : std_logic;
begin
   test: countextend port map (clk, rst, incrIN, incrOUT);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
	    '0' after 25 ns;
   incrIN <= '0' after 0 ns,
		 '1' after 45 ns,
		 '0' after 65 ns,
		 '1' after 205 ns,
		 '0' after 225 ns;
end behaviour;

