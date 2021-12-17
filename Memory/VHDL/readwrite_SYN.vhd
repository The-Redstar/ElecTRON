
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of readwrite is

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component AO32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D4BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component CKXOR2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  signal state : std_logic_vector(5 downto 0);
  signal n_0, n_1, n_2, n_3, n_4 : std_logic;
  signal n_5, n_6, n_7, n_8, n_9 : std_logic;
  signal n_10, n_11, n_12, n_13, n_14 : std_logic;
  signal n_15, n_16, n_17, n_18, n_19 : std_logic;
  signal n_20, n_21, n_22, n_23, n_24 : std_logic;
  signal n_25, n_26, n_27, n_28, n_29 : std_logic;
  signal n_30, n_31, n_32, n_33, n_34 : std_logic;
  signal n_35, n_36, n_37, n_38, n_39 : std_logic;
  signal n_40, n_41, n_42, n_43, n_44 : std_logic;
  signal n_45, n_46, n_47, n_48, n_51 : std_logic;
  signal n_52, n_53, n_54, n_55, n_60 : std_logic;
  signal n_62, n_63, n_64, n_65, n_66 : std_logic;
  signal n_67, n_68, n_69, n_70, n_71 : std_logic;
  signal n_72, n_73, n_74, n_75, n_76 : std_logic;
  signal n_77, n_78, n_79, n_80, n_81 : std_logic;
  signal n_82, n_83, n_84, n_85, n_86 : std_logic;
  signal n_87, n_88, n_89, n_90, n_91 : std_logic;
  signal n_92, n_93, n_94, n_95, n_96 : std_logic;
  signal n_97, n_98, n_99, n_100, n_101 : std_logic;
  signal n_102, n_103, n_104, n_105, n_106 : std_logic;
  signal n_107, n_108 : std_logic;

