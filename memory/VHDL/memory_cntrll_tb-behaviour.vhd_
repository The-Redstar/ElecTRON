library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memory_cntrll_tb is
   component memory_cntrll
      port(read_mem    : in  std_logic_vector(7 downto 0);
           clk  	      : in std_logic;
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
   end component;
   signal read_mem   : std_logic_vector(7 downto 0);
   signal clk  	      : std_logic;
   signal x_incr_mem  : std_logic;
   signal y_incr_mem  : std_logic;
   signal w_incr_mem  : std_logic;
   signal rst_mem     : std_logic;
   signal we_mem      : std_logic;
   signal me_mem      : std_logic;
   signal read_out    : std_logic_vector(7 downto 0);
   signal write_in    : std_logic_vector(7 downto 0);
   signal we_in       : std_logic;
   signal address_in  : std_logic_vector(9 downto 0);
   signal goto_in     : std_logic;
   signal rst_in      : std_logic;
   signal clr_in      : std_logic;
   signal x_incr_in   : std_logic;
   signal y_incr_in   : std_logic;
   signal ready_out   : std_logic;
   signal cur_x_out   : std_logic_vector(4 downto 0);
   signal cur_y_out   : std_logic_vector(4 downto 0);
   signal rst_vga		   : std_logic;
begin
   test: memory_cntrll port map (read_mem, clk, x_incr_mem, y_incr_mem, w_incr_mem, rst_mem, we_mem, me_mem, read_out, write_in, we_in, address_in, goto_in, rst_in, clr_in, x_incr_in	, y_incr_in, ready_out, cur_x_out, cur_y_out, rst_vga);
   read_mem(0) <= '0' after 0 ns;
   read_mem(1) <= '0' after 0 ns;
   read_mem(2) <= '0' after 0 ns;
   read_mem(3) <= '0' after 0 ns;
   read_mem(4) <= '0' after 0 ns;
   read_mem(5) <= '0' after 0 ns;
   read_mem(6) <= '0' after 0 ns;
   read_mem(7) <= '0' after 0 ns;
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   we_in <= '0' after 0 ns,
	     '1' after 2000 ns;
   goto_in <= '0' after 0 ns,
		 '1' after 55 ns,
		 '0' after 95 ns,
		 '1' after 2000 ns,
		 '0' after 2040 ns;
   address_in(0) <= '0' after 0 ns,
			 '1' after 55 ns;
   address_in(1) <= '0' after 0 ns,
			 '1' after 2040 ns;
   address_in(2) <= '0' after 0 ns,
			 '1' after 55 ns;
   address_in(3) <= '0' after 0 ns,
			 '1' after 2040 ns;
   address_in(4) <= '0' after 0 ns,
			 '1' after 2040 ns;
   address_in(5) <= '0' after 0 ns,
			 '1' after 2040 ns;
   address_in(6) <= '0' after 0 ns,
			 '1' after 55 ns;
   address_in(7) <= '0' after 0 ns,
			 '1' after 2040 ns;
   address_in(8) <= '0' after 0 ns,
			 '1' after 55 ns;
   address_in(9) <= '0' after 0 ns,
			 '1' after 2040 ns;
   write_in(0) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(1) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(2) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(3) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(4) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(5) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(6) <= '0' after 0 ns,
		     '1' after 2040 ns;
   write_in(7) <= '0' after 0 ns,
		     '1' after 2040 ns;
   rst_in <= '1' after 0 ns,
		'0' after 30 ns;
   clr_in <= '0' after 0 ns,
		'1' after 51010 ns,
		'0' after 51050 ns;
   x_incr_in <= '0' after 0 ns,
		  '1' after 50090 ns,
		  '0' after 50130 ns;
   y_incr_in <= '0' after 0 ns,
		  '1' after 50050 ns,
		  '0' after 50090 ns;
   rst_vga <= '0' after 0 ns,
		 '1' after 50010 ns,
		 '0' after 50050 ns;
end behaviour;

