library IEEE;
use IEEE.std_logic_1164.ALL;

entity counter8b is
   port(clk       : in  std_logic;
        rst       : in  std_logic;
        count_out : out std_logic_vector(7 downto 0));
end counter8b;
