library IEEE;
use IEEE.std_logic_1164.ALL;

entity readwrite is
   port(clk	        : in  std_logic;
        we_in       : in  std_logic;
        we_mem      : out std_logic;
        goto_in     : in  std_logic;
        me_mem      : out std_logic;
        x_incr_mem  : out std_logic;
        y_incr_mem  : out std_logic;
        w_incr_mem  : out std_logic;
        address_in  : in  std_logic_vector(9 downto 0);
        write_in    : in  std_logic_vector(7 downto 0);
        ready_out   : out std_logic;
        rst_in      : in  std_logic;
        rst_mem     : out std_logic;
        cur_w       : in std_logic_vector(7 downto 0);
        cur_x       : in std_logic_vector(4 downto 0);
        cur_y       : in std_logic_vector(4 downto 0);
        busy_in     : in std_logic);
end readwrite;

