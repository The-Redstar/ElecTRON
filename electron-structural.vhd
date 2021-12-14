library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of electron is
   component game_engine
	  port(clk                : in  std_logic;
           reset              : in  std_logic;
		   input              : in  std_logic_vector(3 downto 0);
		   busy               : in  std_logic;
           read_memory        : in  std_logic_vector(7 downto 0);
           memory_ready       : in  std_logic;
	       border		      : in  std_logic_vector(7 downto 0);
	       ramp		          : in  std_logic_vector(7 downto 0);
           state_vga          : out std_logic_vector(2 downto 0);
           write_enable       : out std_logic;
           write_memory       : out std_logic_vector(7 downto 0);
           address            : out std_logic_vector(9 downto 0);
           position_0_vga     : out std_logic_vector(10 downto 0);
           position_1_vga     : out std_logic_vector(10 downto 0);
           direction_0_vga    : out std_logic_vector(1 downto 0);
           direction_1_vga    : out std_logic_vector(1 downto 0);
           player_state_0_vga : out std_logic_vector(1 downto 0);
           player_state_1_vga : out std_logic_vector(1 downto 0);
	       go_to	          : out std_logic;
	       clear_memory       : out std_logic);
   end component;
   
   component memory_cntrll
	  port(read_mem    : in  std_logic_vector(7 downto 0);
		   clk         : in std_logic;
           x_incr_mem  : out std_logic;
           y_incr_mem  : out std_logic;
           w_incr_mem  : out std_logic;
           rst_mem     : out std_logic;
           we_mem      : out std_logic;
           me_mem      : out std_logic;
           read_out    : out std_logic_vector(7 downto 0);
           write_in    : in  std_logic_vector(7 downto 0);
           we_in       : in  std_logic;
           address_in  : in  std_logic_vector(9 downto 0);
           goto_in     : in  std_logic;
           rst_in      : in  std_logic;
           clr_in      : in  std_logic;
           x_incr_in   : in  std_logic;
           y_incr_in   : in  std_logic;
           ready_out   : out std_logic;
           cur_x_out   : out std_logic_vector(4 downto 0);
           cur_y_out   : out std_logic_vector(4 downto 0);
           rst_vga	   : in  std_logic);
   end component;

begin

	lbl0:game_engine port map ( 
					clk  				=> clk,
					reset				=> rst,
					input    			=> direction,
					busy    			=> ,
					read_memory    		=> ,
					memory_ready		=>,
					border				=>,
					ramp				=>,
					state_vga			=>,
					write_enable		=>,
					write_memory		=>,
					address				=>,
					position_0_vga		=>,
					position_1_vga		=>,
					direction_0_vga		=>,
					direction_1_vga		=>,
					player_state_0_vga	=>,
					player_state_1_vga	=>,
					go_to				=>,
					clear_memory		=>);
	lbl1:memory_cntrll port map			      ( clk  => clk,
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

