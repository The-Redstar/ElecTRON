
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of memory_cntrll is

  component countextend
    port(clk     : in  std_logic;
         rst     : in  std_logic;
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
         curX     : in  std_logic_vector(4 downto 0);
         curY     : in  std_logic_vector(4 downto 0));
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

  component readwrite
    port(clk       : in  std_logic;
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
         curW      : in  std_logic_vector(7 downto 0);
         curX      : in  std_logic_vector(4 downto 0);
         curY      : in  std_logic_vector(4 downto 0));
  end component;

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR4D4BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  signal curW : std_logic_vector(7 downto 0);
  signal MEclr, MErw, WEclr, WErw, Xincr1 : std_logic;
  signal Xincr2, Xincr3, Yincr1, Yincr2, Yincr3 : std_logic;
  signal clrrst, readyclr, readyrw, rwrst : std_logic;

begin

  cex : countextend port map(clk => clk, rst => rstIN, incrIN => XincrIN, incrOUT => Xincr2);
  cey : countextend port map(clk => clk, rst => rstIN, incrIN => YincrIN, incrOUT => Yincr2);
  cm : memclear port map(clk => clk, rst => rstIN, clearMEM => clrIN, XincrMEM => Xincr3, YincrMEM => Yincr3, rstMEM => clrrst, WEMEM => WEclr, MEMEM => MEclr, readyOUT => readyclr, curX => curXOUT, curY => curYOUT);
  cw : counter8b port map(clk => WincrMEM, rst => rstMEM, countOUT => curW);
  cx : counter5b port map(clk => XincrMEM, rst => rstMEM, countOUT => curXOUT);
  cy : counter5b port map(clk => YincrMEM, rst => rstMEM, countOUT => curYOUT);
  rw : readwrite port map(clk => clk, WEIN => WEIN, WEMEM => WErw, GOTOIN => GOTOIN, MEMEM => MErw, XincrMEM => Xincr1, YincrMEM => Yincr1, WincrMEM => WincrMEM, AddressIN => AddressIN, WriteIN => writeIN, readyOUT => readyrw, rstIN => rstIN, rstMEM => rwrst, curW => curW, curX => curXOUT, curY => curYOUT);
  g22 : OR3D4BWP7T port map(A1 => Xincr3, A2 => Xincr1, A3 => Xincr2, Z => XincrMEM);
  g21 : OR3D4BWP7T port map(A1 => Yincr3, A2 => Yincr1, A3 => Yincr2, Z => YincrMEM);
  g18 : CKAN2D4BWP7T port map(A1 => WErw, A2 => WEclr, Z => WEMEM);
  g12 : OR2D4BWP7T port map(A1 => MErw, A2 => MEclr, Z => MEMEM);
  g23 : CKAN2D4BWP7T port map(A1 => readyrw, A2 => readyclr, Z => readyOUT);
  g26 : OR4D4BWP7T port map(A1 => clrrst, A2 => rwrst, A3 => rstVGA, A4 => rstIN, Z => rstMEM);
  drc_bufs : BUFFD4BWP7T port map(I => readMEM(7), Z => readOUT(7));
  drc_bufs29 : BUFFD4BWP7T port map(I => readMEM(0), Z => readOUT(0));
  drc_bufs32 : BUFFD4BWP7T port map(I => readMEM(1), Z => readOUT(1));
  drc_bufs35 : BUFFD4BWP7T port map(I => readMEM(2), Z => readOUT(2));
  drc_bufs38 : BUFFD4BWP7T port map(I => readMEM(3), Z => readOUT(3));
  drc_bufs41 : BUFFD4BWP7T port map(I => readMEM(4), Z => readOUT(4));
  drc_bufs44 : BUFFD4BWP7T port map(I => readMEM(5), Z => readOUT(5));
  drc_bufs47 : BUFFD4BWP7T port map(I => readMEM(6), Z => readOUT(6));

end synthesised;
