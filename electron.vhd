library IEEE;
use IEEE.std_logic_1164.ALL;

entity electron is
   port(clk           : in  std_logic;
        rst           : in  std_logic;
        direction     : in  std_logic_vector(3 downto 0);
        read          : in  std_logic_vector(7 downto 0);
        vga           : out std_logic_vector(5 downto 0);
        memory_enable : out std_logic;
        write_enable  : out std_logic;
        memory_reset  : out std_logic;
        x_increment   : out std_logic;
        y_increment   : out std_logic;
        w_increment   : out std_logic);
end electron;

