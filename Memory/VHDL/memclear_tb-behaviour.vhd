library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of memclear_tb is
   component memclear
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
   end component;

   component counter5b
      port(clk      : in  std_logic;
           rst      : in  std_logic;
           countOUT : out std_logic_vector(4 downto 0));
   end component;

   signal clk      : std_logic;
   signal rst      : std_logic;
   signal clearMEM : std_logic;
   signal XincrMEM : std_logic;
   signal YincrMEM : std_logic;
   signal rstMEM   : std_logic;
   signal WEMEM    : std_logic;
   signal MEMEM    : std_logic;
   signal readyOUT : std_logic;
   signal curX	 : std_logic_vector(4 downto 0);
   signal curY	 : std_logic_vector(4 downto 0);
begin
   test: memclear port map (clk, rst, clearMEM, XincrMEM, YincrMEM, rstMEM, WEMEM, MEMEM, readyOUT, curX, curY);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   rst <= '1' after 0 ns,
	  '0' after 25 ns;
   clearMEM <= '0' after 0 ns,
	       '1' after 50 ns,
	       '0' after 90 ns;
   counterX: counter5b port map (XincrMEM, rstMEM, curX);

   counterY: counter5b port map (YincrMEM, rstMEM, curY);
end behaviour;

