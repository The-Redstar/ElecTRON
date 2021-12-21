library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of sidebar_tb is
   component sidebar
      port(x      : in  std_logic_vector(6 downto 0);
           y      : in  std_logic_vector(8 downto 0);
           player : in  std_logic;
           mode   : in  std_logic_vector(2 downto 0);
           ready  : in  std_logic;
           boost  : in  std_logic;
           dir    : in  std_logic_vector(1 downto 0);
           color  : out std_logic_vector(3 downto 0));
   end component;
   signal x,next_x      : std_logic_vector(6 downto 0);
   signal y,next_y      : std_logic_vector(8 downto 0);
   signal player : std_logic;
   signal mode   : std_logic_vector(2 downto 0);
   signal ready  : std_logic;
   signal boost  : std_logic;
   signal dir    : std_logic_vector(1 downto 0);
   signal color  : std_logic_vector(3 downto 0);
   
   signal clk,reset	 : std_logic;
begin
   test: sidebar port map (x, y, player, mode, ready, boost, dir, color);
   
	clk <= '0' after 0 ns,
           '1' after 20 ns when clk /= '1' else '0' after 20 ns;
	reset <= '1' after 0 ns,
             '0' after 80 ns;

	process(clk)
	begin
		if(rising_edge(clk)) then
			if (reset = '1') then
				x <= "0000000";
				y <= "000000000";
			else
				x <= next_x;
				y <= next_y;
			end if;
		end if;
	end process;

   process(x)
   begin
		if x="1001111" then
			next_x<="0000000";
		else
			next_x<=std_logic_vector(unsigned(x)+to_unsigned(1,7));
		end if;
	end process;
	
   process(x,y)
   begin
		if x="1001111" then--79
			if y="111011111" then--479
				next_y<="000000000";
			else
				next_y<=std_logic_vector(unsigned(y)+to_unsigned(1,7));
			end if;
		else
			next_y<=y;
		end if;
	end process;



   player <= '0' after 0 ns;
   mode <= "001";
   ready <= '0' after 0 ns;
   boost <= '0' after 0 ns;
   dir <= "00" after 0 ns;
end behaviour;

