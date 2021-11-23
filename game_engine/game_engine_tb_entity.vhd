library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_engine_tb is
end entity game_engine_tb;

architecture structural of game_engine_tb is

	component game_engine is
		port (clk                : in  std_logic;
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


clk <= '1' after 0 ns,
	'0' after 20 ns when clk /= '0' else '1'  after 20 ns;

reset <= '1' after 0 ns,
	'0' after 60 ns; -- goes to loading state

input <= "0000" after 230 ns, -- goes to wait state
	"0001" after 3800 ns;


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
	'0' after 3080 ns; -- unsigned_busy_count: 16




read_memory <= "00000000" after 3240 ns;


memory_ready <= '0' after 0 ns,
		'1' after 140 ns, --goes to get ready state
		'0' after 180 ns,
		'1' after 3320 ns, --goes to want_to_read_1
		'0' after 3360 ns,
		'1' after 3480 ns, -- goes to check_collision
		'0' after 3520 ns,
		'1' after 3720 ns, -- goes to want_to_write_1
		'0' after 3760 ns,
		'1' after 3880 ns, -- goes to change_data
		'0' after 3920 ns;

-- 60 ns: loading state
-- 140 ns: ready state
-- 230 ns: wait_state
-- 3080 ns: read inputs
--3120 ns: wallshape
--3160 ns: check border
--3200 ns: want_to_read_0
--3240: read_memory_player_0
--3320: want_to_read_1
--3360: read_memory_player_1
--3480: check_collision
--3520: check_who_won
--3560: want_to_write_0
--3600: write_memory_player_0
--3720: want_to_write_1
--3760: write_memory_player_1
--3880: change data
--3920: wait_state					
end architecture structural;
