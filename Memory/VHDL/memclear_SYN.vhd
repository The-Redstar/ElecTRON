
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of memclear is

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(4 downto 0);
  signal n_0, n_1, n_2, n_4, n_5 : std_logic;
  signal n_7, n_8, n_9, n_10, n_11 : std_logic;
  signal n_12, n_13, n_14, n_17, n_18 : std_logic;
  signal n_19, n_22, n_23, n_24, n_25 : std_logic;
  signal n_26, n_27, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33, n_34 : std_logic;

begin

  state_reg_1 : DFQD1BWP7T port map(CP => clk, D => n_34, Q => state(1));
  g850 : AO22D0BWP7T port map(A1 => n_32, A2 => state(0), B1 => state(1), B2 => n_30, Z => n_34);
  g852 : OAI21D0BWP7T port map(A1 => n_12, A2 => n_28, B => n_31, ZN => n_33);
  state_reg_4 : DFQD1BWP7T port map(CP => clk, D => n_27, Q => state(4));
  g853 : AOI21D0BWP7T port map(A1 => n_24, A2 => state(1), B => rst, ZN => n_32);
  g855 : OAI21D0BWP7T port map(A1 => n_23, A2 => n_30, B => state(3), ZN => n_31);
  g856 : OAI31D0BWP7T port map(A1 => n_28, A2 => n_26, A3 => n_25, B => n_13, ZN => n_29);
  g857 : INR3D0BWP7T port map(A1 => n_26, B1 => n_28, B2 => n_25, ZN => n_27);
  g859 : OAI21D0BWP7T port map(A1 => state(2), A2 => n_19, B => state(3), ZN => n_24);
  g860 : AOI21D0BWP7T port map(A1 => state(1), A2 => n_22, B => n_25, ZN => n_23);
  g861 : AN2D0BWP7T port map(A1 => state(3), A2 => n_22, Z => n_26);
  g865 : OR2D4BWP7T port map(A1 => n_11, A2 => state(4), Z => rstMEM);
  g866 : AN2D4BWP7T port map(A1 => n_8, A2 => n_9, Z => readyOUT);
  g862 : INR2D1BWP7T port map(A1 => n_17, B1 => n_18, ZN => n_19);
  g864 : NR2XD0BWP7T port map(A1 => n_18, A2 => n_17, ZN => n_22);
  g863 : OR2D4BWP7T port map(A1 => n_7, A2 => XincrMEM, Z => WEMEM);
  g867 : IAO21D0BWP7T port map(A1 => n_10, A2 => clearMEM, B => state(4), ZN => n_14);
  g868 : MAOI22D0BWP7T port map(A1 => n_30, A2 => state(2), B1 => n_12, B2 => state(1), ZN => n_13);
  g869 : NR2XD0BWP7T port map(A1 => n_10, A2 => n_9, ZN => n_11);
  g870 : NR2XD0BWP7T port map(A1 => n_10, A2 => state(4), ZN => n_8);
  g871 : MOAI22D0BWP7T port map(A1 => n_28, A2 => n_5, B1 => n_4, B2 => n_28, ZN => n_7);
  g872 : IND4D0BWP7T port map(A1 => n_1, B1 => curX(2), B2 => curX(0), B3 => curX(3), ZN => n_18);
  g873 : IND4D0BWP7T port map(A1 => n_0, B1 => curY(1), B2 => curY(0), B3 => curY(4), ZN => n_17);
  g875 : AN2D4BWP7T port map(A1 => XincrMEM, A2 => state(1), Z => YincrMEM);
  g876 : IND3D1BWP7T port map(A1 => rst, B1 => state(2), B2 => n_5, ZN => n_12);
  g874 : IND2D1BWP7T port map(A1 => state(1), B1 => n_4, ZN => n_10);
  g877 : AN2D4BWP7T port map(A1 => n_2, A2 => state(1), Z => MEMEM);
  g883 : IND2D1BWP7T port map(A1 => rst, B1 => n_2, ZN => n_25);
  g881 : ND2D0BWP7T port map(A1 => curX(4), A2 => curX(1), ZN => n_1);
  g882 : NR2XD0BWP7T port map(A1 => state(2), A2 => state(3), ZN => n_4);
  g879 : AN2D4BWP7T port map(A1 => state(3), A2 => state(2), Z => XincrMEM);
  g878 : ND2D0BWP7T port map(A1 => curY(3), A2 => curY(2), ZN => n_0);
  g880 : NR2XD0BWP7T port map(A1 => state(0), A2 => rst, ZN => n_30);
  g884 : CKND2D1BWP7T port map(A1 => state(0), A2 => state(1), ZN => n_28);
  state_reg_3 : DFD1BWP7T port map(CP => clk, D => n_33, Q => state(3), QN => n_5);
  state_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => n_30, D => n_14, Q => state(0), QN => n_9);
  state_reg_2 : DFD1BWP7T port map(CP => clk, D => n_29, Q => state(2), QN => n_2);

end synthesised;
