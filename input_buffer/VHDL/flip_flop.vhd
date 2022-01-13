library IEEE;
use IEEE.std_logic_1164.ALL;

entity flip_flop is
   port(clk    : in  std_logic;
        rst    : in  std_logic;
        input  : in  std_logic_vector(4 downto 0);
        output : out std_logic_vector(4 downto 0));
end flip_flop;
