library IEEE;
use IEEE.std_logic_1164.ALL;

entity color_bus is
   port(color : in  std_logic_vector(3 downto 0);
        r     : out std_logic_vector(3 downto 0);
        g     : out std_logic_vector(3 downto 0);
        b     : out std_logic_vector(3 downto 0));
end color_bus;

