library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer_tb is
   component input_buffer
      port(clk    : in  std_logic;
           rst    : in  std_logic;
           input  : in  std_logic_vector(4 downto 0);
           output : out std_logic_vector(4 downto 0));
   end component;
   signal clk    : std_logic;
   signal rst    : std_logic;
   signal input  : std_logic_vector(4 downto 0);
   signal output : std_logic_vector(4 downto 0);
begin
   test: input_buffer port map (clk, rst, input, output);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
          '0' after 30 ns;
   input(0) <= '0' after 0 ns,
               '1' after 50 ns;
   input(1) <= '0' after 0 ns,
               '1' after 100 ns;
   input(2) <= '0' after 0 ns,
               '1' after 150 ns;
   input(3) <= '0' after 0 ns,
               '1' after 200 ns;
   input(4) <= '0' after 0 ns,
               '1' after 250 ns;
end behaviour;

