library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer_tb is
   component input_buffer
      port(clk    : in  std_logic;
           rst    : in  std_logic;
           dir_in  : in  std_logic_vector(3 downto 0);
           dir_out : out std_logic_vector(3 downto 0);
           start_in : in std_logic;
           start_out : out std_logic);
   end component;
   signal clk    : std_logic;
   signal rst    : std_logic;
   signal dir_in  : std_logic_vector(3 downto 0);
   signal dir_out : std_logic_vector(3 downto 0);
   signal start_in : std_logic;
   signal start_out : std_logic;
begin
   test: input_buffer port map (clk, rst, dir_in, dir_out, start_in, start_out);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
	'0' after 70 ns;
   dir_in <= "1101" after 0 ns,
		"0010" after 150 ns;
   start_in <= '0' after 0 ns,
		'1' after 230 ns;
end behaviour;

