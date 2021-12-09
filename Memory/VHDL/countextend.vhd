library IEEE;
use IEEE.std_logic_1164.ALL;

entity countextend is
   port(clk      : in  std_logic;
        rst      : in  std_logic;
        incr_in  : in  std_logic;
        incr_out : out std_logic);
end countextend;

