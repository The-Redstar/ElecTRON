library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity game_engine_tb is
end entity game_engine_tb;

architecture structural of game_engine_tb is

	component game_engine is
		port (clk          : in  std_logic;
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

	lbl0: game_engine port map	(clk           => clk,
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


clk <= 		'1' after 0 ns,
			'0' after 20 ns when clk /= '0' else '1'  after 20 ns;

reset <= 	'1' after 0 ns,
			'0' after 60 ns; -- goes to loading state

input <= 	"0000" after 340 ns, -- goes to wait state
			"0111" after 1000 ns;


busy <= 	'0' after 0 ns;


read_memory <=	"00000000" after 0 ns;


memory_ready <= '1' after 0 ns,
				'0' after 120 ns,
				'1' after 220 ns,
				'0' after 520 ns, -- cycle 1
				'1' after 620 ns,
				'0' after 660 ns,
				'1' after 760 ns,
				'0' after 880 ns,
				'1' after 980 ns,
				'0' after 1020 ns,
				'1' after 1120 ns,
				'0' after 1400 ns, --  cycle 2
				'1' after 1500 ns,
				'0' after 1540 ns,
				'1' after 1640 ns,
				'0' after 1760 ns,
				'1' after 1860 ns,
				'0' after 1900 ns,
				'1' after 2000 ns,
				'0' after 2280 ns, --  cycle 3
				'1' after 2380 ns,
				'0' after 2420 ns,
				'1' after 2520 ns,
				'0' after 2640 ns,
				'1' after 2740 ns,
				'0' after 2780 ns,
				'1' after 2880 ns, -- cycle 4
				'0' after 3160 ns,
				'1' after 3260 ns,
				'0' after 3300 ns,
				'1' after 3400 ns,
				'0' after 3520 ns,
				'1' after 3620 ns,
				'0' after 3660 ns,
				'1' after 3760 ns,
				'0' after 4040 ns, -- cylce 5
				'1' after 4140 ns,
				'0' after 4180 ns,
				'1' after 4280 ns,
				'0' after 4400 ns,
				'1' after 4500 ns,
				'0' after 4540 ns,
				'1' after 4640 ns;

-- 

			
end architecture structural;
