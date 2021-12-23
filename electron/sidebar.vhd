library IEEE;
use IEEE.std_logic_1164.ALL;

entity sidebar is
   port(x      : in  std_logic_vector(6 downto 0);
        y      : in  std_logic_vector(8 downto 0);
        player : in  std_logic;
        mode   : in  std_logic_vector(2 downto 0);
        ready  : in  std_logic;
        boost  : in  std_logic;
        dir    : in  std_logic_vector(1 downto 0);
        color  : out std_logic_vector(3 downto 0));
end sidebar;

