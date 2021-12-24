library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of color_bus is
begin

r(3 downto 2) <= color(3 downto 2); --orange for p1
r(1 downto 0) <= color(3 downto 2);
g(1 downto 0) <= color(3 downto 2);

b(3 downto 2) <= color(1 downto 0); --light blue for p2
b(1 downto 0) <= color(1 downto 0);
g(3 downto 2) <= color(1 downto 0);

--r(1 downto 0) <= "00"; --keep rest off I guess
--b(1 downto 0) <= "00";
--g(3 downto 0) <= "0000";



end behaviour;

