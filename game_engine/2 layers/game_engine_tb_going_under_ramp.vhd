library IEEE;
--testbench for second layer
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_engine_tb_going_under_border is
end entity game_engine_tb_going_under_border;

architecture structural of game_engine_tb_going_under_border is

	component game_engine is
		port(clk                : in  std_logic;
        reset              : in  std_logic;
        input              : in  std_logic_vector(3 downto 0);
		
        busy               : in  std_logic;
        read_memory        : in  std_logic_vector(7 downto 0);
        memory_ready       : in  std_logic;
		border		   	   : in  std_logic_vector(7 downto 0);
		ramp			   : in  std_logic_vector(7 downto 0);
		position_grid_0	   : in  std_logic_vector(10 downto 0);
		position_grid_1	   : in  std_logic_vector(10 downto 0);
		direction_grid_0   : in  std_logic_vector(1 downto 0);
		direction_grid_1   : in  std_logic_vector(1 downto 0);
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
	signal position_grid_1	   : std_logic_vector(10 downto 0);
	signal direction_grid_0	   : std_logic_vector(1 downto 0);
	signal direction_grid_1	   : std_logic_vector(1 downto 0);
	signal select_button	   : std_logic;	
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
							direction_grid_0   => direction_grid_0,
							direction_grid_1   => direction_grid_1,
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
				
				
ramp <= "00000000" after 0 ns,
		"00000100" after 3440 ns,--south
		"00000000" after 3880 ns,
		"00000100" after 6480 ns,
		"00010000" after 6840 ns; 
	
border <= 	"00000000" after 0 ns,
			"01001010" after 3440 ns,--west and east
			"00000000" after 3880 ns,
			"01001010" after 6480 ns,
			"10100001" after 6840 ns;
			
			
			
			
			
select_button <= '1' after 0 ns;
position_grid_0 <=  "00001000011" after 0 ns;
position_grid_1 <=  "00000000001" after 0 ns;
direction_grid_0 <= "01" after 0 ns;
direction_grid_1 <= "10" after 0 ns;


clk <= '1' after 0 ns,
	'0' after 20 ns when clk /= '0' else '1'  after 20 ns;

reset <= '1' after 0 ns,
	'0' after 60 ns; -- goes to loading state

input <= "0010" after 0 ns,
	"1001" after 230 ns;

-- normally the busy signal has a lower frequency, however for simulating the game_engine that takes to long
-- therefore a higher frequency was used during the wait_state, once out of the wait_state the busy signal remains 0 for a while like with the real busy signal to go through all the other states
busy <= '1' after 0 ns,
	'0' after 100 ns when busy /= '0' else '1'  after 100 ns;

read_memory <= "00000000" after 0 ns;


memory_ready <= '1' after 0 ns,
	'0' after 120 ns,
	'1' after 220 ns,
	'0' after 3600 ns,
	'1' after 3700 ns,
	'0' after 3760 ns,
	'1' after 3860 ns,
	'0' after 3960 ns,
	'1' after 4060 ns,
	'0' after 4120 ns,
	'1' after 4220 ns,
	'0' after 8080 ns,
	'1' after 8180 ns,
	'0' after 8240 ns,
	'1' after 8340 ns,
	'0' after 8440 ns,
	'1' after 8540 ns,
	'0' after 8600 ns,
	'1' after 8700 ns;

			
end architecture structural;
