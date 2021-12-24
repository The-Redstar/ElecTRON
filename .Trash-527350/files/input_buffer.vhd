library IEEE;
use IEEE.std_logic_1164.ALL;

entity input_buffer is
   port(clk    : in  std_logic;
        rst    : in  std_logic;
        dir_in  : in  std_logic_vector(3 downto 0);
        dir_out : out std_logic_vector(3 downto 0);
        start_in : in std_logic;
        start_out : out std_logic);
end input_buffer;

