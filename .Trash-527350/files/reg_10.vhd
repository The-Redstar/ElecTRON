library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg_10 is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        e     : in  std_logic;
        d     : in  std_logic_vector(9 downto 0);
        q     : out std_logic_vector(9 downto 0));
end reg_10;