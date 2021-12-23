library IEEE;
use IEEE.std_logic_1164.ALL;

entity electron is
   port(clk           	  : in  std_logic;
        rst               : in  std_logic;
        direction_in      : in  std_logic_vector(3 downto 0);
        read_memory_in    : in  std_logic_vector(7 downto 0);
        vga_out           : out std_logic_vector(5 downto 0);
        memory_enable_out : out std_logic;
        write_enable_out  : out std_logic;
        memory_reset_out  : out std_logic;
        x_increment_out   : out std_logic;
        y_increment_out   : out std_logic;
        w_increment_out   : out std_logic);
end electron;

