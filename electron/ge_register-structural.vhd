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

begin

	pos0:reg_11 port map          ( clk  => clk,
					reset=> reset,
					e    => e_position_0,
					d    => d_position_0,
					q    => q_position_0);
	pos1:reg_11 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_position_1,
					d    => d_position_1,
					q    => q_position_1); 
	next_pos0:reg_11 port map			  ( clk  => clk,
					reset=> reset,
					e    => e_next_pos_0,
					d    => d_next_pos_0,
					q    => q_next_pos_0); 
	next_pos1:reg_11 port map			  ( clk  => clk,
					reset=> reset,
					e    => e_next_pos_1,
					d    => d_next_pos_1,
					q    => q_next_pos_1); 
	wall_0:reg_3 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_wallshape_0,
					d    => d_wallshape_0,
					q    => q_wallshape_0);
	wall_1:reg_3 port map			      ( clk  => clk,
					reset=> reset,
					e    => e_wallshape_1,
					d    => d_wallshape_1,
					q    => q_wallshape_1);
	r_mem_0:reg_8 port map			     ( clk  => clk,
					reset=> reset,
					e    => e_read_mem_0,
					d    => d_read_mem_0,
					q    => q_read_mem_0);
	r_mem_1:reg_8 port map			     ( clk  => clk,
					reset=> reset,
					e    => e_read_mem_1,
					d    => d_read_mem_1,
					q    => q_read_mem_1);
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

