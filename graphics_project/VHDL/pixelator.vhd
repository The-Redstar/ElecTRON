library IEEE;
use IEEE.std_logic_1164.ALL;

entity pixelator is
   port(dx            : in  std_logic_vector(3 downto 0);
        dy            : in  std_logic_vector(3 downto 0);
        player0_en    : in  std_logic;
        player1_en    : in  std_logic;
        player0_layer : in  std_logic;
        player1_layer : in  std_logic;
        player0_dir   : in  std_logic_vector(1 downto 0);
        player1_dir   : in  std_logic_vector(1 downto 0);
        player0_mode  : in  std_logic_vector(1 downto 0);
        player1_mode  : in  std_logic_vector(1 downto 0);
        borders       : in  std_logic_vector(7 downto 0);
        jumps         : in  std_logic_vector(7 downto 0);
        color         : out std_logic_vector(3 downto 0));
end pixelator;

