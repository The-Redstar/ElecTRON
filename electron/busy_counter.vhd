--second layer
library IEEE;
use IEEE.std_logic_1164.ALL;

entity busy_counter is
   port(clk               : in  std_logic;
        global_reset 	  : in  std_logic;
		game_engine_reset : in  std_logic;
        busy              : in  std_logic;
        busy_count        : out std_logic_vector(6 downto 0));
end busy_counter;