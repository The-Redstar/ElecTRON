
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of counter5b is

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
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

  component DFCND0BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal lstcnt : std_logic_vector(4 downto 0);
  signal n_0, n_1, n_2, n_4, n_6 : std_logic;
  signal n_7, n_11, n_12, n_13, n_22 : std_logic;
  signal n_28, n_34, n_40 : std_logic;

begin

  g89 : IND2D1BWP7T port map(A1 => n_4, B1 => countOUT(3), ZN => n_7);
  g92 : IND2D1BWP7T port map(A1 => n_2, B1 => countOUT(2), ZN => n_4);
  g93 : CKXOR2D1BWP7T port map(A1 => countOUT(0), A2 => countOUT(1), Z => n_1);
  g95 : ND2D1BWP7T port map(A1 => lstcnt(0), A2 => lstcnt(1), ZN => n_2);
  g96 : INVD0BWP7T port map(I => rst, ZN => n_6);
  g2 : XNR2D1BWP7T port map(A1 => n_7, A2 => lstcnt(4), ZN => n_11);
  g103 : XNR2D1BWP7T port map(A1 => n_4, A2 => lstcnt(3), ZN => n_12);
  g104 : XNR2D1BWP7T port map(A1 => n_2, A2 => lstcnt(2), ZN => n_13);
  drc_bufs : INVD4BWP7T port map(I => n_0, ZN => countOUT(0));
  drc_bufs111 : INVD4BWP7T port map(I => n_22, ZN => countOUT(3));
  drc_bufs117 : INVD4BWP7T port map(I => n_28, ZN => countOUT(2));
  drc_bufs123 : INVD4BWP7T port map(I => n_34, ZN => countOUT(1));
  drc_bufs129 : INVD4BWP7T port map(I => n_40, ZN => countOUT(4));
  lstcnt_reg_0 : DFCND0BWP7T port map(CDN => n_6, CP => clk, D => n_0, Q => lstcnt(0), QN => n_0);
  lstcnt_reg_3 : DFCND0BWP7T port map(CDN => n_6, CP => clk, D => n_12, Q => lstcnt(3), QN => n_22);
  lstcnt_reg_2 : DFCND0BWP7T port map(CDN => n_6, CP => clk, D => n_13, Q => lstcnt(2), QN => n_28);
  lstcnt_reg_1 : DFCND0BWP7T port map(CDN => n_6, CP => clk, D => n_1, Q => lstcnt(1), QN => n_34);
  lstcnt_reg_4 : DFCND0BWP7T port map(CDN => n_6, CP => clk, D => n_11, Q => lstcnt(4), QN => n_40);

end synthesised;
