library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memory_cntrll is
   component readwrite
      port(clk         : in  std_logic;
           we_in       : in  std_logic;
           we_mem      : out std_logic;
           goto_in     : in  std_logic;
           me_mem      : out std_logic;
           x_incr_mem  : out std_logic;
           y_incr_mem  : out std_logic;
           w_incr_mem  : out std_logic;
           address_in  : in  std_logic_vector(9 downto 0);
           write_in    : in  std_logic_vector(7 downto 0);
           ready_out   : out std_logic;
           rst_in      : in  std_logic;
           rst_mem     : out std_logic;
           cur_w       : in std_logic_vector(7 downto 0);
           cur_x       : in std_logic_vector(4 downto 0);
           cur_y       : in std_logic_vector(4 downto 0);
           busy_in     : in std_logic);
   end component;

   component counter8b
      port(clk       : in  std_logic;
           rst       : in  std_logic;
           count_out : out std_logic_vector(7 downto 0));
   end component;

   component counter5b
      port(clk       : in  std_logic;
           rst       : in  std_logic;
           count_out : out std_logic_vector(4 downto 0));
   end component;

   component countextend
      port(clk      : in  std_logic;
           rst      : in  std_logic;
           incr_in  : in  std_logic;
           incr_out : out std_logic;
           busy_in  : in std_logic);
   end component;

   component memclear
      port(clk        : in  std_logic;
           rst        : in  std_logic;
           clear_mem  : in  std_logic;
           x_incr_mem : out std_logic;
           y_incr_mem : out std_logic;
           rst_mem    : out std_logic;
           we_mem     : out std_logic;
           me_mem     : out std_logic;
           ready_out  : out std_logic;
           cur_x      : in std_logic_vector(4 downto 0);
           cur_y      : in std_logic_vector(4 downto 0);
           busy_in    : in std_logic);
   end component;

   signal x_incr1, y_incr1, x_incr2, y_incr2, x_incr3, y_incr3: std_logic;
   signal x_incr_out, y_incr_out, w_incr_out: std_logic;
   signal rst_cnt, rw_rst, clr_rst: std_logic;
   signal we_rw, me_rw, we_clr, me_clr: std_logic;
   signal ready_rw, ready_clr: std_logic;
   signal cur_x, cur_y: std_logic_vector (4 downto 0);
   signal cur_w: std_logic_vector (7 downto 0);
   signal busy, busy_ce, ready: std_logic;
begin
	rw: readwrite port map (clk => clk, we_in => we_in, we_mem => we_rw, goto_in => goto_in, me_mem => me_rw, x_incr_mem => x_incr1, y_incr_mem => y_incr1, w_incr_mem => w_incr_out, address_in => address_in, write_in => write_in, ready_out => ready_rw, rst_in => rst_in, rst_mem => rw_rst, cur_w => cur_w, cur_x => cur_x, cur_y => cur_y, busy_in => busy);
	cx: counter5b port map (clk => x_incr_out, rst => rst_cnt, count_out => cur_x);
	cy: counter5b port map (clk => y_incr_out, rst => rst_cnt, count_out => cur_y);
	cw: counter8b port map (clk => w_incr_out, rst => rst_cnt, count_out => cur_w);
	cex: countextend port map (clk => clk, rst => rst_in, incr_in => x_incr_in, incr_out => x_incr2, busy_in => busy_ce);
	cey: countextend port map (clk => clk, rst => rst_in, incr_in => y_incr_in, incr_out => Y_incr2, busy_in => busy_ce);
	cm: memclear port map (clk => clk, rst => rst_in, clear_mem => clr_in, x_incr_mem => x_incr3, y_incr_mem => y_incr3, rst_mem => clr_rst, we_mem => we_clr, me_mem => me_clr, ready_out => ready_clr, cur_x => cur_x, cur_y => cur_y, busy_in => busy);

	
	busy_ce <= not(ready);
	busy <= busy_ce or x_incr2 or y_incr2;
	cur_x_out <= cur_x;
	cur_y_out <= cur_y;
	x_incr_out <= x_incr1 or x_incr2 or x_incr3;
	y_incr_out <= y_incr1 or y_incr2 or y_incr3;
	x_incr_mem <= x_incr_out;
	y_incr_mem <= y_incr_out;
	w_incr_mem <= w_incr_out;
	rst_cnt <= rw_rst or rst_in or rst_vga or clr_rst;
	rst_mem <= rst_cnt;
	read_out <= read_mem;
	we_mem <= we_rw and we_clr;
	me_mem <= me_rw or me_clr;
	ready <= ready_rw and ready_clr;
	ready_out <= ready;
end behaviour;

