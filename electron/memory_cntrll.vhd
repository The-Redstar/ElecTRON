library IEEE;
use IEEE.std_logic_1164.ALL;

entity memory_cntrll is
   port(read_mem    : in  std_logic_vector(7 downto 0);
        clk         : in std_logic;
        x_incr_mem  : out std_logic;
        y_incr_mem  : out std_logic;
        w_incr_mem  : out std_logic;
        rst_mem     : out std_logic;
        we_mem      : out std_logic;
        me_mem      : out std_logic;
        read_out    : out std_logic_vector(7 downto 0);
        write_in    : in  std_logic_vector(7 downto 0);
        we_in       : in  std_logic;
        address_in  : in  std_logic_vector(9 downto 0);
        goto_in     : in  std_logic;
        rst_in      : in  std_logic;
        clr_in      : in  std_logic;
        x_incr_in   : in  std_logic;
        y_incr_in   : in  std_logic;
        ready_out   : out std_logic;
        cur_x_out   : out std_logic_vector(4 downto 0);
        cur_y_out   : out std_logic_vector(4 downto 0);
        rst_vga	    : in  std_logic);
end memory_cntrll;

