library IEEE;
use IEEE.std_logic_1164.ALL;

entity electron is
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
end electron;

