library IEEE;
use IEEE.std_logic_1164.ALL;

entity memory_cntrll is
   port(readMEM   : in  std_logic_vector(7 downto 0);
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
        curX      : out std_logic_vector(4 downto 0);
        curY      : out std_logic_vector(4 downto 0));
end memory_cntrll;

