
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of countextend is

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  signal state : std_logic_vector(1 downto 0);
  signal n_0, n_1, n_2, n_4, n_5 : std_logic;
  signal n_6 : std_logic;

begin

  state_reg_1 : DFQD1BWP7T port map(CP => clk, D => n_6, Q => state(1));
  state_reg_0 : DFQD1BWP7T port map(CP => clk, D => n_5, Q => state(0));
  g176 : NR2XD0BWP7T port map(A1 => n_4, A2 => rst, ZN => n_6);
  g175 : AOI21D0BWP7T port map(A1 => n_2, A2 => n_1, B => rst, ZN => n_5);
  g177 : AOI21D0BWP7T port map(A1 => state(0), A2 => incrIN, B => incrOUT, ZN => n_4);
  g178 : ND2D0BWP7T port map(A1 => n_0, A2 => incrIN, ZN => n_2);
  g179 : ND2D4BWP7T port map(A1 => n_1, A2 => n_0, ZN => incrOUT);
  g180 : IND2D1BWP7T port map(A1 => state(0), B1 => state(1), ZN => n_1);
  g181 : IND2D1BWP7T port map(A1 => state(1), B1 => state(0), ZN => n_0);

end synthesised;
