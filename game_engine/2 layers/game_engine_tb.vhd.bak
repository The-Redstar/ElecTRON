library IEEE;
--testbench for second layer
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_engine_tb is
end entity game_engine_tb;

architecture structural of game_engine_tb is

	component game_engine is
		port(clk                : in  std_logic;
        reset              : in  std_logic;
        input              : in  std_logic_vector(3 downto 0);
		
        busy               : in  std_logic;
        read_memory        : in  std_logic_vector(7 downto 0);
        memory_ready       : in  std_logic;
		border		   	   : in  std_logic_vector(7 downto 0);
		ramp			   : in  std_logic_vector(7 downto 0);
		position_grid_0	   : in std_logic_vector(10 downto 0);
		position_grid_1	   : in std_logic_vector(10 downto 0);
select_button	   : in std_logic;	
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
		go_to	           : out std_logic;
		clear_memory       : out std_logic);
	end component game_engine;

	signal clk                : std_logic;
    signal reset              : std_logic;
    signal input              : std_logic_vector(3 downto 0);
    signal busy               : std_logic;
    signal read_memory        : std_logic_vector(7 downto 0);
    signal memory_ready       : std_logic;
    signal state_vga          : std_logic_vector(2 downto 0);
    signal write_enable       : std_logic;
    signal write_memory       : std_logic_vector(7 downto 0);
signal position_grid_0	   : std_logic_vector(10 downto 0);
signal select_button	   : std_logic;	
		signal position_grid_1	   : std_logic_vector(10 downto 0);
    signal border		   : std_logic_vector(7 downto 0);
    signal ramp		: std_logic_vector(7 downto 0);
    signal address            : std_logic_vector(9 downto 0);
    signal position_0_vga     : std_logic_vector(10 downto 0);
    signal position_1_vga     : std_logic_vector(10 downto 0);
    signal direction_0_vga    : std_logic_vector(1 downto 0);
    signal direction_1_vga    : std_logic_vector(1 downto 0);
    signal player_state_0_vga : std_logic_vector(1 downto 0);
    signal player_state_1_vga : std_logic_vector(1 downto 0);
	signal go_to	          : std_logic;
	signal clear_memory       : std_logic;

begin

	lbl0: game_engine port map	(clk               => clk,
							reset              => reset,
							input              => input,
							busy               => busy,
							read_memory        => read_memory,
							memory_ready       => memory_ready,
							state_vga          => state_vga,
							write_enable       => write_enable,
							write_memory       => write_memory,
							border		=> border, 
							ramp	=> ramp,	
							select_button => select_button,
							position_grid_0 => position_grid_0,
							position_grid_1	 => position_grid_1,	   
							address            => address,
							position_0_vga     => position_0_vga,
							position_1_vga     => position_1_vga,
							direction_0_vga    => direction_0_vga,
							direction_1_vga    => direction_1_vga,
							player_state_0_vga => player_state_0_vga,
							player_state_1_vga => player_state_1_vga,
							go_to	           => go_to,
							clear_memory       => clear_memory
				);
ramp <= "00000000" after 0 ns;
border <= "00000000" after 0 ns;
select_button <= '1' after 0 ns;
position_grid_0 <=  "01110111001" after 0 ns;
position_grid_1 <=  "01110100100" after 0 ns;


clk <= '1' after 0 ns,
	'0' after 20 ns when clk /= '0' else '1'  after 20 ns;

reset <= '1' after 0 ns,
	'0' after 60 ns; -- goes to loading state

input <= "0010" after 0 ns,
	"0000" after 230 ns, -- goes to wait state
	"0001" after 4000 ns;

-- normally the busy signal has a lower frequency, however for simulating the game_engine that takes to long
-- therefore a higher frequency was used during the wait_state, once out of the wait_state the busy signal remains 0 for a while like with the real busy signal to go through all the other states
busy <= '1' after 0 ns,
	'0' after 280 ns, -- unsigned_busy_count: 1
	'1' after 380 ns,
	'0' after 480 ns, -- unsigned_busy_count: 2
	'1' after 580 ns,
	'0' after 680 ns, -- unsigned_busy_count: 3
	'1' after 780 ns,
	'0' after 880 ns, -- unsigned_busy_count: 4
	'1' after 980 ns,
	'0' after 1080 ns, -- unsigned_busy_count: 5
	'1' after 1180 ns,
	'0' after 1280 ns, -- unsigned_busy_count: 6
	'1' after 1380 ns,
	'0' after 1480 ns, -- unsigned_busy_count: 7
	'1' after 1580 ns,
	'0' after 1680 ns, -- unsigned_busy_count: 8
	'1' after 1780 ns,
	'0' after 1880 ns, -- unsigned_busy_count: 9
	'1' after 1980 ns,
	'0' after 2080 ns, -- unsigned_busy_count: 10
	'1' after 2180 ns,
	'0' after 2280 ns, -- unsigned_busy_count: 11
	'1' after 2380 ns,
	'0' after 2480 ns, -- unsigned_busy_count: 12
	'1' after 2580 ns,
	'0' after 2680 ns, -- unsigned_busy_count: 13
	'1' after 2780 ns,
	'0' after 2880 ns, -- unsigned_busy_count: 14
	'1' after 2980 ns,
	'0' after 3080 ns, -- unsigned_busy_count: 15
	'1' after 3180 ns,
	'0' after 3280 ns, -- unsigned_busy_count: 16
	'1' after 4680 ns, 
	'0' after 4780 ns, 
	'1' after 4880 ns,
	'0' after 4980 ns,
	'1' after 5080 ns,
	'0' after 5180 ns, 
	'1' after 5280 ns,
	'0' after 5380 ns,
	'1' after 5480 ns,
	'0' after 5580 ns, 
	'1' after 5680 ns,
	'0' after 5780 ns,
	'1' after 5880 ns,
	'0' after 5980 ns, 
	'1' after 6080 ns,
	'0' after 6180 ns,
	'1' after 6280 ns,
	'0' after 6380 ns,
	'1' after 6480 ns,
	'0' after 6580 ns, 
	'1' after 6680 ns,
	'0' after 6780 ns,
	'1' after 6880 ns,
	'0' after 6980 ns, 
	'1' after 7080 ns,
	'0' after 7180 ns,
	'1' after 7280 ns,
	'0' after 7380 ns, 
	'1' after 7480 ns,
	'0' after 7580 ns,
	'1' after 7680 ns,
	'0' after 7780 ns;

read_memory <= "00000000" after 0 ns;


memory_ready <= '1' after 0 ns;
	
			
end architecture structural;
