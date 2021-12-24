
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of grid_top is

  component OR3D4BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI32D0BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  signal n_1, n_2, n_3, n_4, n_5 : std_logic;
  signal n_6, n_7, n_8, n_9, n_10 : std_logic;
  signal n_11, n_12, n_13, n_14, n_15 : std_logic;
  signal n_16, n_17, n_18, n_19, n_20 : std_logic;
  signal n_21, n_22, n_23, n_24, n_25 : std_logic;
  signal n_26, n_27, n_28, n_29, n_30 : std_logic;
  signal n_31, n_32, n_33, n_34, n_35 : std_logic;
  signal n_36, n_37, n_38, n_39, n_40 : std_logic;
  signal n_41, n_42, n_43, n_45, n_46 : std_logic;
  signal n_47, n_48, n_49, n_50, n_51 : std_logic;
  signal n_52, n_53, n_54, n_55, n_56 : std_logic;
  signal n_57, n_58, n_59, n_60, n_61 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_68, n_69, n_70, n_71 : std_logic;
  signal n_72, n_73, n_74, n_75, n_76 : std_logic;
  signal n_77, n_78, n_79, n_80, n_81 : std_logic;
  signal n_82, n_83, n_84, n_85, n_86 : std_logic;
  signal n_87, n_88, n_89, n_90, n_91 : std_logic;
  signal n_92, n_93, n_94, n_95, n_96 : std_logic;
  signal n_97, n_98, n_100, n_101, n_102 : std_logic;
  signal n_103, n_104, n_105, n_106, n_107 : std_logic;
  signal n_108, n_109, n_110, n_111, n_112 : std_logic;
  signal n_113, n_114, n_115, n_116, n_117 : std_logic;
  signal n_118, n_119, n_120, n_121, n_122 : std_logic;
  signal n_124, n_125, n_126, n_127, n_128 : std_logic;
  signal n_129, n_130, n_131, n_132, n_133 : std_logic;
  signal n_134, n_135, n_136, n_138, n_139 : std_logic;
  signal n_141, n_144, n_148, n_168 : std_logic;

