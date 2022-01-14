library IEEE;
use IEEE.std_logic_1164.ALL;

entity grid_top is
   port(map_select : in  std_logic_vector(1 downto 0);
        x_addr     : in  std_logic_vector(4 downto 0);
        y_addr     : in  std_logic_vector(4 downto 0);
        jumps      : out std_logic_vector(7 downto 0);
        borders    : out std_logic_vector(7 downto 0);
        player0_start_pos : out std_logic_vector(10 downto 0);
        player1_start_pos : out std_logic_vector(10 downto 0);
        player0_start_dir : out std_logic_vector(1 downto 0);
        player1_start_dir : out std_logic_vector(1 downto 0));
end grid_top;

