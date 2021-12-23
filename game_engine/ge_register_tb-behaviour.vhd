library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of ge_register_tb is
   component ge_register
      port(clk, reset		  : in	 std_logic;	
   	e_position_0  : in  std_logic;
           e_position_1  : in  std_logic;
           d_position_0  : in  std_logic_vector(10 downto 0);
           d_position_1  : in  std_logic_vector(10 downto 0);
           e_wallshape_0 : in  std_logic;
           e_wallshape_1 : in  std_logic;
           d_wallshape_0 : in  std_logic_vector(2 downto 0);
           d_wallshape_1 : in  std_logic_vector(2 downto 0);
           e_read_mem_0  : in  std_logic;
           e_read_mem_1  : in  std_logic;
           d_read_mem_0  : in  std_logic_vector(7 downto 0);
           d_read_mem_1  : in  std_logic_vector(7 downto 0);
           e_next_pos_0  : in  std_logic;
           e_next_pos_1  : in  std_logic;
           d_next_pos_0  : in  std_logic_vector(10 downto 0);
           d_next_pos_1  : in  std_logic_vector(10 downto 0);
           e_direction_0 : in  std_logic;
           e_direction_1 : in  std_logic;
           d_direction_0 : in  std_logic_vector(1 downto 0);
           d_direction_1 : in  std_logic_vector(1 downto 0);
           e_next_dir_0  : in  std_logic;
           e_next_dir_1  : in  std_logic;
           d_next_dir_0  : in  std_logic_vector(1 downto 0);
           d_next_dir_1  : in  std_logic_vector(1 downto 0);
           e_p_state_0   : in  std_logic;
           e_p_state_1   : in  std_logic;
           d_p_state_0   : in  std_logic_vector(1 downto 0);
           d_p_state_1   : in  std_logic_vector(1 downto 0);
           q_position_0  : out std_logic_vector(10 downto 0);
           q_position_1  : out std_logic_vector(10 downto 0);
           q_wallshape_0 : out std_logic_vector(2 downto 0);
           q_wallshape_1 : out std_logic_vector(2 downto 0);
           q_read_mem_0  : out std_logic_vector(7 downto 0);
           q_read_mem_1  : out std_logic_vector(7 downto 0);
           q_next_pos_0  : out std_logic_vector(10 downto 0);
           q_next_pos_1  : out std_logic_vector(10 downto 0);
           q_direction_0 : out std_logic_vector(1 downto 0);
           q_direction_1 : out std_logic_vector(1 downto 0);
           q_next_dir_0  : out std_logic_vector(1 downto 0);
           q_next_dir_1  : out std_logic_vector(1 downto 0);
           q_p_state_0   : out std_logic_vector(1 downto 0);
           q_p_state_1   : out std_logic_vector(1 downto 0));
   end component;
   signal clk, reset		  : std_logic;
   signal e_position_0  : std_logic;
   signal e_position_1  : std_logic;
   signal d_position_0  : std_logic_vector(10 downto 0);
   signal d_position_1  : std_logic_vector(10 downto 0);
   signal e_wallshape_0 : std_logic;
   signal e_wallshape_1 : std_logic;
   signal d_wallshape_0 : std_logic_vector(2 downto 0);
   signal d_wallshape_1 : std_logic_vector(2 downto 0);
   signal e_read_mem_0  : std_logic;
   signal e_read_mem_1  : std_logic;
   signal d_read_mem_0  : std_logic_vector(7 downto 0);
   signal d_read_mem_1  : std_logic_vector(7 downto 0);
   signal e_next_pos_0  : std_logic;
   signal e_next_pos_1  : std_logic;
   signal d_next_pos_0  : std_logic_vector(10 downto 0);
   signal d_next_pos_1  : std_logic_vector(10 downto 0);
   signal e_direction_0 : std_logic;
   signal e_direction_1 : std_logic;
   signal d_direction_0 : std_logic_vector(1 downto 0);
   signal d_direction_1 : std_logic_vector(1 downto 0);
   signal e_next_dir_0  : std_logic;
   signal e_next_dir_1  : std_logic;
   signal d_next_dir_0  : std_logic_vector(1 downto 0);
   signal d_next_dir_1  : std_logic_vector(1 downto 0);
   signal e_p_state_0   : std_logic;
   signal e_p_state_1   : std_logic;
   signal d_p_state_0   : std_logic_vector(1 downto 0);
   signal d_p_state_1   : std_logic_vector(1 downto 0);
   signal q_position_0  : std_logic_vector(10 downto 0);
   signal q_position_1  : std_logic_vector(10 downto 0);
   signal q_wallshape_0 : std_logic_vector(2 downto 0);
   signal q_wallshape_1 : std_logic_vector(2 downto 0);
   signal q_read_mem_0  : std_logic_vector(7 downto 0);
   signal q_read_mem_1  : std_logic_vector(7 downto 0);
   signal q_next_pos_0  : std_logic_vector(10 downto 0);
   signal q_next_pos_1  : std_logic_vector(10 downto 0);
   signal q_direction_0 : std_logic_vector(1 downto 0);
   signal q_direction_1 : std_logic_vector(1 downto 0);
   signal q_next_dir_0  : std_logic_vector(1 downto 0);
   signal q_next_dir_1  : std_logic_vector(1 downto 0);
   signal q_p_state_0   : std_logic_vector(1 downto 0);
   signal q_p_state_1   : std_logic_vector(1 downto 0);
