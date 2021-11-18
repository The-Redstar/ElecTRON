library IEEE;
use IEEE.std_logic_1164.ALL;

entity graphics_top is
   port(clk    : in  std_logic;
        reset  : in  std_logic;
        h_sync : out std_logic;
        v_sync : out std_logic;
        colour : out std_logic);
end graphics_top;

