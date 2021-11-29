library IEEE;
use IEEE.std_logic_1164.ALL;

entity memclear is
   port(clk      : in  std_logic;
        rst      : in  std_logic;
        clearMEM : in  std_logic;
        XincrMEM : out std_logic;
        YincrMEM : out std_logic;
        rstMEM   : out std_logic;
        WEMEM    : out std_logic;
        MEMEM    : out std_logic;
	readyOUT : out std_logic;
	curX	 : in std_logic_vector(4 downto 0);
	curY	 : in std_logic_vector(4 downto 0));
end memclear;

