library IEEE;
use IEEE.std_logic_1164.ALL;

entity test_data_gen is
   port(clk       : in  std_logic;
        reset     : in  std_logic;
        audio_clk : out std_logic;
        step_clk  : out std_logic);
end test_data_gen;