begin
   test: ge_register port map (clk, reset, e_position_0, e_position_1, d_position_0, d_position_1, e_wallshape_0, e_wallshape_1, d_wallshape_0, d_wallshape_1, e_read_mem_0, e_read_mem_1, d_read_mem_0, d_read_mem_1, e_next_pos_0, e_next_pos_1, d_next_pos_0, d_next_pos_1, e_direction_0, e_direction_1, d_direction_0, d_direction_1, e_next_dir_0, e_next_dir_1, d_next_dir_0, d_next_dir_1, e_p_state_0, e_p_state_1, d_p_state_0, d_p_state_1, q_position_0, q_position_1, q_wallshape_0, q_wallshape_1, q_read_mem_0, q_read_mem_1, q_next_pos_0, q_next_pos_1, q_direction_0, q_direction_1, q_next_dir_0, q_next_dir_1, q_p_state_0, q_p_state_1);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   e_position_0 <= '0' after 0 ns, '1' after 100 ns, '0' after 140 ns;
   e_position_1 <= '0' after 0 ns, '1' after 200 ns, '0' after 240 ns;
   d_position_0(0) <= '1' after 0 ns;
   d_position_0(1) <= '0' after 0 ns;
   d_position_0(2) <= '0' after 0 ns;
   d_position_0(3) <= '0' after 0 ns;
   d_position_0(4) <= '0' after 0 ns;
   d_position_0(5) <= '0' after 0 ns;
   d_position_0(6) <= '0' after 0 ns;
   d_position_0(7) <= '0' after 0 ns;
   d_position_0(8) <= '0' after 0 ns;
   d_position_0(9) <= '0' after 0 ns;
   d_position_0(10) <= '0' after 0 ns;
   d_position_1(0) <= '1' after 0 ns;
   d_position_1(1) <= '0' after 0 ns;
   d_position_1(2) <= '0' after 0 ns;
   d_position_1(3) <= '0' after 0 ns;
   d_position_1(4) <= '0' after 0 ns;
   d_position_1(5) <= '0' after 0 ns;
   d_position_1(6) <= '0' after 0 ns;
   d_position_1(7) <= '0' after 0 ns;
   d_position_1(8) <= '0' after 0 ns;
   d_position_1(9) <= '0' after 0 ns;
   d_position_1(10) <= '0' after 0 ns;
   e_wallshape_0 <= '0' after 0 ns, '1' after 300 ns, '0' after 340 ns;
   e_wallshape_1 <= '0' after 0 ns, '1' after 400 ns, '0' after 440 ns;
   d_wallshape_0(0) <= '1' after 0 ns;
   d_wallshape_0(1) <= '0' after 0 ns;
   d_wallshape_0(2) <= '0' after 0 ns;
   d_wallshape_1(0) <= '1' after 0 ns;
   d_wallshape_1(1) <= '0' after 0 ns;
   d_wallshape_1(2) <= '0' after 0 ns;
   e_read_mem_0 <= '0' after 0 ns, '1' after 500 ns, '0' after 540 ns;
   e_read_mem_1 <= '0' after 0 ns, '1' after 600 ns, '0' after 640 ns;
   d_read_mem_0(0) <= '1' after 0 ns;
   d_read_mem_0(1) <= '0' after 0 ns;
   d_read_mem_0(2) <= '0' after 0 ns;
   d_read_mem_0(3) <= '0' after 0 ns;
   d_read_mem_0(4) <= '0' after 0 ns;
   d_read_mem_0(5) <= '0' after 0 ns;
   d_read_mem_0(6) <= '0' after 0 ns;
   d_read_mem_0(7) <= '0' after 0 ns;
   d_read_mem_1(0) <= '1' after 0 ns;
   d_read_mem_1(1) <= '0' after 0 ns;
   d_read_mem_1(2) <= '0' after 0 ns;
   d_read_mem_1(3) <= '0' after 0 ns;
   d_read_mem_1(4) <= '0' after 0 ns;
   d_read_mem_1(5) <= '0' after 0 ns;
   d_read_mem_1(6) <= '0' after 0 ns;
   d_read_mem_1(7) <= '0' after 0 ns;
   e_next_pos_0 <= '0' after 0 ns, '1' after 700 ns, '0' after 740 ns;
   e_next_pos_1 <= '0' after 0 ns, '1' after 800 ns, '0' after 840 ns;
   d_next_pos_0(0) <= '1' after 0 ns;
   d_next_pos_0(1) <= '0' after 0 ns;
   d_next_pos_0(2) <= '0' after 0 ns;
   d_next_pos_0(3) <= '0' after 0 ns;
   d_next_pos_0(4) <= '0' after 0 ns;
   d_next_pos_0(5) <= '0' after 0 ns;
   d_next_pos_0(6) <= '0' after 0 ns;
   d_next_pos_0(7) <= '0' after 0 ns;
   d_next_pos_0(8) <= '0' after 0 ns;
   d_next_pos_0(9) <= '0' after 0 ns;
   d_next_pos_0(10) <= '0' after 0 ns;
   d_next_pos_1(0) <= '1' after 0 ns;
   d_next_pos_1(1) <= '0' after 0 ns;
   d_next_pos_1(2) <= '0' after 0 ns;
   d_next_pos_1(3) <= '0' after 0 ns;
   d_next_pos_1(4) <= '0' after 0 ns;
   d_next_pos_1(5) <= '0' after 0 ns;
   d_next_pos_1(6) <= '0' after 0 ns;
   d_next_pos_1(7) <= '0' after 0 ns;
   d_next_pos_1(8) <= '0' after 0 ns;
   d_next_pos_1(9) <= '0' after 0 ns;
   d_next_pos_1(10) <= '0' after 0 ns;
   e_direction_0 <= '0' after 0 ns, '1' after 900 ns, '0' after 940 ns;
   e_direction_1 <= '0' after 0 ns, '1' after 1000 ns, '0' after 1040 ns;
   d_direction_0(0) <= '1' after 0 ns;
   d_direction_0(1) <= '0' after 0 ns;
   d_direction_1(0) <= '1' after 0 ns;
   d_direction_1(1) <= '0' after 0 ns;
   e_next_dir_0 <= '0' after 0 ns, '1' after 1100 ns, '0' after 1140 ns;
   e_next_dir_1 <= '0' after 0 ns, '1' after 1200 ns, '0' after 1240 ns;
   d_next_dir_0(0) <= '1' after 0 ns;
   d_next_dir_0(1) <= '0' after 0 ns;
   d_next_dir_1(0) <= '1' after 0 ns;
   d_next_dir_1(1) <= '0' after 0 ns;
   e_p_state_0 <= '0' after 0 ns, '1' after 1300 ns, '0' after 1340 ns;
   e_p_state_1 <= '0' after 0 ns, '1' after 1400 ns, '0' after 1440 ns;
   d_p_state_0(0) <= '1' after 0 ns;
   d_p_state_0(1) <= '0' after 0 ns;
   d_p_state_1(0) <= '1' after 0 ns;
   d_p_state_1(1) <= '0' after 0 ns;
end behaviour;

