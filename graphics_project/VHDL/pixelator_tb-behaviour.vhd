library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of pixelator_tb is
   component pixelator
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
   end component;
   signal dx            : std_logic_vector(3 downto 0);
   signal dy            : std_logic_vector(3 downto 0);
   signal player0_en    : std_logic;
   signal player1_en    : std_logic;
   signal player0_layer : std_logic;
   signal player1_layer : std_logic;
   signal player0_dir   : std_logic_vector(1 downto 0);
   signal player1_dir   : std_logic_vector(1 downto 0);
   signal player0_mode  : std_logic_vector(1 downto 0);
   signal player1_mode  : std_logic_vector(1 downto 0);
   signal borders       : std_logic_vector(7 downto 0);
   signal jumps         : std_logic_vector(7 downto 0);
   signal color         : std_logic_vector(3 downto 0);
begin
   test: pixelator port map (dx, dy, player0_en, player1_en, player0_layer, player1_layer, player0_dir, player1_dir, player0_mode, player1_mode, borders, jumps, color);
   dx(0) <= '0' after 0 ns;
   dx(1) <= '0' after 0 ns;
   dx(2) <= '0' after 0 ns;
   dx(3) <= '0' after 0 ns;
   dy(0) <= '0' after 0 ns;
   dy(1) <= '0' after 0 ns;
   dy(2) <= '0' after 0 ns;
   dy(3) <= '0' after 0 ns;
   player0_en <= '0' after 0 ns;
   player1_en <= '0' after 0 ns;
   player0_layer <= '0' after 0 ns;
   player1_layer <= '0' after 0 ns;
   player0_dir(0) <= '0' after 0 ns;
   player0_dir(1) <= '0' after 0 ns;
   player1_dir(0) <= '0' after 0 ns;
   player1_dir(1) <= '0' after 0 ns;
   player0_mode(0) <= '0' after 0 ns;
   player0_mode(1) <= '0' after 0 ns;
   player1_mode(0) <= '0' after 0 ns;
   player1_mode(1) <= '0' after 0 ns;
   borders(0) <= '0' after 0 ns;
   borders(1) <= '0' after 0 ns;
   borders(2) <= '0' after 0 ns;
   borders(3) <= '0' after 0 ns;
   borders(4) <= '0' after 0 ns;
   borders(5) <= '0' after 0 ns;
   borders(6) <= '0' after 0 ns;
   borders(7) <= '0' after 0 ns;
   jumps(0) <= '0' after 0 ns;
   jumps(1) <= '0' after 0 ns;
   jumps(2) <= '0' after 0 ns;
   jumps(3) <= '0' after 0 ns;
   jumps(4) <= '0' after 0 ns;
   jumps(5) <= '0' after 0 ns;
   jumps(6) <= '0' after 0 ns;
   jumps(7) <= '0' after 0 ns;
end behaviour;

