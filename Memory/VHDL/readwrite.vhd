library IEEE;
use IEEE.std_logic_1164.ALL;

entity readwrite is
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
end readwrite;