begin

  state_reg_3 : DFQD1BWP7T port map(CP => clk, D => n_108, Q => state(3));
  g2829 : IND4D0BWP7T port map(A1 => n_92, B1 => n_94, B2 => n_89, B3 => n_102, ZN => n_108);
  g2831 : OAI211D1BWP7T port map(A1 => rstIN, A2 => n_60, B => n_105, C => n_79, ZN => n_107);
  g2832 : IND3D1BWP7T port map(A1 => n_93, B1 => n_81, B2 => n_105, ZN => n_106);
  g2826 : IND4D0BWP7T port map(A1 => n_99, B1 => n_84, B2 => n_97, B3 => n_101, ZN => n_104);
  g2824 : IND3D1BWP7T port map(A1 => n_96, B1 => n_100, B2 => n_82, ZN => n_103);
  g2835 : AOI31D0BWP7T port map(A1 => n_83, A2 => n_63, A3 => state(2), B => n_98, ZN => n_102);
  g2834 : AOI31D0BWP7T port map(A1 => n_87, A2 => n_69, A3 => state(2), B => n_86, ZN => n_101);
  g2840 : IAO21D0BWP7T port map(A1 => n_100, A2 => n_88, B => n_99, ZN => n_105);
  g2837 : NR2XD0BWP7T port map(A1 => n_97, A2 => n_95, ZN => n_98);
  g2830 : OAI222D0BWP7T port map(A1 => n_73, A2 => n_62, B1 => n_95, B2 => n_94, C1 => n_36, C2 => n_80, ZN => n_96);
  g2841 : MOAI22D0BWP7T port map(A1 => n_91, A2 => n_95, B1 => n_90, B2 => n_40, ZN => n_93);
  g2842 : MOAI22D0BWP7T port map(A1 => n_91, A2 => n_85, B1 => n_90, B2 => n_42, ZN => n_92);
  g2845 : AOI22D0BWP7T port map(A1 => n_75, A2 => n_88, B1 => n_87, B2 => n_39, ZN => n_89);
  g2843 : MOAI22D0BWP7T port map(A1 => n_74, A2 => n_88, B1 => n_90, B2 => n_72, ZN => n_86);
  g2846 : NR2XD0BWP7T port map(A1 => n_94, A2 => n_85, ZN => n_99);
  g2847 : MAOI22D0BWP7T port map(A1 => n_83, A2 => n_65, B1 => n_100, B2 => n_76, ZN => n_84);
  g2848 : OA21D0BWP7T port map(A1 => n_71, A2 => n_88, B => n_82, Z => n_97);
  g2844 : MAOI22D0BWP7T port map(A1 => n_83, A2 => n_45, B1 => n_80, B2 => n_21, ZN => n_81);
  g2836 : AOI22D0BWP7T port map(A1 => n_87, A2 => n_25, B1 => n_90, B2 => n_35, ZN => n_79);
  g2839 : AO32D1BWP7T port map(A1 => n_83, A2 => n_51, A3 => n_64, B1 => n_87, B2 => state(5), Z => n_78);
  g2849 : ND2D1BWP7T port map(A1 => n_77, A2 => n_88, ZN => n_82);
  g2851 : ND2D1BWP7T port map(A1 => n_77, A2 => n_76, ZN => n_94);
  g2855 : INVD0BWP7T port map(I => n_74, ZN => n_75);
  g2838 : AOI31D0BWP7T port map(A1 => n_83, A2 => n_72, A3 => state(3), B => n_87, ZN => n_73);
  g2852 : OR2D1BWP7T port map(A1 => n_71, A2 => n_76, Z => n_91);
  g2858 : ND2D1BWP7T port map(A1 => n_70, A2 => n_68, ZN => n_74);
  g2860 : ND2D1BWP7T port map(A1 => n_70, A2 => n_66, ZN => n_100);
  g2850 : ND2D1BWP7T port map(A1 => n_83, A2 => state(0), ZN => n_80);
  g2853 : INR2D1BWP7T port map(A1 => n_83, B1 => n_69, ZN => n_90);
  g2854 : INR2D1BWP7T port map(A1 => n_83, B1 => state(0), ZN => n_87);
  g2856 : NR2D1BWP7T port map(A1 => n_67, A2 => n_68, ZN => n_77);
  g2857 : OR2D1BWP7T port map(A1 => n_67, A2 => n_66, Z => n_71);
  g2859 : INVD0BWP7T port map(I => n_95, ZN => n_85);
  g2861 : NR4D0BWP7T port map(A1 => n_48, A2 => n_9, A3 => n_0, A4 => n_15, ZN => n_95);
  g2874 : AO221D0BWP7T port map(A1 => n_44, A2 => n_64, B1 => n_63, B2 => n_62, C => n_52, Z => n_65);
  g2865 : NR2XD0BWP7T port map(A1 => n_54, A2 => WEIN, ZN => n_70);
  g2862 : NR3D0BWP7T port map(A1 => readyOUT, A2 => n_47, A3 => rstIN, ZN => n_83);
  g2863 : ND2D1BWP7T port map(A1 => readyOUT, A2 => GOTOIN, ZN => n_60);
  g2864 : ND2D1BWP7T port map(A1 => n_53, A2 => WEIN, ZN => n_67);
  g2877 : ND2D4BWP7T port map(A1 => n_38, A2 => n_37, ZN => YincrMEM);
  g2878 : OR2D4BWP7T port map(A1 => n_41, A2 => n_55, Z => XincrMEM);
  g2867 : OR2D4BWP7T port map(A1 => n_43, A2 => state(5), Z => MEMEM);
  g2891 : OR2D4BWP7T port map(A1 => n_55, A2 => n_27, Z => WincrMEM);
  g2866 : INVD0BWP7T port map(I => n_53, ZN => n_54);
  g2883 : OA21D0BWP7T port map(A1 => n_51, A2 => n_33, B => state(1), Z => n_52);
  g2871 : INVD0BWP7T port map(I => n_66, ZN => n_68);
  g2872 : CKND1BWP7T port map(I => n_88, ZN => n_76);
  g2881 : ND2D4BWP7T port map(A1 => n_34, A2 => n_24, ZN => WEMEM);
  g2868 : AN2D4BWP7T port map(A1 => n_46, A2 => state(0), Z => rstMEM);
  g2876 : ND4D0BWP7T port map(A1 => n_28, A2 => n_4, A3 => n_3, A4 => n_17, ZN => n_88);
  g2873 : ND4D0BWP7T port map(A1 => n_29, A2 => n_8, A3 => n_6, A4 => n_12, ZN => n_48);
  g2869 : INR2XD0BWP7T port map(A1 => n_47, B1 => rstIN, ZN => n_53);
  g2875 : NR4D0BWP7T port map(A1 => n_30, A2 => n_18, A3 => n_16, A4 => n_10, ZN => n_66);
  g2870 : AN2D4BWP7T port map(A1 => n_46, A2 => n_19, Z => readyOUT);
  g2882 : IOA21D1BWP7T port map(A1 => n_22, A2 => n_44, B => n_32, ZN => n_45);
  g2885 : AO22D0BWP7T port map(A1 => n_51, A2 => n_42, B1 => n_64, B2 => n_63, Z => n_43);
  g2889 : MOAI22D0BWP7T port map(A1 => n_40, A2 => state(4), B1 => n_39, B2 => n_62, ZN => n_41);
  g2892 : AOI22D0BWP7T port map(A1 => n_39, A2 => n_31, B1 => n_42, B2 => n_20, ZN => n_38);
  g2894 : CKND1BWP7T port map(I => n_37, ZN => n_55);
  g2884 : AOI21D0BWP7T port map(A1 => n_11, A2 => n_23, B => n_64, ZN => n_36);
  g2880 : NR4D0BWP7T port map(A1 => n_26, A2 => state(3), A3 => state(4), A4 => state(5), ZN => n_46);
  g2879 : INR4D0BWP7T port map(A1 => n_35, B1 => state(4), B2 => state(3), B3 => n_62, ZN => n_47);
  g2890 : OAI21D0BWP7T port map(A1 => n_64, A2 => state(5), B => state(0), ZN => n_34);
  g2893 : INVD0BWP7T port map(I => n_32, ZN => n_33);
  g2906 : ND2D1BWP7T port map(A1 => n_44, A2 => n_31, ZN => n_37);
  g2886 : CKND2D1BWP7T port map(A1 => n_14, A2 => n_13, ZN => n_30);
  g2887 : NR2XD0BWP7T port map(A1 => n_5, A2 => n_1, ZN => n_29);
  g2888 : NR2XD0BWP7T port map(A1 => n_7, A2 => n_2, ZN => n_28);
  g2896 : CKAN2D1BWP7T port map(A1 => n_39, A2 => n_26, Z => n_27);
  g2900 : OR2D1BWP7T port map(A1 => n_42, A2 => n_69, Z => n_25);
  g2905 : ND2D1BWP7T port map(A1 => n_35, A2 => state(4), ZN => n_32);
  g2897 : ND2D1BWP7T port map(A1 => n_69, A2 => n_23, ZN => n_24);
  g2903 : OAI21D0BWP7T port map(A1 => n_72, A2 => state(0), B => state(1), ZN => n_22);
  g2904 : AOI21D0BWP7T port map(A1 => n_20, A2 => state(2), B => state(3), ZN => n_21);
  g2926 : INVD0BWP7T port map(I => n_26, ZN => n_31);
  g2927 : INVD0BWP7T port map(I => n_64, ZN => n_40);
  g2907 : NR2XD0BWP7T port map(A1 => n_69, A2 => state(0), ZN => n_51);
  g2908 : NR2XD0BWP7T port map(A1 => n_69, A2 => n_19, ZN => n_63);
  g2901 : CKXOR2D0BWP7T port map(A1 => curX(1), A2 => AddressIN(1), Z => n_18);
  g2919 : XNR2D1BWP7T port map(A1 => AddressIN(5), A2 => curY(0), ZN => n_17);
  g2917 : CKXOR2D0BWP7T port map(A1 => curX(0), A2 => AddressIN(0), Z => n_16);
  g2895 : CKXOR2D0BWP7T port map(A1 => curW(7), A2 => WriteIN(7), Z => n_15);
  g2898 : XNR2D1BWP7T port map(A1 => AddressIN(3), A2 => curX(3), ZN => n_14);
  g2899 : XNR2D1BWP7T port map(A1 => AddressIN(4), A2 => curX(4), ZN => n_13);
  g2912 : XNR2D1BWP7T port map(A1 => WriteIN(0), A2 => curW(0), ZN => n_12);
  g2902 : OAI21D0BWP7T port map(A1 => state(3), A2 => state(1), B => state(4), ZN => n_11);
  g2909 : CKXOR2D0BWP7T port map(A1 => curX(2), A2 => AddressIN(2), Z => n_10);
  g2910 : CKXOR2D0BWP7T port map(A1 => curW(6), A2 => WriteIN(6), Z => n_9);
  g2911 : XNR2D1BWP7T port map(A1 => WriteIN(1), A2 => curW(1), ZN => n_8);
  g2931 : NR2XD0BWP7T port map(A1 => n_72, A2 => state(1), ZN => n_64);
  g2921 : CKXOR2D0BWP7T port map(A1 => curY(3), A2 => AddressIN(8), Z => n_7);
  g2913 : XNR2D1BWP7T port map(A1 => WriteIN(2), A2 => curW(2), ZN => n_6);
  g2915 : CKXOR2D0BWP7T port map(A1 => curW(3), A2 => WriteIN(3), Z => n_5);
  g2916 : XNR2D1BWP7T port map(A1 => AddressIN(7), A2 => curY(2), ZN => n_4);
  g2918 : XNR2D1BWP7T port map(A1 => AddressIN(6), A2 => curY(1), ZN => n_3);
  g2920 : CKXOR2D1BWP7T port map(A1 => AddressIN(9), A2 => curY(4), Z => n_2);
  g2914 : CKXOR2D1BWP7T port map(A1 => WriteIN(4), A2 => curW(4), Z => n_1);
  g2922 : CKXOR2D0BWP7T port map(A1 => curW(5), A2 => WriteIN(5), Z => n_0);
  g2929 : ND2D1BWP7T port map(A1 => n_62, A2 => n_72, ZN => n_26);
  g2923 : NR2XD0BWP7T port map(A1 => n_19, A2 => state(2), ZN => n_35);
  g2924 : NR2XD0BWP7T port map(A1 => n_20, A2 => state(3), ZN => n_44);
  g2925 : NR2D1BWP7T port map(A1 => n_72, A2 => n_62, ZN => n_42);
  g2928 : INR2D1BWP7T port map(A1 => state(3), B1 => state(4), ZN => n_39);
  g2930 : ND2D1BWP7T port map(A1 => state(3), A2 => state(4), ZN => n_69);
  state_reg_0 : DFD1BWP7T port map(CP => clk, D => n_107, Q => state(0), QN => n_19);
  state_reg_1 : DFD1BWP7T port map(CP => clk, D => n_103, Q => state(1), QN => n_62);
  state_reg_5 : DFD1BWP7T port map(CP => clk, D => n_78, Q => state(5), QN => n_23);
  state_reg_4 : DFD1BWP7T port map(CP => clk, D => n_106, Q => state(4), QN => n_20);
  state_reg_2 : DFD1BWP7T port map(CP => clk, D => n_104, Q => state(2), QN => n_72);

end synthesised;
