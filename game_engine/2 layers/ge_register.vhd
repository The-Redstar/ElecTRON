library IEEE;
use IEEE.std_logic_1164.ALL;

entity ge_register is
   port(clk, reset		  : in	 std_logic;	
		e_position_0  : in  std_logic;
        e_position_1  : in  std_logic;
        d_position_0  : in  std_logic_vector(9 downto 0);
        d_position_1  : in  std_logic_vector(9 downto 0);
		e_layer_0	  : in  std_logic;		
		e_layer_1	  : in  std_logic;
		d_layer_0	  : in  std_logic;
		d_layer_1	  : in  std_logic;
		e_next_layer_0: in  std_logic;
		e_next_layer_1: in  std_logic;
		d_next_layer_0: in  std_logic;
		d_next_layer_1: in  std_logic;
		e_border_0	  : in  std_logic;
		e_border_1	  : in  std_logic;
		d_border_0	  : in  std_logic;
		d_border_1	  : in  std_logic;
        e_read_mem    : in  std_logic;
        d_read_mem    : in  std_logic_vector(7 downto 0);
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
        q_position_0  : out std_logic_vector(9 downto 0);
        q_position_1  : out std_logic_vector(9 downto 0);
		q_layer_0	  : out std_logic;
		q_layer_1	  : out std_logic;
		q_next_layer_0: out std_logic;
		q_next_layer_1: out std_logic;
		q_border_0	  : out std_logic;
		q_border_1	  : out std_logic;
        q_read_mem    : out std_logic_vector(7 downto 0);
        q_direction_0 : out std_logic_vector(1 downto 0);
        q_direction_1 : out std_logic_vector(1 downto 0);
        q_next_dir_0  : out std_logic_vector(1 downto 0);
        q_next_dir_1  : out std_logic_vector(1 downto 0);
        q_p_state_0   : out std_logic_vector(1 downto 0);
        q_p_state_1   : out std_logic_vector(1 downto 0));
end ge_register;
