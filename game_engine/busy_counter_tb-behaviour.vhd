library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of busy_counter_tb is
   component busy_counter
      port(clk               : in  std_logic;
           global_reset 			  : in  std_logic;
   	   game_engine_reset : in  std_logic;
           busy              : in  std_logic;
           busy_count        : out std_logic_vector(4 downto 0));
   end component;
   signal clk               : std_logic;
   signal global_reset 			  : std_logic;
   signal game_engine_reset : std_logic;
   signal busy              : std_logic;
   signal busy_count        : std_logic_vector(4 downto 0);
begin
   test: busy_counter port map (clk, global_reset, game_engine_reset, busy, busy_count);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   global_reset <= 			'1' after 0 ns,
			'0' after 45 ns;
   game_engine_reset <= '0' after 0 ns,
			'1' after 10005 ns;
   busy <= '0' after 0 ns,
	   '1' after 505 ns when busy /= '1' else '0' after 505 ns;
end behaviour;

