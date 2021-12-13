library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of readwrite_tb is
   component readwrite
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
           cur_w	      : in std_logic_vector(7 downto 0);
           cur_x	      : in std_logic_vector(4 downto 0);
           cur_y	      : in std_logic_vector(4 downto 0);
           busy_in     : in std_logic);
   end component;
   signal clk	      : std_logic;
   signal we_in      : std_logic;
   signal we_mem     : std_logic;
   signal goto_in    : std_logic;
   signal me_mem     : std_logic;
   signal x_incr_mem  : std_logic;
   signal y_incr_mem  : std_logic;
   signal w_incr_mem  : std_logic;
   signal address_in : std_logic_vector(9 downto 0);
   signal write_in   : std_logic_vector(7 downto 0);
   signal ready_out  : std_logic;
   signal rst_in     : std_logic;
   signal rst_mem    : std_logic;
   signal cur_w	  : std_logic_vector(7 downto 0);
   signal cur_x	  : std_logic_vector(4 downto 0);
   signal cur_y	  : std_logic_vector(4 downto 0);
   signal busy_in : std_logic;
begin
   test: readwrite port map (clk, we_in, we_mem, goto_in, me_mem, x_incr_mem, y_incr_mem, w_incr_mem, address_in, write_in, ready_out, rst_in, rst_mem, cur_w, cur_x, cur_y, busy_in);
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
		'0' after 15 ns;

   counterX: process (x_incr_mem, rst_mem)
   begin
	if rst_mem = '1' then
	   cur_x <= "00000";
	elsif x_incr_mem = '1' then
	   cur_x <= std_logic_vector(to_unsigned(to_integer(unsigned(cur_x)) + 1,5));
	end if;
   end process;

   counterY: process (y_incr_mem, rst_mem)
   begin
	if rst_mem = '1' then
	   cur_y <= "00000";
	elsif y_incr_mem = '1' then
	   cur_y <= std_logic_vector(to_unsigned(to_integer(unsigned(cur_y)) + 1,5));
	end if;
   end process;

   counterW: process (w_incr_mem, rst_mem)
   begin
	if rst_mem = '1' then
	   cur_w <= "00000000";
	elsif w_incr_mem = '1' then
	   cur_w <= std_logic_vector(to_unsigned(to_integer(unsigned(cur_w)) + 1,8));
	end if;
   end process;

end behaviour;

