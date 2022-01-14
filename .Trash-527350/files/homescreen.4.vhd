library IEEE;
use IEEE.std_logic_1164.ALL;

entity homescreen is
   port(x         : in  std_logic_vector(8 downto 0);
        y         : in  std_logic_vector(8 downto 0);
        pixelator : in  std_logic_vector(3 downto 0);
		speed     : in  std_logic_vector(1 downto 0);
        color     : out std_logic_vector(3 downto 0));
end homescreen;
