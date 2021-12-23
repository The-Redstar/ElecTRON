library IEEE;
use IEEE.std_logic_1164.ALL;

entity test_data_gen is
   port(clk           : in  std_logic;
        rst           : in  std_logic;
        x_incr        : in  std_logic;
        y_incr        : in  std_logic;
        mem_rst       : in  std_logic;
        data          : out std_logic_vector(7 downto 0);
        borders       : out std_logic_vector(7 downto 0);
        jumps         : out std_logic_vector(7 downto 0);
        player0_pos   : out std_logic_vector(10 downto 0);
        player1_pos   : out std_logic_vector(10 downto 0);
        player0_dir   : out std_logic_vector(1 downto 0);
        player1_dir   : out std_logic_vector(1 downto 0);
        player0_state : out std_logic_vector(1 downto 0);
        player1_state : out std_logic_vector(1 downto 0);
        game_state    : out std_logic_vector(2 downto 0);
        current_x     : out std_logic_vector(4 downto 0);
        current_y     : out std_logic_vector(4 downto 0)
	);
end test_data_gen;

