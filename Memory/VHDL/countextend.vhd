library IEEE;
use IEEE.std_logic_1164.ALL;

entity countextend is
   port(clk     : in  std_logic;
	  rst	    : in  std_logic;
        incrIN  : in  std_logic;
        incrOUT : out std_logic);
end countextend;

