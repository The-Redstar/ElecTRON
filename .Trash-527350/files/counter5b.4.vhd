library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter5b is
   port(clk       : in  std_logic;
        rst       : in  std_logic;
	incr      : in  std_logic;
        count_out : out std_logic_vector(4 downto 0));
end counter5b;

