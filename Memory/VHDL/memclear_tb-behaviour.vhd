library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of memclear_tb is
   component memclear
      port(clk        : in  std_logic;
           rst        : in  std_logic;
           clear_mem  : in  std_logic;
           x_incr_mem : out std_logic;
           y_incr_mem : out std_logic;
           rst_mem    : out std_logic;
           we_mem     : out std_logic;
           me_mem     : out std_logic;
           ready_out  : out std_logic;
           cur_x	     : in std_logic_vector(4 downto 0);
           cur_y	     : in std_logic_vector(4 downto 0);
           busy_in    : in std_logic);
   end component;

   component counter5b
      port(clk       : in  std_logic;
           rst       : in  std_logic;
           count_out : out std_logic_vector(4 downto 0));
   end component;

   signal clk        : std_logic;
   signal rst        : std_logic;
   signal clear_mem  : std_logic;
   signal x_incr_mem : std_logic;
   signal y_incr_mem : std_logic;
   signal rst_mem    : std_logic;
   signal we_mem     : std_logic;
   signal me_mem     : std_logic;
   signal ready_out  : std_logic;
   signal cur_x	     : std_logic_vector(4 downto 0);
   signal cur_y	     : std_logic_vector(4 downto 0);
   signal busy_in    : std_logic;
begin
   test: memclear port map (clk, rst, clear_mem, x_incr_mem, y_incr_mem, rst_mem, we_mem, me_mem, ready_out, cur_x, cur_y, busy_in);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
	  '0' after 25 ns;
   clear_mem <= '0' after 0 ns,
	       '1' after 50 ns,
	       '0' after 90 ns;
   counter_x: counter5b port map (x_incr_mem, rst_mem, cur_x);

   counter_y: counter5b port map (y_incr_mem, rst_mem, cur_y);
end behaviour;
