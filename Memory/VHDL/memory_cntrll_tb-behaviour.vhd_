library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memory_cntrll_tb is
   component memory_cntrll
      port(readMEM   : in  std_logic_vector(7 downto 0);
           clk  	    : in std_logic;
   	  XincrMEM  : out std_logic;
           YincrMEM  : out std_logic;
           WincrMEM  : out std_logic;
           rstMEM    : out std_logic;
           WEMEM     : out std_logic;
           MEMEM     : out std_logic;
           readOUT   : out std_logic_vector(7 downto 0);
           writeIN   : in  std_logic_vector(7 downto 0);
           WEIN      : in  std_logic;
           AddressIN : in  std_logic_vector(9 downto 0);
           GOTOIN    : in  std_logic;
           rstIN     : in  std_logic;
           clrIN     : in  std_logic;
           XincrIN   : in  std_logic;
           YincrIN   : in  std_logic;
           readyOUT  : out std_logic;
           curXOUT   : out std_logic_vector(4 downto 0);
           curYOUT   : out std_logic_vector(4 downto 0);
   	  clrMEM		: in  std_logic;
   	  rstVGA		: in  std_logic);
   end component;
   signal readMEM   : std_logic_vector(7 downto 0);
   signal clk  	    : std_logic;
   signal XincrMEM  : std_logic;
   signal YincrMEM  : std_logic;
   signal WincrMEM  : std_logic;
   signal rstMEM    : std_logic;
   signal WEMEM     : std_logic;
   signal MEMEM     : std_logic;
   signal readOUT   : std_logic_vector(7 downto 0);
   signal writeIN   : std_logic_vector(7 downto 0);
   signal WEIN      : std_logic;
   signal AddressIN : std_logic_vector(9 downto 0);
   signal GOTOIN    : std_logic;
   signal rstIN     : std_logic;
   signal clrIN     : std_logic;
   signal XincrIN   : std_logic;
   signal YincrIN   : std_logic;
   signal readyOUT  : std_logic;
   signal curXOUT   : std_logic_vector(4 downto 0);
   signal curYOUT   : std_logic_vector(4 downto 0);
   signal clrMEM		: std_logic;
   signal rstVGA		: std_logic;
begin
   test: memory_cntrll port map (readMEM, clk, XincrMEM, YincrMEM, WincrMEM, rstMEM, WEMEM, MEMEM, readOUT, writeIN, WEIN, AddressIN, GOTOIN, rstIN, clrIN, XincrIN, YincrIN, readyOUT, curXOUT, curYOUT, clrMEM, rstVGA);
   readMEM(0) <= '0' after 0 ns;
   readMEM(1) <= '0' after 0 ns;
   readMEM(2) <= '0' after 0 ns;
   readMEM(3) <= '0' after 0 ns;
   readMEM(4) <= '0' after 0 ns;
   readMEM(5) <= '0' after 0 ns;
   readMEM(6) <= '0' after 0 ns;
   readMEM(7) <= '0' after 0 ns;
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
		'0' after 30 ns;
   clrIN <= '0' after 0 ns;
   XincrIN <= '0' after 0 ns,
		  '1' after 50090 ns,
		  '0' after 50130 ns;
   YincrIN <= '0' after 0 ns,
		  '1' after 50050 ns,
		  '0' after 50090 ns;
   rstVGA <= '0' after 0 ns,
		 '1' after 50010 ns,
		 '0' after 50050 ns;
   clrMEM <= '0' after 0 ns;
end behaviour;

