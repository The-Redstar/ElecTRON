library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of electron_tb is
   component electron
      port(clk           	   : in  std_logic;
           rst               : in  std_logic;
   	test_button		  : in  std_logic;
           read_memory_in_0  : in  std_logic;
   	read_memory_in_1  : in  std_logic;
   	read_memory_in_2  : in  std_logic;
   	read_memory_in_3  : in  std_logic;
   	read_memory_in_4  : in  std_logic;
   	read_memory_in_5  : in  std_logic;
   	read_memory_in_6  : in  std_logic;
   	read_memory_in_7  : in  std_logic;
           direction_in_0    : in  std_logic;
   	direction_in_1	   : in  std_logic;
   	direction_in_2		  : in  std_logic;
   	direction_in_3	   : in  std_logic;
   	start_in		  : in  std_logic;
   	h_sync_out		  : out std_logic;
   	v_sync_out		  : out std_logic;
   	busy_out		  : out std_logic;
           x_increment_out   : out std_logic;
           y_increment_out   : out std_logic;
           w_increment_out   : out std_logic;
           memory_reset_out  : out std_logic;
           memory_enable_out : out std_logic;
           write_enable_out  : out std_logic;
   	audio_out_0		  : out std_logic;
   	audio_out_1		  : out std_logic;
           color_out_0       : out std_logic;
   	color_out_1		  : out std_logic;
   	color_out_2		  : out std_logic;
   	color_out_3       : out std_logic);
   end component;
   signal clk           	   : std_logic;
   signal rst               : std_logic;
   signal test_button		  : std_logic;
   signal read_memory_in_0  : std_logic;
   signal read_memory_in_1  : std_logic;
   signal read_memory_in_2  : std_logic;
   signal read_memory_in_3  : std_logic;
   signal read_memory_in_4  : std_logic;
   signal read_memory_in_5  : std_logic;
   signal read_memory_in_6  : std_logic;
   signal read_memory_in_7  : std_logic;
   signal direction_in_0    : std_logic;
   signal direction_in_1	   : std_logic;
   signal direction_in_2		  : std_logic;
   signal direction_in_3	   : std_logic;
   signal start_in		  : std_logic;
   signal h_sync_out		  : std_logic;
   signal v_sync_out		  : std_logic;
   signal busy_out		  : std_logic;
   signal x_increment_out   : std_logic;
   signal y_increment_out   : std_logic;
   signal w_increment_out   : std_logic;
   signal memory_reset_out  : std_logic;
   signal memory_enable_out : std_logic;
   signal write_enable_out  : std_logic;
   signal audio_out_0		  : std_logic;
   signal audio_out_1		  : std_logic;
   signal color_out_0       : std_logic;
   signal color_out_1		  : std_logic;
   signal color_out_2		  : std_logic;
   signal color_out_3       : std_logic;
begin
   test: electron port map (clk, rst, test_button, read_memory_in_0, read_memory_in_1, read_memory_in_2, read_memory_in_3, read_memory_in_4, read_memory_in_5, read_memory_in_6, read_memory_in_7, direction_in_0, direction_in_1, direction_in_2, direction_in_3, start_in, h_sync_out, v_sync_out, busy_out, x_increment_out, y_increment_out, w_increment_out, memory_reset_out, memory_enable_out, write_enable_out, audio_out_0, audio_out_1, color_out_0, color_out_1, color_out_2, color_out_3);

   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;

   rst <= '1' after 0 ns,
	'0' after 200 ns;

   test_button <= '0' after 0 ns;

   read_memory_in_0 <= '0' after 0 ns;
   read_memory_in_1 <= '0' after 0 ns;
   read_memory_in_2 <= '0' after 0 ns;
   read_memory_in_3 <= '0' after 0 ns;
   read_memory_in_4 <= '0' after 0 ns;
   read_memory_in_5 <= '0' after 0 ns;
   read_memory_in_6 <= '0' after 0 ns;
   read_memory_in_7 <= '0' after 0 ns;

   direction_in_0 <= '0' after 0 ns;
   direction_in_1 <= '0' after 0 ns;
   direction_in_2 <= '0' after 0 ns;
   direction_in_3 <= '0' after 0 ns;

   start_in <= '0' after 0 ns;
end behaviour;