begin

  g7818 : OR3D4BWP7T port map(A1 => n_144, A2 => jumps(0), A3 => n_136, Z => borders(4));
  g7826 : OR3D4BWP7T port map(A1 => n_98, A2 => n_121, A3 => n_131, Z => borders(7));
  g7817 : ND2D4BWP7T port map(A1 => n_141, A2 => n_148, ZN => borders(6));
  g7822 : OR3D4BWP7T port map(A1 => jumps(7), A2 => n_116, A3 => n_130, Z => borders(3));
  g7821 : ND2D4BWP7T port map(A1 => n_139, A2 => n_148, ZN => borders(2));
  g7825 : OR3D4BWP7T port map(A1 => n_112, A2 => jumps(5), A3 => n_128, Z => borders(1));
  g7819 : OR3D4BWP7T port map(A1 => n_144, A2 => jumps(4), A3 => n_134, Z => borders(0));
  g7823 : ND2D4BWP7T port map(A1 => n_125, A2 => n_122, ZN => borders(5));
  g7820 : AOI211D0BWP7T port map(A1 => n_135, A2 => n_138, B => jumps(2), C => n_33, ZN => n_141);
  g7824 : AOI211D0BWP7T port map(A1 => n_133, A2 => n_138, B => jumps(6), C => n_59, ZN => n_139);
  g7827 : MOAI22D0BWP7T port map(A1 => n_168, A2 => x_addr(3), B1 => n_135, B2 => n_132, ZN => n_136);
  g7829 : AO22D0BWP7T port map(A1 => n_133, A2 => n_132, B1 => n_58, B2 => n_43, Z => n_134);
  g7835 : MOAI22D0BWP7T port map(A1 => n_81, A2 => n_129, B1 => n_124, B2 => n_127, ZN => n_131);
  g7837 : OAI22D0BWP7T port map(A1 => n_126, A2 => x_addr(0), B1 => n_129, B2 => n_80, ZN => n_130);
  g7838 : OAI32D0BWP7T port map(A1 => n_119, A2 => n_118, A3 => n_113, B1 => n_127, B2 => n_126, ZN => n_128);
  g7828 : AOI211D0BWP7T port map(A1 => n_124, A2 => x_addr(0), B => n_120, C => n_62, ZN => n_125);
  g7830 : ND2D4BWP7T port map(A1 => n_122, A2 => n_65, ZN => jumps(1));
  g7848 : CKAN2D4BWP7T port map(A1 => n_108, A2 => y_addr(2), Z => jumps(6));
  g7846 : CKAN2D4BWP7T port map(A1 => n_109, A2 => y_addr(2), Z => jumps(0));
  g7839 : OR2D4BWP7T port map(A1 => n_105, A2 => n_46, Z => jumps(4));
  g7833 : OR2D4BWP7T port map(A1 => n_102, A2 => n_40, Z => jumps(2));
  g7834 : OAI31D0BWP7T port map(A1 => n_104, A2 => n_47, A3 => n_110, B => n_106, ZN => n_135);
  g7831 : OAI31D0BWP7T port map(A1 => n_115, A2 => n_114, A3 => n_117, B => n_73, ZN => n_121);
  g7836 : OAI32D0BWP7T port map(A1 => n_119, A2 => n_118, A3 => n_117, B1 => n_111, B2 => n_76, ZN => n_120);
  g7852 : IND2D0BWP7T port map(A1 => map_select(1), B1 => n_97, ZN => n_126);
  g7851 : INR2D0BWP7T port map(A1 => n_96, B1 => map_select(1), ZN => n_124);
  g7832 : OAI31D0BWP7T port map(A1 => n_115, A2 => n_114, A3 => n_113, B => n_85, ZN => n_116);
  g7844 : MOAI22D0BWP7T port map(A1 => n_111, A2 => n_74, B1 => n_79, B2 => n_127, ZN => n_112);
  g7843 : OAI31D0BWP7T port map(A1 => y_addr(2), A2 => n_110, A3 => n_56, B => n_88, ZN => n_133);
  g7842 : ND2D4BWP7T port map(A1 => n_91, A2 => n_52, ZN => jumps(7));
  g7849 : NR2D0BWP7T port map(A1 => n_107, A2 => n_103, ZN => n_109);
  g7850 : NR2D0BWP7T port map(A1 => n_107, A2 => n_100, ZN => n_108);
  g7845 : AOI32D0BWP7T port map(A1 => n_87, A2 => n_90, A3 => n_86, B1 => n_57, B2 => n_28, ZN => n_106);
  g7847 : AOI22D0BWP7T port map(A1 => n_68, A2 => n_127, B1 => n_89, B2 => n_83, ZN => n_122);
  g7840 : NR3D0BWP7T port map(A1 => n_101, A2 => n_104, A3 => n_103, ZN => n_105);
  g7841 : NR3D0BWP7T port map(A1 => n_101, A2 => n_104, A3 => n_100, ZN => n_102);
  g7854 : OR2D4BWP7T port map(A1 => n_98, A2 => n_69, Z => jumps(3));
  g7857 : ND2D4BWP7T port map(A1 => n_84, A2 => n_42, ZN => jumps(5));
  g7872 : OAI22D0BWP7T port map(A1 => n_95, A2 => n_92, B1 => n_93, B2 => n_94, ZN => n_97);
  g7873 : OAI22D0BWP7T port map(A1 => n_95, A2 => n_94, B1 => n_93, B2 => n_92, ZN => n_96);
  g7853 : AOI32D0BWP7T port map(A1 => n_67, A2 => n_90, A3 => n_13, B1 => n_89, B2 => n_70, ZN => n_91);
  g7856 : AOI32D0BWP7T port map(A1 => n_87, A2 => n_66, A3 => n_86, B1 => n_50, B2 => n_64, ZN => n_88);
  g7855 : IND4D0BWP7T port map(A1 => n_77, B1 => x_addr(0), B2 => n_78, B3 => n_72, ZN => n_85);
  g7858 : ND2D0BWP7T port map(A1 => n_71, A2 => n_83, ZN => n_84);
  g7874 : MAOI22D0BWP7T port map(A1 => n_82, A2 => n_54, B1 => n_35, B2 => y_addr(4), ZN => n_107);
  g7877 : AOI32D0BWP7T port map(A1 => n_36, A2 => n_9, A3 => n_10, B1 => n_82, B2 => n_63, ZN => n_101);
  g7865 : OA21D0BWP7T port map(A1 => n_75, A2 => n_1, B => n_80, Z => n_81);
  g7862 : INR3D0BWP7T port map(A1 => n_78, B1 => n_60, B2 => n_77, ZN => n_79);
  g7859 : OA21D0BWP7T port map(A1 => n_75, A2 => x_addr(4), B => n_74, Z => n_76);
  g7868 : IND4D0BWP7T port map(A1 => n_61, B1 => x_addr(0), B2 => n_41, B3 => n_72, ZN => n_73);
  g7867 : AN2D1BWP7T port map(A1 => n_71, A2 => n_70, Z => n_98);
  g7871 : NR3D0BWP7T port map(A1 => n_75, A2 => n_129, A3 => n_49, ZN => n_69);
  g7870 : AN3D0BWP7T port map(A1 => n_67, A2 => n_66, A3 => n_86, Z => n_68);
  g7869 : IND3D0BWP7T port map(A1 => n_111, B1 => n_26, B2 => n_51, ZN => n_65);
  g7875 : AOI32D0BWP7T port map(A1 => n_55, A2 => n_64, A3 => n_63, B1 => n_53, B2 => y_addr(4), ZN => n_113);
  g7863 : NR4D0BWP7T port map(A1 => n_61, A2 => n_60, A3 => n_138, A4 => x_addr(0), ZN => n_62);
  g7885 : INR3D0BWP7T port map(A1 => n_58, B1 => n_45, B2 => n_32, ZN => n_59);
  g7866 : OAI21D0BWP7T port map(A1 => n_56, A2 => n_48, B => n_38, ZN => n_57);
  g7876 : AOI32D0BWP7T port map(A1 => n_55, A2 => n_54, A3 => y_addr(2), B1 => n_53, B2 => n_2, ZN => n_117);
  g7882 : ND3D0BWP7T port map(A1 => n_51, A2 => n_83, A3 => n_34, ZN => n_52);
  g7883 : OAI32D0BWP7T port map(A1 => n_49, A2 => n_15, A3 => n_111, B1 => n_48, B2 => n_47, ZN => n_50);
  g7878 : NR3D0BWP7T port map(A1 => n_61, A2 => n_39, A3 => n_45, ZN => n_46);
  g7881 : AOI21D0BWP7T port map(A1 => n_25, A2 => n_45, B => n_56, ZN => n_71);
  g7864 : ND3D0BWP7T port map(A1 => n_51, A2 => n_70, A3 => n_37, ZN => n_42);
  g7886 : AOI211D0BWP7T port map(A1 => n_41, A2 => y_addr(2), B => n_47, C => y_addr(4), ZN => n_89);
  g7893 : OA21D0BWP7T port map(A1 => n_27, A2 => n_103, B => n_24, Z => n_95);
  g7889 : OAI21D0BWP7T port map(A1 => n_31, A2 => n_4, B => n_127, ZN => n_118);
  g7884 : NR3D0BWP7T port map(A1 => n_39, A2 => n_30, A3 => n_16, ZN => n_40);
  g7879 : IND4D0BWP7T port map(A1 => n_111, B1 => y_addr(4), B2 => n_37, B3 => n_36, ZN => n_38);
  g7888 : OAI211D0BWP7T port map(A1 => n_14, A2 => n_8, B => n_36, C => n_34, ZN => n_35);
  g7887 : INVD0BWP7T port map(I => n_51, ZN => n_75);
  g7861 : NR4D0BWP7T port map(A1 => n_32, A2 => n_21, A3 => n_45, A4 => x_addr(3), ZN => n_33);
  g7901 : IND2D0BWP7T port map(A1 => n_31, B1 => n_22, ZN => n_72);
  g7897 : OAI22D0BWP7T port map(A1 => n_30, A2 => n_20, B1 => n_19, B2 => n_138, ZN => n_67);
  g7890 : AOI21D0BWP7T port map(A1 => n_29, A2 => n_5, B => n_119, ZN => n_82);
  g7894 : AOI32D0BWP7T port map(A1 => n_3, A2 => y_addr(2), A3 => y_addr(1), B1 => n_23, B2 => n_12, ZN => n_77);
  g7880 : NR3D0BWP7T port map(A1 => n_32, A2 => n_100, A3 => y_addr(2), ZN => n_43);
  g7902 : INR2D0BWP7T port map(A1 => n_29, B1 => n_17, ZN => n_114);
  g7896 : OAI32D0BWP7T port map(A1 => n_28, A2 => y_addr(3), A3 => n_103, B1 => n_63, B2 => n_30, ZN => n_53);
  g7899 : IND2D0BWP7T port map(A1 => n_27, B1 => n_55, ZN => n_93);
  g7898 : ND3D0BWP7T port map(A1 => n_36, A2 => n_26, A3 => y_addr(4), ZN => n_56);
  g7892 : NR2D0BWP7T port map(A1 => n_32, A2 => n_25, ZN => n_51);
  g7907 : ND3D0BWP7T port map(A1 => n_23, A2 => n_54, A3 => map_select(0), ZN => n_24);
  g7903 : ND2D0BWP7T port map(A1 => n_18, A2 => n_22, ZN => n_58);
  g7911 : OAI21D0BWP7T port map(A1 => n_21, A2 => n_74, B => n_94, ZN => n_66);
  g7908 : OAI21D0BWP7T port map(A1 => n_20, A2 => y_addr(2), B => n_19, ZN => n_87);
  g7909 : INR2D0BWP7T port map(A1 => n_18, B1 => n_17, ZN => n_60);
  g7910 : OAI21D0BWP7T port map(A1 => n_21, A2 => n_49, B => n_92, ZN => n_90);
  g7905 : IND2D0BWP7T port map(A1 => n_16, B1 => n_28, ZN => n_61);
  g7934 : NR2D0BWP7T port map(A1 => n_49, A2 => n_6, ZN => n_31);
  g7900 : INR2D0BWP7T port map(A1 => n_129, B1 => n_70, ZN => n_110);
  g7904 : IND2D0BWP7T port map(A1 => n_15, B1 => n_26, ZN => n_47);
  g7891 : NR3D0BWP7T port map(A1 => n_30, A2 => y_addr(3), A3 => y_addr(4), ZN => n_144);
  g7912 : AOI22D0BWP7T port map(A1 => n_26, A2 => n_11, B1 => n_37, B2 => n_14, ZN => n_39);
  g7914 : INVD0BWP7T port map(I => n_13, ZN => n_115);
  g7933 : IND2D0BWP7T port map(A1 => n_7, B1 => n_37, ZN => n_18);
  g7920 : ND2D0BWP7T port map(A1 => n_64, A2 => y_addr(3), ZN => n_19);
  g7918 : ND2D0BWP7T port map(A1 => n_78, A2 => n_12, ZN => n_16);
  g7922 : NR2D0BWP7T port map(A1 => n_119, A2 => n_127, ZN => n_13);
  g7921 : IND2D0BWP7T port map(A1 => n_11, B1 => n_10, ZN => n_94);
  g7913 : ND3D0BWP7T port map(A1 => n_12, A2 => y_addr(4), A3 => map_select(1), ZN => n_32);
  g7923 : INR2D0BWP7T port map(A1 => n_12, B1 => map_select(1), ZN => n_36);
  g7925 : IND2D0BWP7T port map(A1 => n_11, B1 => n_127, ZN => n_111);
  g7906 : OAI21D0BWP7T port map(A1 => n_8, A2 => x_addr(2), B => n_7, ZN => n_9);
  g7930 : ND2D0BWP7T port map(A1 => n_64, A2 => n_12, ZN => n_27);
  g7931 : IND2D0BWP7T port map(A1 => n_11, B1 => n_26, ZN => n_22);
  g7929 : IND2D0BWP7T port map(A1 => n_11, B1 => n_37, ZN => n_29);
  g7935 : INR2D0BWP7T port map(A1 => n_26, B1 => n_6, ZN => n_17);
  g7895 : ND4D0BWP7T port map(A1 => n_132, A2 => y_addr(2), A3 => y_addr(4), A4 => y_addr(3), ZN => n_148);
  g7916 : INVD0BWP7T port map(I => n_30, ZN => n_23);
  g7915 : INVD0BWP7T port map(I => n_83, ZN => n_48);
  g7936 : ND2D0BWP7T port map(A1 => n_100, A2 => n_45, ZN => n_55);
  g7917 : ND2D0BWP7T port map(A1 => n_26, A2 => x_addr(2), ZN => n_5);
  g7928 : INR2D0BWP7T port map(A1 => n_26, B1 => n_7, ZN => n_4);
  g7919 : IND2D0BWP7T port map(A1 => map_select(1), B1 => n_3, ZN => n_15);
  g7938 : IND2D0BWP7T port map(A1 => n_7, B1 => x_addr(0), ZN => n_129);
  g7942 : INVD0BWP7T port map(I => n_37, ZN => n_49);
  g7927 : ND2D0BWP7T port map(A1 => n_138, A2 => n_28, ZN => n_30);
  g7952 : INVD0BWP7T port map(I => n_54, ZN => n_20);
  g7932 : MAOI22D0BWP7T port map(A1 => n_28, A2 => y_addr(1), B1 => y_addr(1), B2 => n_28, ZN => n_25);
  g7937 : IND2D0BWP7T port map(A1 => n_7, B1 => n_34, ZN => n_92);
  g7954 : INVD0BWP7T port map(I => n_64, ZN => n_104);
  g7924 : NR2D0BWP7T port map(A1 => n_21, A2 => x_addr(0), ZN => n_70);
  g7926 : NR2D0BWP7T port map(A1 => n_21, A2 => n_127, ZN => n_83);
  g7940 : INVD0BWP7T port map(I => n_34, ZN => n_74);
  g7962 : NR2D0BWP7T port map(A1 => y_addr(3), A2 => n_2, ZN => n_54);
  g7964 : NR2D0BWP7T port map(A1 => y_addr(4), A2 => n_28, ZN => n_64);
  g7956 : INVD0BWP7T port map(I => n_132, ZN => n_45);
  g7960 : INR2D0BWP7T port map(A1 => map_select(0), B1 => n_63, ZN => n_12);
  g7951 : NR2D0BWP7T port map(A1 => x_addr(3), A2 => n_1, ZN => n_37);
  g7939 : INVD0BWP7T port map(I => n_80, ZN => n_10);
  g7941 : INVD0BWP7T port map(I => n_138, ZN => n_41);
  g7943 : ND2D0BWP7T port map(A1 => n_14, A2 => x_addr(1), ZN => n_6);
  g7955 : INVD0BWP7T port map(I => n_86, ZN => n_119);
  g7961 : IND2D0BWP7T port map(A1 => x_addr(1), B1 => n_14, ZN => n_11);
  g7945 : INR2D0BWP7T port map(A1 => map_select(0), B1 => y_addr(3), ZN => n_3);
  g7947 : ND2D0BWP7T port map(A1 => x_addr(3), A2 => x_addr(4), ZN => n_80);
  g7948 : NR2D0BWP7T port map(A1 => x_addr(3), A2 => x_addr(4), ZN => n_34);
  g7958 : ND2D0BWP7T port map(A1 => y_addr(1), A2 => y_addr(0), ZN => n_103);
  g7949 : NR2D0BWP7T port map(A1 => y_addr(1), A2 => y_addr(0), ZN => n_138);
  g7950 : INR2D0BWP7T port map(A1 => x_addr(3), B1 => x_addr(4), ZN => n_26);
  g7944 : NR2D0BWP7T port map(A1 => x_addr(0), A2 => x_addr(1), ZN => n_8);
  g7957 : INR2D0BWP7T port map(A1 => map_select(1), B1 => y_addr(4), ZN => n_78);
  g7966 : INR2D0BWP7T port map(A1 => y_addr(0), B1 => y_addr(1), ZN => n_132);
  g7946 : IND2D0BWP7T port map(A1 => y_addr(0), B1 => y_addr(1), ZN => n_100);
  g7965 : INR2D0BWP7T port map(A1 => map_select(1), B1 => map_select(0), ZN => n_86);
  g7959 : IND2D0BWP7T port map(A1 => x_addr(1), B1 => x_addr(2), ZN => n_7);
  g7963 : ND2D0BWP7T port map(A1 => x_addr(2), A2 => x_addr(1), ZN => n_21);
  g7970 : INVD0BWP7T port map(I => y_addr(3), ZN => n_63);
  g7969 : INVD0BWP7T port map(I => x_addr(2), ZN => n_14);
  g7968 : INVD0BWP7T port map(I => y_addr(2), ZN => n_28);
  g7971 : INVD0BWP7T port map(I => y_addr(4), ZN => n_2);
  g7967 : INVD0BWP7T port map(I => x_addr(4), ZN => n_1);
  g7972 : INVD0BWP7T port map(I => x_addr(0), ZN => n_127);
  g2 : IND2D1BWP7T port map(A1 => n_21, B1 => n_43, ZN => n_168);

end synthesised;
