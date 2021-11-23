library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of readwrite_tb is
   component readwrite
      port(clk	      : in  std_logic;
   	WEIN      : in  std_logic;
           WEMEM     : out std_logic;
           GOTOIN    : in  std_logic;
           MEMEM     : out std_logic;
           XincrMEM  : out std_logic;
           YincrMEM  : out std_logic;
           WincrMEM  : out std_logic;
           AddressIN : in  std_logic_vector(9 downto 0);
           WriteIN   : in  std_logic_vector(7 downto 0);
           readyOUT  : out std_logic;
           rstIN     : in  std_logic;
           rstMEM    : out std_logic;
   	curW	  : in std_logic_vector(7 downto 0);
   	curX	  : in std_logic_vector(4 downto 0);
   	curY	  : in std_logic_vector(4 downto 0));
   end component;
   signal clk	      : std_logic;
   signal WEIN      : std_logic;
   signal WEMEM     : std_logic;
   signal GOTOIN    : std_logic;
   signal MEMEM     : std_logic;
   signal XincrMEM  : std_logic;
   signal YincrMEM  : std_logic;
   signal WincrMEM  : std_logic;
   signal AddressIN : std_logic_vector(9 downto 0);
   signal WriteIN   : std_logic_vector(7 downto 0);
   signal readyOUT  : std_logic;
   signal rstIN     : std_logic;
   signal rstMEM    : std_logic;
   signal curW	  : std_logic_vector(7 downto 0);
   signal curX	  : std_logic_vector(4 downto 0);
   signal curY	  : std_logic_vector(4 downto 0);
begin
   test: readwrite port map (clk, WEIN, WEMEM, GOTOIN, MEMEM, XincrMEM, YincrMEM, WincrMEM, AddressIN, WriteIN, readyOUT, rstIN, rstMEM, curW, curX, curY);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   WEIN <= '0' after 0 ns,
	     '1' after 2000 ns;
   GOTOIN <= '0' after 0 ns,
		 '1' after 55 ns,
		 '0' after 95 ns,
		 '1' after 2000 ns,
		 '0' after 2040 ns;
   AddressIN(0) <= '0' after 0 ns,
			 '1' after 55 ns;
   AddressIN(1) <= '0' after 0 ns,
			 '1' after 2040 ns;
   AddressIN(2) <= '0' after 0 ns,
			 '1' after 55 ns;
   AddressIN(3) <= '0' after 0 ns,
			 '1' after 2040 ns;
   AddressIN(4) <= '0' after 0 ns,
			 '1' after 2040 ns;
   AddressIN(5) <= '0' after 0 ns,
			 '1' after 2040 ns;
   AddressIN(6) <= '0' after 0 ns,
			 '1' after 55 ns;
   AddressIN(7) <= '0' after 0 ns,
			 '1' after 2040 ns;
   AddressIN(8) <= '0' after 0 ns,
			 '1' after 55 ns;
   AddressIN(9) <= '0' after 0 ns,
			 '1' after 2040 ns;
   WriteIN(0) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(1) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(2) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(3) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(4) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(5) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(6) <= '0' after 0 ns,
		     '1' after 2040 ns;
   WriteIN(7) <= '0' after 0 ns,
		     '1' after 2040 ns;
   rstIN <= '1' after 0 ns,
		'0' after 15 ns;

   counterX: process (XincrMEM, rstMEM)
   begin
	if rstMEM = '1' then
	   curX <= "00000";
	elsif XincrMEM = '1' then
	   curX <= std_logic_vector(to_unsigned(to_integer(unsigned(curX)) + 1,5));
	end if;
   end process;

   counterY: process (YincrMEM, rstMEM)
   begin
	if rstMEM = '1' then
	   curY <= "00000";
	elsif YincrMEM = '1' then
	   curY <= std_logic_vector(to_unsigned(to_integer(unsigned(curY)) + 1,5));
	end if;
   end process;

   counterW: process (WincrMEM, rstMEM)
   begin
	if rstMEM = '1' then
	   curW <= "00000000";
	elsif WincrMEM = '1' then
	   curW <= std_logic_vector(to_unsigned(to_integer(unsigned(curW)) + 1,8));
	end if;
   end process;

end behaviour;

