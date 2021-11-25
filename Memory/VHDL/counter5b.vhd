library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter5b is
   port(incr     : in  std_logic;
        rst      : in  std_logic;
        clk      : in  std_logic;
        countOUT : out std_logic_vector(4 downto 0));
end counter5b;

