library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of electron_tb is
   component electron
      port(clk           	  : in  std_logic;
           rst               : in  std_logic;
           direction_in      : in  std_logic_vector(3 downto 0);
           read_memory_in    : in  std_logic_vector(7 downto 0);
	   start_in		     : in  std_logic;
           color_out         : out std_logic_vector (3 downto 0);
   		h_sync_out		  : out std_logic;
   		v_sync_out		  : out std_logic;
           memory_enable_out : out std_logic;
           write_enable_out  : out std_logic;
           memory_reset_out  : out std_logic;
           x_increment_out   : out std_logic;
           y_increment_out   : out std_logic;
           w_increment_out   : out std_logic);
   end component;
   signal clk           	  : std_logic;
   signal rst               : std_logic;
   signal direction_in      : std_logic_vector(3 downto 0);
   signal read_memory_in    : std_logic_vector(7 downto 0);
   signal start_in			    : std_logic;
   signal color_out         : std_logic_vector (3 downto 0);
   signal h_sync_out		  : std_logic;
   signal v_sync_out		  : std_logic;
   signal memory_enable_out : std_logic;
   signal write_enable_out  : std_logic;
   signal memory_reset_out  : std_logic;
   signal x_increment_out   : std_logic;
   signal y_increment_out   : std_logic;
   signal w_increment_out   : std_logic;
begin
   test: electron port map (clk, rst, direction_in, read_memory_in, start_in, color_out, h_sync_out, v_sync_out, memory_enable_out, write_enable_out, memory_reset_out, x_increment_out, y_increment_out, w_increment_out);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;

   rst <= '1' after 0 ns,
	'0' after 200 ns;

   direction_in <= "0000" after 0 ns;

   read_memory_in <= "00000000" after 0 ns;

   start_in <= '0' after 0 ns;
end behaviour;

