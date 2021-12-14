library IEEE;
use IEEE.std_logic_1164.ALL;

entity memclear is
   port(clk        : in  std_logic;
        rst        : in  std_logic;
        clear_mem  : in  std_logic;
        x_incr_mem : out std_logic;
        y_incr_mem : out std_logic;
        rst_mem    : out std_logic;
        we_mem     : out std_logic;
        me_mem     : out std_logic;
        ready_out  : out std_logic;
        cur_x      : in std_logic_vector(4 downto 0);
        cur_y      : in std_logic_vector(4 downto 0);
        busy_in    : in std_logic);
end memclear;

