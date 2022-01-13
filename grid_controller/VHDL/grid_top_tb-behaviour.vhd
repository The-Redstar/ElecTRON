library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of grid_top_tb is
   component grid_top
      port(map_select : in  std_logic_vector(1 downto 0);
           x_addr     : in  std_logic_vector(4 downto 0);
           y_addr     : in  std_logic_vector(4 downto 0);
           jumps      : out std_logic_vector(7 downto 0);
           borders    : out std_logic_vector(7 downto 0);
           player0_start_pos : out std_logic_vector(10 downto 0);
           player1_start_pos : out std_logic_vector(10 downto 0);
           player0_start_dir : out std_logic_vector(1 downto 0);
           player1_start_dir : out std_logic_vector(1 downto 0));
   end component;
   signal map_select : std_logic_vector(1 downto 0);
   signal x_addr     : std_logic_vector(4 downto 0);
   signal y_addr     : std_logic_vector(4 downto 0);
   signal jumps      : std_logic_vector(7 downto 0);
   signal borders    : std_logic_vector(7 downto 0);
   signal player0_start_pos : std_logic_vector(10 downto 0);
   signal player1_start_pos : std_logic_vector(10 downto 0);
   signal player0_start_dir : std_logic_vector(1 downto 0);
   signal player1_start_dir : std_logic_vector(1 downto 0);
   
   signal clk, reset:	std_logic;
   
begin
   test: grid_top port map (map_select, x_addr, y_addr, jumps, borders, player0_start_pos, player1_start_pos, player0_start_dir, player1_start_dir);
   
   
   clk <= '0' after 0 ns, '1' after 40 ns when clk /= '1' else '0' after 40 ns;
   
   reset <= '1' after 0 ns,
   			'0' after 160 ns;
   			
	map_select <=	"00" after 0 ns,
   					"01" after 1 ms,
   					"10" after 2 ms,
   					"11" after 3 ms;
   					
	process(clk)
	begin
		if rising_edge(clk) then
			if reset='1' then
				x_addr <= (others => '0');
				y_addr <= (others => '0');
			else
				x_addr <= std_logic_vector(unsigned(x_addr)+to_unsigned(1,5));
				if x_addr="11111" then
					y_addr <= std_logic_vector(unsigned(y_addr)+to_unsigned(1,5));
				else
					y_addr <= y_addr;
				end if;
			end if;
		end if;
	end process;

end behaviour;

