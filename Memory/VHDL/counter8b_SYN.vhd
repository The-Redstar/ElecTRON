
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of counter8b is

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component DFCNQD1BWP7T
    port(CDN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component BUFFD4BWP7T
    port(I : in std_logic; Z : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFCND0BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal lstcnt : std_logic_vector(7 downto 0);
  signal n_2, n_4, n_5, n_6, n_7 : std_logic;
  signal n_9, n_11, n_13, n_15, n_16 : std_logic;
  signal n_20, n_21, n_22, n_23, n_24 : std_logic;
  signal n_27, n_33, n_39, n_45, n_51 : std_logic;

begin

  g140 : IND2D1BWP7T port map(A1 => n_13, B1 => countOUT(6), ZN => n_16);
  g143 : IND2D1BWP7T port map(A1 => n_11, B1 => countOUT(5), ZN => n_13);
  g146 : IND2D1BWP7T port map(A1 => n_9, B1 => countOUT(4), ZN => n_11);
  lstcnt_reg_2 : DFCNQD1BWP7T port map(CDN => n_15, CP => clk, D => n_6, Q => lstcnt(2));
  g149 : IND2D1BWP7T port map(A1 => n_7, B1 => countOUT(3), ZN => n_9);
  lstcnt_reg_1 : DFCNQD1BWP7T port map(CDN => n_15, CP => clk, D => n_4, Q => lstcnt(1));
  g150 : MOAI22D0BWP7T port map(A1 => n_5, A2 => lstcnt(2), B1 => n_5, B2 => lstcnt(2), ZN => n_6);
  g152 : IND2D1BWP7T port map(A1 => n_5, B1 => lstcnt(2), ZN => n_7);
  g153 : CKXOR2D1BWP7T port map(A1 => lstcnt(0), A2 => lstcnt(1), Z => n_4);
  g155 : ND2D1BWP7T port map(A1 => lstcnt(0), A2 => lstcnt(1), ZN => n_5);
  g159 : BUFFD4BWP7T port map(I => lstcnt(2), Z => countOUT(2));
  g158 : INVD0BWP7T port map(I => rst, ZN => n_15);
  g157 : BUFFD4BWP7T port map(I => lstcnt(0), Z => countOUT(0));
  g160 : BUFFD4BWP7T port map(I => lstcnt(1), Z => countOUT(1));
  g2 : XNR2D1BWP7T port map(A1 => n_16, A2 => lstcnt(7), ZN => n_20);
  g169 : XNR2D1BWP7T port map(A1 => n_13, A2 => lstcnt(6), ZN => n_21);
  g170 : XNR2D1BWP7T port map(A1 => n_11, A2 => lstcnt(5), ZN => n_22);
  g171 : XNR2D1BWP7T port map(A1 => n_9, A2 => lstcnt(4), ZN => n_23);
  g172 : XNR2D1BWP7T port map(A1 => n_7, A2 => lstcnt(3), ZN => n_24);
  drc_bufs173 : INVD4BWP7T port map(I => n_27, ZN => countOUT(3));
  drc_bufs179 : INVD4BWP7T port map(I => n_33, ZN => countOUT(4));
  drc_bufs185 : INVD4BWP7T port map(I => n_39, ZN => countOUT(6));
  drc_bufs191 : INVD4BWP7T port map(I => n_45, ZN => countOUT(5));
  drc_bufs197 : INVD4BWP7T port map(I => n_51, ZN => countOUT(7));
  lstcnt_reg_0 : DFCND1BWP7T port map(CDN => n_15, CP => clk, D => n_2, Q => lstcnt(0), QN => n_2);
  lstcnt_reg_3 : DFCND0BWP7T port map(CDN => n_15, CP => clk, D => n_24, Q => lstcnt(3), QN => n_27);
  lstcnt_reg_4 : DFCND0BWP7T port map(CDN => n_15, CP => clk, D => n_23, Q => lstcnt(4), QN => n_33);
  lstcnt_reg_6 : DFCND0BWP7T port map(CDN => n_15, CP => clk, D => n_21, Q => lstcnt(6), QN => n_39);
  lstcnt_reg_5 : DFCND0BWP7T port map(CDN => n_15, CP => clk, D => n_22, Q => lstcnt(5), QN => n_45);
  lstcnt_reg_7 : DFCND0BWP7T port map(CDN => n_15, CP => clk, D => n_20, Q => lstcnt(7), QN => n_51);

end synthesised;
