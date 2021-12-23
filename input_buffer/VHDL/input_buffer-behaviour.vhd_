library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of input_buffer is
   component flip_flop
      port(clk    : in  std_logic;
           rst    : in  std_logic;
           input  : in  std_logic_vector(4 downto 0);
           output : out std_logic_vector(4 downto 0));
   end component;

   signal temp: std_logic_vector (4 downto 0);
begin
   ff1: flip_flop port map (clk => clk, rst => rst, input => input, output => temp);
   ff2: flip_flop port map (clk => clk, rst => rst, input => temp, output => output);
end behaviour;

