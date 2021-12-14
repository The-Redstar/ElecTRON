library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity game_engine is
   port(clk                : in  std_logic;
        reset              : in  std_logic;
        input              : in  std_logic_vector(3 downto 0);
        busy               : in  std_logic;
		--memory in
        read_memory        : in  std_logic_vector(7 downto 0);
        memory_ready       : in  std_logic;
		border		       : in  std_logic_vector(7 downto 0);
		ramp		       : in  std_logic_vector(7 downto 0);
		--vga_out
        state_vga          : out std_logic_vector(2 downto 0);
        position_0_vga     : out std_logic_vector(10 downto 0);
        position_1_vga     : out std_logic_vector(10 downto 0);
        direction_0_vga    : out std_logic_vector(1 downto 0);
        direction_1_vga    : out std_logic_vector(1 downto 0);
        player_state_0_vga : out std_logic_vector(1 downto 0);
        player_state_1_vga : out std_logic_vector(1 downto 0);
		--memory signals
		go_to	           : out std_logic;
		clear_memory       : out std_logic);
        write_enable       : out std_logic;
        write_memory       : out std_logic_vector(7 downto 0);
        address            : out std_logic_vector(9 downto 0);
end game_engine;