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

	signal state_vga : std_logic_vector(2 downto 0);

begin
	lbl0:game_engine port map ( 
					clk  				=> clk,
					reset				=> rst,
					input    			=> direction_in,
					busy    			=> ,
					read_memory    		=> ,
					memory_ready		=> ,
					border				=> ,
					ramp				=> ,
					state_vga			=> state_vga,
					write_enable		=> ,
					write_memory		=> ,
					address				=> ,
					position_0_vga		=> ,
					position_1_vga		=> ,
					direction_0_vga		=>,
					direction_1_vga		=>,
					player_state_0_vga	=>,
					player_state_1_vga	=>,
					go_to				=>,
					clear_memory		=>);
					
	lbl1:memory_cntrll port map ( 
					read_mem    =>,
					clk         => clk,
					x_incr_mem  => x_increment_out,
					y_incr_mem  => y_increment_out,
					w_incr_mem  => w_increment_out,
					rst_mem     => memory_reset_out,
					we_mem      => write_enable_out,
					me_mem      => memory_enable_out,
					read_out    => ,
					write_in    => ,
					we_in       => ,
					address_in  => ,
					goto_in     => ,
					rst_in      => ,
					clr_in      => ,
					x_incr_in   => ,
					y_incr_in   => ,
					ready_out   => ,
					cur_x_out   => ,
					cur_y_out   =>,
					rst_vga	   	=>;
end structural;

