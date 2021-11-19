library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of wall_decoder_tb is
   component wall_decoder
      port(encoded : in  std_logic_vector(2 downto 0);
           north   : out std_logic;
           east    : out std_logic;
           south   : out std_logic;
           west    : out std_logic);
   end component;
   signal encoded : std_logic_vector(2 downto 0);
   signal north   : std_logic;
   signal east    : std_logic;
   signal south   : std_logic;
   signal west    : std_logic;
begin
   test: wall_decoder port map (encoded, north, east, south, west);
   encoded(0) <= '0' after 0 ns;
   encoded(1) <= '0' after 0 ns;
   encoded(2) <= '0' after 0 ns;
end behaviour;

