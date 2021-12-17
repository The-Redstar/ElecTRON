library IEEE;
use IEEE.std_logic_1164.ALL;

entity reg_1 is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        e     : in  std_logic;
        d     : in  std_logic;
        q     : out std_logic);
end reg_1;