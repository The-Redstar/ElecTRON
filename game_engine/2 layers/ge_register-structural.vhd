library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of ge_register is
   component reg_8
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(7 downto 0);
           q     : out std_logic_vector(7 downto 0));
   end component;

   component reg_3
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(2 downto 0);
           q     : out std_logic_vector(2 downto 0));
   end component;

   component reg_2
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(1 downto 0);
           q     : out std_logic_vector(1 downto 0));
   end component;

   component reg_11
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(10 downto 0);
           q     : out std_logic_vector(10 downto 0));
   end component;

   component reg_1
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic;
           q     : out std_logic);
   end component;

   component reg_10
      port(clk   : in  std_logic;
           reset : in  std_logic;
           e     : in  std_logic;
           d     : in  std_logic_vector(9 downto 0);
           q     : out std_logic_vector(9 downto 0));
   end component;

begin

	pos0:reg_10 port map          ( clk  => clk,
					reset=> reset,
					e    => e_position_0,
					d    => d_position_0,
					q    => q_position_0);
	pos1:reg_10 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_position_1,
					d    => d_position_1,
					q    => q_position_1);
	layer_0:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_layer_0,
					d    => d_layer_0,
					q    => q_layer_0);
	layer_1:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_layer_1,
					d    => d_layer_1,
					q    => q_layer_1);
	n_layer_0:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_next_layer_0,
					d    => d_next_layer_0,
					q    => q_next_layer_0);
	n_layer_1:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_next_layer_1,
					d    => d_next_layer_1,
					q    => q_next_layer_1);
	border_0:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_border_0,
					d    => d_border_0,
					q    => q_border_0);
	border_1:reg_1 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_border_1,
					d    => d_border_1,
					q    => q_border_1);
	r_mem_0:reg_8 port map			     ( clk  => clk,
					reset=> reset,
					e    => e_read_mem,
					d    => d_read_mem,
					q    => q_read_mem);
	dir_0:reg_2 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_direction_0,
					d    => d_direction_0,
					q    => q_direction_0);
	dir_1:reg_2 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_direction_1,
					d    => d_direction_1,
					q    => q_direction_1);
	n_dir_0:reg_2 port map			     ( clk  => clk,
					reset=> reset,
					e    => e_next_dir_0,
					d    => d_next_dir_0,
					q    => q_next_dir_0);
	n_dir_1:reg_2 port map			     ( clk  => clk,
					reset=> reset,
					e    => e_next_dir_1,
					d    => d_next_dir_1,
					q    => q_next_dir_1);
	p_state_0:reg_2 port map			   ( clk  => clk,
					reset=> reset,
					e    => e_p_state_0,
					d    => d_p_state_0,
					q    => q_p_state_0);
	p_state_1:reg_2 port map			   ( clk  => clk,
					reset=> reset,
					e    => e_p_state_1,
					d    => d_p_state_1,
					q    => q_p_state_1);

end structural;

