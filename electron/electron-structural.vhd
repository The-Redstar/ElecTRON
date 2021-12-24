library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of electron is
   component game_engine
	  port(clk            : in  std_logic;
           reset              : in  std_logic;
	   input              : in  std_logic_vector(3 downto 0);
	   busy               : in  std_logic;
           read_memory        : in  std_logic_vector(7 downto 0);
           memory_ready       : in  std_logic;
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
	   go_to	             : out std_logic;
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
   
   component graphics_top
      port(clk	: in  std_logic;
		   reset	: in  std_logic;

		   h_sync	: out std_logic;
		   v_sync	: out std_logic;
	
		   color	: out std_logic_vector(3 downto 0);

           x_incr	: out std_logic;
		   y_incr	: out std_logic;
		   mem_rst	: out std_logic;

		   data		: in  std_logic_vector(7 downto 0);
		   borders	: in  std_logic_vector(7 downto 0);
		   jumps	: in  std_logic_vector(7 downto 0);

		   player0_pos		: in  std_logic_vector(10 downto 0);
		   player1_pos		: in  std_logic_vector(10 downto 0);
		   player0_dir		: in  std_logic_vector(1 downto 0);
		   player1_dir		: in  std_logic_vector(1 downto 0);
		   player0_state	: in  std_logic_vector(1 downto 0);
		   player1_state	: in  std_logic_vector(1 downto 0);

		   busy				: out std_logic;
		   audio_clock		: out std_logic;

		   game_state		: in  std_logic_vector(2 downto 0));
   end component;

   component input_buffer
	  port(clk 		: in std_logic;
		rst	: in std_logic;
		dir_in 	: in std_logic_vector(3 downto 0);
		dir_out	: out std_logic_vector(3 downto 0);
		start_in : in std_logic;
		start_out : out std_logic);
   end component;

	signal busy: std_logic;
	signal read_memory, write_memory: std_logic_vector(7 downto 0);
	signal memory_ready, write_enable, go_to, clear_memory: std_logic;
	signal address: std_logic_vector(9 downto 0);
	signal position_0, position_1: std_logic_vector(10 downto 0);
	signal direction_0, direction_1: std_logic_vector (1 downto 0);
	signal player_state_0, player_state_1: std_logic_vector(1 downto 0);
	signal game_state: std_logic_vector (2 downto 0);
	signal x_increment, y_increment: std_logic;
	signal reset_vga_mem: std_logic;
	signal random1, random2: std_logic_vector (4 downto 0);
	signal random3: std_logic;
	signal ramps, borders: std_logic_vector (7 downto 0);
	signal direction_between: std_logic_vector (3 downto 0);
	signal random5: std_logic;

begin
	lbl0:game_engine port map ( 
					clk  				=> clk,
					reset				=> rst,
					input    			=> direction_in,
					busy    			=> busy,
					read_memory    		=> read_memory,
					memory_ready		=> memory_ready,
					state_vga			=> game_state,
					write_enable		=> write_enable,
					write_memory		=> write_memory,
					address				=> address,
					position_0_vga		=> position_0,
					position_1_vga		=> position_1,
					direction_0_vga		=> direction_0,
					direction_1_vga		=> direction_1,
					player_state_0_vga	=> player_state_0,
					player_state_1_vga	=> player_state_1,
					go_to				=> go_to,
					clear_memory		=> clear_memory);
					
	lbl1:memory_cntrll port map ( 
					read_mem    => read_memory_in,
					clk         => clk,
					x_incr_mem  => x_increment_out,
					y_incr_mem  => y_increment_out,
					w_incr_mem  => w_increment_out,
					rst_mem     => memory_reset_out,
					we_mem      => write_enable_out,
					me_mem      => memory_enable_out,
					read_out    => read_memory,
					write_in    => write_memory,
					we_in       => write_enable,
					address_in  => address,
					goto_in     => go_to,
					rst_in      => rst,
					clr_in      => clear_memory,
					x_incr_in   => x_increment,
					y_incr_in   => y_increment,
					ready_out   => memory_ready,
					cur_x_out   => random1,
					cur_y_out   => random2,
					rst_vga	   	=> reset_vga_mem);
					
	lbl2:graphics_top port map (
					clk 			=> clk,
					reset			=> rst,
					h_sync			=> h_sync_out,
					v_sync			=> v_sync_out,
					color			=> color_out,
					x_incr			=> x_increment,
					y_incr			=> y_increment,
					mem_rst			=> reset_vga_mem,
					data			=> read_memory,
					borders			=> borders,
					jumps			=> ramps,
					player0_pos		=> position_0,
					player1_pos		=> position_1,
					player0_dir		=> direction_0,
					player1_dir		=> direction_1,
					player0_state	=> player_state_0,
					player1_state	=> player_state_1,
					busy			=> busy,
					audio_clock		=> random3,
					game_state		=> game_state);
	lbl3:input_buffer port map (
					clk	=> clk,
					rst	=> rst,
					dir_in	=> direction_in,
					start_in => start_in,
					dir_out => direction_between,
					start_out	=> random5);

end structural;

