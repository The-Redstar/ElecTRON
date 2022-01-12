library IEEE;
use IEEE.std_logic_1164.ALL;

entity wall_decoder is
   port(encoded : in  std_logic_vector(2 downto 0);
        north   : out std_logic;
        east    : out std_logic;
        south   : out std_logic;
        west    : out std_logic);
end wall_decoder;

