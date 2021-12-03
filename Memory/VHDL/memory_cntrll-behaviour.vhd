library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of memory_cntrll is
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

   component counter8b
      port(clk      : in  std_logic;
           rst      : in  std_logic;
           countOUT : out std_logic_vector(7 downto 0));
   end component;

   component counter5b
      port(clk      : in  std_logic;
           rst      : in  std_logic;
           countOUT : out std_logic_vector(4 downto 0));
   end component;

   component countextend
      port(clk     : in  std_logic;
   	     rst	    : in  std_logic;
           incrIN  : in  std_logic;
           incrOUT : out std_logic);
   end component;

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

   signal Xincr1, Yincr1, Xincr2, Yincr2, Xincr3, Yincr3: std_logic;
   signal XincrOUT, YincrOUT, WincrOUT: std_logic;
   signal rstCNT, rwrst, clrrst: std_logic;
   signal WErw, MErw, WEclr, MEclr: std_logic;
   signal readyrw, readyclr: std_logic;
   signal curX, curY: std_logic_vector (4 downto 0);
   signal curW: std_logic_vector (7 downto 0);
begin
	rw: readwrite port map (clk => clk, WEIN => WEIN, WEMEM => WErw, GOTOIN => GOTOIN, MEMEM => MErw, XincrMEM => Xincr1, YincrMEM => Yincr1, WincrMEM => WincrOUT, AddressIN => AddressIN, WriteIN => writeIN, readyOUT => readyrw, rstIN => rstIN, rstMEM => rwrst, curW => curW, curX => curX, curY => curY);
	cx: counter5b port map (clk => XincrOUT, rst => rstCNT, countOUT => curX);
	cy: counter5b port map (clk => YincrOUT, rst => rstCNT, countOUT => curY);
	cw: counter8b port map (clk => WincrOUT, rst => rstCNT, countOUT => curW);
	cex: countextend port map (clk => clk, rst => rstIN, incrIN => XincrIN, incrOUT => Xincr2);
	cey: countextend port map (clk => clk, rst => rstIN, incrIN => YincrIN, incrOUT => Yincr2);
	cm: memclear port map (clk => clk, rst => rstIN, clearMEM => clrIN, XincrMEM => Xincr3, YincrMEM => Yincr3, rstMEM => clrrst, WEMEM => WEclr, MEMEM => MEclr, readyOUT => readyclr, curX => curX, curY => curY);

	

	curXOUT <= curX;
	curYOUT <= curY;
	XincrOUT <= Xincr1 or Xincr2 or Xincr3;
	YincrOUT <= Yincr1 or Yincr2 or Yincr3;
	XincrMEM <= XincrOUT;
	YincrMEM <= YincrOUT;
	WincrMEM <= WincrOUT;
	rstCNT <= rwrst or rstIN or rstVGA or clrrst;
	rstMEM <= rstCNT;
	readOUT <= readMEM;
	WEMEM <= WErw and WEclr;
	MEMEM <= MErw or MEclr;
	readyOUT <= readyrw and readyclr;
end behaviour;

