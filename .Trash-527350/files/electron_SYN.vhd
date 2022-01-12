
library ieee;
use ieee.std_logic_1164.all;
--library tcb018gbwp7t;
--use tcb018gbwp7t.all;

architecture synthesised of electron is

  component input_buffer
    port(clk       : in  std_logic;
         rst       : in  std_logic;
         dir_in    : in  std_logic_vector(3 downto 0);
         dir_out   : out std_logic_vector(3 downto 0);
         start_in  : in  std_logic;
         start_out : out std_logic);
  end component;

  component NR4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component ND4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; ZN : out std_logic);
  end component;

  component NR3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component MOAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component ND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKXOR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component MAOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component XNR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component CKND2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component IOA21D1BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component INR2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component MUX2D1BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component CKMUX2D1BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component OR2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component DFD0BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component INVD4BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AO221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component IINR4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component DFKSND0BWP7T
    port(CP, D, SN : in std_logic; Q, QN : out std_logic);
  end component;

  component INR3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AOI211D1BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component IND4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component ND3D0BWP7T
    port(A1, A2, A3 : in std_logic; ZN : out std_logic);
  end component;

  component IND3D1BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component DFKSND1BWP7T
    port(CP, D, SN : in std_logic; Q, QN : out std_logic);
  end component;

  component IND2D1BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component INR2XD0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component AOI211XD0BWP7T
    port(A1, A2, B, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component AN4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AOI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component INVD0BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component NR2XD0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component NR2D1BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component AN2D0BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component INR4D0BWP7T
    port(A1, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component DFXQD1BWP7T
    port(CP, DA, DB, SA : in std_logic; Q : out std_logic);
  end component;

  component DFKCNQD1BWP7T
    port(CP, CN, D : in std_logic; Q : out std_logic);
  end component;

  component DFQD1BWP7T
    port(CP, D : in std_logic; Q : out std_logic);
  end component;

  component OAI32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI31D0BWP7T
    port(A1, A2, A3, B : in std_logic; ZN : out std_logic);
  end component;

  component OAI22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component AOI21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component CKND1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component AO21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component INVD1BWP7T
    port(I : in std_logic; ZN : out std_logic);
  end component;

  component IND3D0BWP7T
    port(A1, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component OA32D1BWP7T
    port(A1, A2, A3, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component DFKCND1BWP7T
    port(CP, CN, D : in std_logic; Q, QN : out std_logic);
  end component;

  component DFD1BWP7T
    port(CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component AO22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component ND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OAI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component NR2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component IAO21D0BWP7T
    port(A1, A2, B : in std_logic; ZN : out std_logic);
  end component;

  component AN4D0BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AOI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component OR4XD1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component AN3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AOI221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; ZN : out std_logic);
  end component;

  component AOI33D1BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component OAI33D1BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; ZN : out std_logic);
  end component;

  component MAOI222D1BWP7T
    port(A, B, C : in std_logic; ZN : out std_logic);
  end component;

  component OA211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component OA221D0BWP7T
    port(A1, A2, B1, B2, C : in std_logic; Z : out std_logic);
  end component;

  component OA22D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; Z : out std_logic);
  end component;

  component OA31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component AO211D0BWP7T
    port(A1, A2, B, C : in std_logic; Z : out std_logic);
  end component;

  component CKND2D0BWP7T
    port(A1, A2 : in std_logic; ZN : out std_logic);
  end component;

  component OA33D0BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; Z : out std_logic);
  end component;

  component HA1D0BWP7T
    port(A, B : in std_logic; CO, S : out std_logic);
  end component;

  component AO33D0BWP7T
    port(A1, A2, A3, B1, B2, B3 : in std_logic; Z : out std_logic);
  end component;

  component OA21D0BWP7T
    port(A1, A2, B : in std_logic; Z : out std_logic);
  end component;

  component MUX2ND0BWP7T
    port(I0, I1, S : in std_logic; ZN : out std_logic);
  end component;

  component LNQD1BWP7T
    port(EN, D : in std_logic; Q : out std_logic);
  end component;

  component OAI222D0BWP7T
    port(A1, A2, B1, B2, C1, C2 : in std_logic; ZN : out std_logic);
  end component;

  component AN3D0BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component OR3XD1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component CKAN2D1BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component MUX2D0BWP7T
    port(I0, I1, S : in std_logic; Z : out std_logic);
  end component;

  component IIND4D0BWP7T
    port(A1, A2, B1, B2 : in std_logic; ZN : out std_logic);
  end component;

  component EDFKCNQD1BWP7T
    port(CP, CN, D, E : in std_logic; Q : out std_logic);
  end component;

  component OR3D1BWP7T
    port(A1, A2, A3 : in std_logic; Z : out std_logic);
  end component;

  component AN2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR2D4BWP7T
    port(A1, A2 : in std_logic; Z : out std_logic);
  end component;

  component OR4D4BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  component DFCNQD1BWP7T
    port(CDN, CP, D : in std_logic; Q : out std_logic);
  end component;

  component IND2D0BWP7T
    port(A1, B1 : in std_logic; ZN : out std_logic);
  end component;

  component EDFCND1BWP7T
    port(CDN, CP, D, E : in std_logic; Q, QN : out std_logic);
  end component;

  component DFCND1BWP7T
    port(CDN, CP, D : in std_logic; Q, QN : out std_logic);
  end component;

  component AO31D1BWP7T
    port(A1, A2, A3, B : in std_logic; Z : out std_logic);
  end component;

  component OR4D1BWP7T
    port(A1, A2, A3, A4 : in std_logic; Z : out std_logic);
  end component;

  signal direction_between : std_logic_vector(3 downto 0);
  signal position_0 : std_logic_vector(10 downto 0);
  signal position_1 : std_logic_vector(10 downto 0);
  signal lbl2_x_vec : std_logic_vector(4 downto 0);
  signal lbl2_h_count : std_logic_vector(9 downto 0);
  signal lbl2_v_count : std_logic_vector(9 downto 0);
  signal direction_0 : std_logic_vector(1 downto 0);
  signal direction_1 : std_logic_vector(1 downto 0);
  signal player_state_0 : std_logic_vector(1 downto 0);
  signal player_state_1 : std_logic_vector(1 downto 0);
  signal lbl2_pixelator_color : std_logic_vector(3 downto 0);
  signal lbl2_sidebar_color : std_logic_vector(3 downto 0);
  signal game_state : std_logic_vector(2 downto 0);
  signal lbl2_borders_synced : std_logic_vector(7 downto 0);
  signal borders : std_logic_vector(7 downto 0);
  signal lbl2_data_synced : std_logic_vector(7 downto 0);
  signal lbl2_jumps_synced : std_logic_vector(7 downto 0);
  signal ramps : std_logic_vector(7 downto 0);
  signal lbl2_walls : std_logic_vector(7 downto 0);
  signal lbl0_d_next_position_1 : std_logic_vector(10 downto 0);
  signal lbl0_d_next_position_0 : std_logic_vector(10 downto 0);
  signal lbl0_next_position_0 : std_logic_vector(10 downto 0);
  signal lbl0_next_position_1 : std_logic_vector(10 downto 0);
  signal address : std_logic_vector(9 downto 0);
  signal lbl0_wallshape_0 : std_logic_vector(2 downto 0);
  signal lbl0_wallshape_1 : std_logic_vector(2 downto 0);
  signal write_memory : std_logic_vector(7 downto 0);
  signal lbl0_d_position_1 : std_logic_vector(10 downto 0);
  signal lbl0_state : std_logic_vector(4 downto 0);
  signal lbl0_d_position_0 : std_logic_vector(10 downto 0);
  signal lbl0_d_next_direction_0 : std_logic_vector(1 downto 0);
  signal lbl0_d_next_direction_1 : std_logic_vector(1 downto 0);
  signal lbl0_d_direction_0 : std_logic_vector(1 downto 0);
  signal lbl0_d_direction_1 : std_logic_vector(1 downto 0);
  signal lbl0_counter_busy_counter_state : std_logic_vector(1 downto 0);
  signal lbl0_unsigned_busy_count : std_logic_vector(4 downto 0);
  signal lbl1_cur_y : std_logic_vector(4 downto 0);
  signal lbl1_cm_state : std_logic_vector(4 downto 0);
  signal lbl1_cur_x : std_logic_vector(4 downto 0);
  signal lbl1_cex_state : std_logic_vector(1 downto 0);
  signal lbl1_rw_state : std_logic_vector(5 downto 0);
  signal lbl1_cur_w : std_logic_vector(7 downto 0);
  signal lbl1_cey_state : std_logic_vector(1 downto 0);
  signal UNCONNECTED, UNCONNECTED0, UNCONNECTED1, UNCONNECTED2, UNCONNECTED3 : std_logic;
  signal UNCONNECTED4, busy, clear_memory, go_to, lbl0_busy_counter_reset : std_logic;
  signal lbl0_d_wallshape_0_0_4141, lbl0_d_wallshape_0_1_4142, lbl0_d_wallshape_0_2_4143, lbl0_d_wallshape_1_0_4144, lbl0_d_wallshape_1_1_4145 : std_logic;
  signal lbl0_d_wallshape_1_2_4146, lbl0_n_0, lbl0_n_2, lbl0_n_3, lbl0_n_4 : std_logic;
  signal lbl0_n_5, lbl0_n_6, lbl0_n_7, lbl0_n_8, lbl0_n_9 : std_logic;
  signal lbl0_n_11, lbl0_n_12, lbl0_n_13, lbl0_n_14, lbl0_n_15 : std_logic;
  signal lbl0_n_16, lbl0_n_17, lbl0_n_18, lbl0_n_19, lbl0_n_20 : std_logic;
  signal lbl0_n_21, lbl0_n_22, lbl0_n_23, lbl0_n_24, lbl0_n_25 : std_logic;
  signal lbl0_n_26, lbl0_n_27, lbl0_n_28, lbl0_n_29, lbl0_n_30 : std_logic;
  signal lbl0_n_32, lbl0_n_33, lbl0_n_34, lbl0_n_35, lbl0_n_36 : std_logic;
  signal lbl0_n_37, lbl0_n_38, lbl0_n_39, lbl0_n_40, lbl0_n_41 : std_logic;
  signal lbl0_n_42, lbl0_n_43, lbl0_n_44, lbl0_n_45, lbl0_n_46 : std_logic;
  signal lbl0_n_47, lbl0_n_48, lbl0_n_49, lbl0_n_50, lbl0_n_51 : std_logic;
  signal lbl0_n_52, lbl0_n_53, lbl0_n_54, lbl0_n_55, lbl0_n_56 : std_logic;
  signal lbl0_n_57, lbl0_n_58, lbl0_n_59, lbl0_n_60, lbl0_n_62 : std_logic;
  signal lbl0_n_63, lbl0_n_64, lbl0_n_65, lbl0_n_66, lbl0_n_67 : std_logic;
  signal lbl0_n_68, lbl0_n_69, lbl0_n_70, lbl0_n_71, lbl0_n_72 : std_logic;
  signal lbl0_n_73, lbl0_n_74, lbl0_n_75, lbl0_n_76, lbl0_n_77 : std_logic;
  signal lbl0_n_78, lbl0_n_79, lbl0_n_80, lbl0_n_81, lbl0_n_82 : std_logic;
  signal lbl0_n_84, lbl0_n_85, lbl0_n_86, lbl0_n_87, lbl0_n_88 : std_logic;
  signal lbl0_n_89, lbl0_n_90, lbl0_n_91, lbl0_n_92, lbl0_n_93 : std_logic;
  signal lbl0_n_94, lbl0_n_95, lbl0_n_96, lbl0_n_97, lbl0_n_98 : std_logic;
  signal lbl0_n_100, lbl0_n_101, lbl0_n_102, lbl0_n_103, lbl0_n_104 : std_logic;
  signal lbl0_n_105, lbl0_n_106, lbl0_n_108, lbl0_n_109, lbl0_n_110 : std_logic;
  signal lbl0_n_111, lbl0_n_112, lbl0_n_113, lbl0_n_114, lbl0_n_115 : std_logic;
  signal lbl0_n_116, lbl0_n_117, lbl0_n_118, lbl0_n_119, lbl0_n_120 : std_logic;
  signal lbl0_n_121, lbl0_n_123, lbl0_n_124, lbl0_n_125, lbl0_n_126 : std_logic;
  signal lbl0_n_127, lbl0_n_128, lbl0_n_129, lbl0_n_130, lbl0_n_131 : std_logic;
  signal lbl0_n_132, lbl0_n_133, lbl0_n_134, lbl0_n_135, lbl0_n_136 : std_logic;
  signal lbl0_n_137, lbl0_n_138, lbl0_n_139, lbl0_n_140, lbl0_n_141 : std_logic;
  signal lbl0_n_142, lbl0_n_143, lbl0_n_144, lbl0_n_145, lbl0_n_146 : std_logic;
  signal lbl0_n_147, lbl0_n_148, lbl0_n_149, lbl0_n_150, lbl0_n_151 : std_logic;
  signal lbl0_n_152, lbl0_n_153, lbl0_n_154, lbl0_n_155, lbl0_n_156 : std_logic;
  signal lbl0_n_157, lbl0_n_158, lbl0_n_159, lbl0_n_160, lbl0_n_161 : std_logic;
  signal lbl0_n_162, lbl0_n_163, lbl0_n_164, lbl0_n_165, lbl0_n_166 : std_logic;
  signal lbl0_n_169, lbl0_n_170, lbl0_n_171, lbl0_n_172, lbl0_n_173 : std_logic;
  signal lbl0_n_174, lbl0_n_175, lbl0_n_176, lbl0_n_177, lbl0_n_178 : std_logic;
  signal lbl0_n_179, lbl0_n_180, lbl0_n_181, lbl0_n_182, lbl0_n_183 : std_logic;
  signal lbl0_n_184, lbl0_n_185, lbl0_n_186, lbl0_n_187, lbl0_n_188 : std_logic;
  signal lbl0_n_189, lbl0_n_190, lbl0_n_191, lbl0_n_192, lbl0_n_193 : std_logic;
  signal lbl0_n_194, lbl0_n_195, lbl0_n_196, lbl0_n_197, lbl0_n_198 : std_logic;
  signal lbl0_n_199, lbl0_n_200, lbl0_n_201, lbl0_n_202, lbl0_n_203 : std_logic;
  signal lbl0_n_204, lbl0_n_205, lbl0_n_206, lbl0_n_207, lbl0_n_208 : std_logic;
  signal lbl0_n_209, lbl0_n_210, lbl0_n_211, lbl0_n_212, lbl0_n_213 : std_logic;
  signal lbl0_n_214, lbl0_n_215, lbl0_n_216, lbl0_n_217, lbl0_n_218 : std_logic;
  signal lbl0_n_219, lbl0_n_220, lbl0_n_221, lbl0_n_222, lbl0_n_223 : std_logic;
  signal lbl0_n_224, lbl0_n_225, lbl0_n_226, lbl0_n_227, lbl0_n_228 : std_logic;
  signal lbl0_n_229, lbl0_n_230, lbl0_n_231, lbl0_n_232, lbl0_n_233 : std_logic;
  signal lbl0_n_234, lbl0_n_235, lbl0_n_236, lbl0_n_237, lbl0_n_238 : std_logic;
  signal lbl0_n_239, lbl0_n_240, lbl0_n_241, lbl0_n_242, lbl0_n_243 : std_logic;
  signal lbl0_n_244, lbl0_n_245, lbl0_n_246, lbl0_n_247, lbl0_n_248 : std_logic;
  signal lbl0_n_249, lbl0_n_250, lbl0_n_251, lbl0_n_252, lbl0_n_253 : std_logic;
  signal lbl0_n_254, lbl0_n_255, lbl0_n_256, lbl0_n_257, lbl0_n_258 : std_logic;
  signal lbl0_n_259, lbl0_n_260, lbl0_n_261, lbl0_n_262, lbl0_n_263 : std_logic;
  signal lbl0_n_264, lbl0_n_265, lbl0_n_266, lbl0_n_267, lbl0_n_268 : std_logic;
  signal lbl0_n_269, lbl0_n_270, lbl0_n_271, lbl0_n_272, lbl0_n_273 : std_logic;
  signal lbl0_n_274, lbl0_n_275, lbl0_n_276, lbl0_n_277, lbl0_n_278 : std_logic;
  signal lbl0_n_279, lbl0_n_280, lbl0_n_281, lbl0_n_282, lbl0_n_283 : std_logic;
  signal lbl0_n_284, lbl0_n_285, lbl0_n_286, lbl0_n_287, lbl0_n_288 : std_logic;
  signal lbl0_n_289, lbl0_n_290, lbl0_n_291, lbl0_n_292, lbl0_n_293 : std_logic;
  signal lbl0_n_294, lbl0_n_295, lbl0_n_296, lbl0_n_297, lbl0_n_298 : std_logic;
  signal lbl0_n_299, lbl0_n_300, lbl0_n_301, lbl0_n_302, lbl0_n_303 : std_logic;
  signal lbl0_n_304, lbl0_n_305, lbl0_n_306, lbl0_n_307, lbl0_n_308 : std_logic;
  signal lbl0_n_309, lbl0_n_310, lbl0_n_311, lbl0_n_312, lbl0_n_313 : std_logic;
  signal lbl0_n_314, lbl0_n_315, lbl0_n_316, lbl0_n_317, lbl0_n_318 : std_logic;
  signal lbl0_n_319, lbl0_n_321, lbl0_n_322, lbl0_n_323, lbl0_n_324 : std_logic;
  signal lbl0_n_325, lbl0_n_326, lbl0_n_327, lbl0_n_328, lbl0_n_329 : std_logic;
  signal lbl0_n_335, lbl0_n_336, lbl0_n_360, lbl0_n_361, lbl0_n_362 : std_logic;
  signal lbl0_n_363, lbl0_n_364, lbl0_n_365, lbl0_n_372, lbl0_n_373 : std_logic;
  signal lbl0_n_374, lbl0_n_375, lbl0_n_376, lbl0_n_377, lbl0_n_378 : std_logic;
  signal lbl0_n_379, lbl0_n_380, lbl0_n_381, lbl0_n_382, lbl0_n_383 : std_logic;
  signal lbl0_n_384, lbl0_n_385, lbl0_n_386, lbl0_n_387, lbl0_n_388 : std_logic;
  signal lbl0_n_389, lbl0_n_390, lbl0_n_391, lbl0_n_392, lbl0_n_393 : std_logic;
  signal lbl0_n_396, lbl0_n_397, lbl0_n_402, lbl0_n_403, lbl0_n_404 : std_logic;
  signal lbl0_n_405, lbl0_n_4445_BAR, lbl0_n_4451_BAR, lbl0_reg_dir_0_n_0, lbl0_reg_dir_1_n_0 : std_logic;
  signal lbl0_reg_n_dir_0_n_0, lbl0_reg_n_dir_1_n_0, lbl0_reg_next_pos0_n_1, lbl0_reg_next_pos1_n_1, lbl0_reg_p_state_0_n_0 : std_logic;
  signal lbl0_reg_p_state_1_n_0, lbl0_reg_pos0_n_1, lbl0_reg_pos1_n_1, lbl0_reg_wall_0_n_1, lbl0_reg_wall_1_n_1 : std_logic;
  signal lbl1_cex_n_2, lbl1_cex_n_3, lbl1_cex_n_4, lbl1_cex_n_5, lbl1_cex_n_6 : std_logic;
  signal lbl1_cex_n_7, lbl1_cex_n_8, lbl1_cex_n_9, lbl1_cey_n_2, lbl1_cey_n_3 : std_logic;
  signal lbl1_cey_n_4, lbl1_cey_n_5, lbl1_cey_n_6, lbl1_cey_n_7, lbl1_cey_n_8 : std_logic;
  signal lbl1_cey_n_9, lbl1_clr_rst, lbl1_cm_n_2, lbl1_cm_n_3, lbl1_cm_n_4 : std_logic;
  signal lbl1_cm_n_5, lbl1_cm_n_6, lbl1_cm_n_7, lbl1_cm_n_8, lbl1_cm_n_9 : std_logic;
  signal lbl1_cm_n_10, lbl1_cm_n_11, lbl1_cm_n_12, lbl1_cm_n_13, lbl1_cm_n_14 : std_logic;
  signal lbl1_cm_n_15, lbl1_cm_n_16, lbl1_cm_n_17, lbl1_cm_n_18, lbl1_cm_n_19 : std_logic;
  signal lbl1_cm_n_20, lbl1_cm_n_21, lbl1_cm_n_22, lbl1_cm_n_23, lbl1_cm_n_24 : std_logic;
  signal lbl1_cm_n_25, lbl1_cm_n_26, lbl1_cm_n_27, lbl1_cm_n_28, lbl1_cm_n_31 : std_logic;
  signal lbl1_cm_n_36, lbl1_cw_n_0, lbl1_cw_n_1, lbl1_cw_n_2, lbl1_cw_n_3 : std_logic;
  signal lbl1_cw_n_4, lbl1_cw_n_5, lbl1_cw_n_6, lbl1_cw_n_7, lbl1_cw_n_8 : std_logic;
  signal lbl1_cw_n_9, lbl1_cw_n_10, lbl1_cw_n_11, lbl1_cw_n_12, lbl1_cw_n_13 : std_logic;
  signal lbl1_cw_n_14, lbl1_cx_n_0, lbl1_cx_n_1, lbl1_cx_n_2, lbl1_cx_n_3 : std_logic;
  signal lbl1_cx_n_4, lbl1_cx_n_5, lbl1_cx_n_6, lbl1_cx_n_7, lbl1_cx_n_8 : std_logic;
  signal lbl1_cy_n_0, lbl1_cy_n_1, lbl1_cy_n_2, lbl1_cy_n_3, lbl1_cy_n_4 : std_logic;
  signal lbl1_cy_n_5, lbl1_cy_n_6, lbl1_cy_n_7, lbl1_cy_n_8, lbl1_me_clr : std_logic;
  signal lbl1_me_rw, lbl1_n_1, lbl1_ready_clr, lbl1_ready_rw, lbl1_rw_n_2 : std_logic;
  signal lbl1_rw_n_3, lbl1_rw_n_4, lbl1_rw_n_5, lbl1_rw_n_6, lbl1_rw_n_7 : std_logic;
  signal lbl1_rw_n_8, lbl1_rw_n_9, lbl1_rw_n_10, lbl1_rw_n_11, lbl1_rw_n_12 : std_logic;
  signal lbl1_rw_n_13, lbl1_rw_n_14, lbl1_rw_n_15, lbl1_rw_n_16, lbl1_rw_n_17 : std_logic;
  signal lbl1_rw_n_18, lbl1_rw_n_19, lbl1_rw_n_20, lbl1_rw_n_21, lbl1_rw_n_22 : std_logic;
  signal lbl1_rw_n_23, lbl1_rw_n_24, lbl1_rw_n_25, lbl1_rw_n_26, lbl1_rw_n_27 : std_logic;
  signal lbl1_rw_n_28, lbl1_rw_n_29, lbl1_rw_n_30, lbl1_rw_n_31, lbl1_rw_n_32 : std_logic;
  signal lbl1_rw_n_33, lbl1_rw_n_34, lbl1_rw_n_35, lbl1_rw_n_36, lbl1_rw_n_37 : std_logic;
  signal lbl1_rw_n_38, lbl1_rw_n_39, lbl1_rw_n_40, lbl1_rw_n_41, lbl1_rw_n_42 : std_logic;
  signal lbl1_rw_n_43, lbl1_rw_n_44, lbl1_rw_n_45, lbl1_rw_n_46, lbl1_rw_n_47 : std_logic;
  signal lbl1_rw_n_48, lbl1_rw_n_49, lbl1_rw_n_50, lbl1_rw_n_51, lbl1_rw_n_52 : std_logic;
  signal lbl1_rw_n_53, lbl1_rw_n_54, lbl1_rw_n_55, lbl1_rw_n_56, lbl1_rw_n_57 : std_logic;
  signal lbl1_rw_n_58, lbl1_rw_n_59, lbl1_rw_n_60, lbl1_rw_n_61, lbl1_rw_n_62 : std_logic;
  signal lbl1_rw_n_63, lbl1_rw_n_64, lbl1_rw_n_65, lbl1_rw_n_66, lbl1_rw_n_67 : std_logic;
  signal lbl1_rw_n_68, lbl1_rw_n_69, lbl1_rw_n_70, lbl1_rw_n_71, lbl1_rw_n_72 : std_logic;
  signal lbl1_rw_n_73, lbl1_rw_n_74, lbl1_rw_n_75, lbl1_rw_n_76, lbl1_rw_n_77 : std_logic;
  signal lbl1_rw_n_78, lbl1_rw_n_79, lbl1_rw_n_80, lbl1_rw_n_81, lbl1_rw_n_82 : std_logic;
  signal lbl1_rw_n_83, lbl1_rw_n_84, lbl1_rw_n_91, lbl1_rw_n_93, lbl1_rw_n_94 : std_logic;
  signal lbl1_rw_rst, lbl1_we_clr, lbl1_we_rw, lbl1_x_incr1, lbl1_x_incr2 : std_logic;
  signal lbl1_x_incr3, lbl1_y_incr1, lbl1_y_incr2, lbl1_y_incr3, lbl2_dec0_n_0 : std_logic;
  signal lbl2_dec0_n_1, lbl2_dec0_n_2, lbl2_dec0_n_3, lbl2_dec0_n_5, lbl2_dec1_n_0 : std_logic;
  signal lbl2_dec1_n_1, lbl2_dec1_n_2, lbl2_dec1_n_3, lbl2_dec1_n_5, lbl2_n_0 : std_logic;
  signal lbl2_n_1, lbl2_n_4, lbl2_n_5, lbl2_n_6, lbl2_n_7 : std_logic;
  signal lbl2_n_8, lbl2_n_9, lbl2_n_10, lbl2_n_11, lbl2_n_12 : std_logic;
  signal lbl2_n_13, lbl2_n_14, lbl2_n_15, lbl2_n_16, lbl2_n_17 : std_logic;
  signal lbl2_n_18, lbl2_n_19, lbl2_n_21, lbl2_n_22, lbl2_n_23 : std_logic;
  signal lbl2_n_24, lbl2_n_25, lbl2_n_27, lbl2_n_28, lbl2_n_29 : std_logic;
  signal lbl2_n_30, lbl2_n_31, lbl2_n_32, lbl2_n_33, lbl2_n_34 : std_logic;
  signal lbl2_n_35, lbl2_n_36, lbl2_n_37, lbl2_n_38, lbl2_n_39 : std_logic;
  signal lbl2_n_40, lbl2_n_41, lbl2_n_42, lbl2_n_43, lbl2_n_44 : std_logic;
  signal lbl2_n_45, lbl2_n_46, lbl2_n_47, lbl2_n_48, lbl2_n_49 : std_logic;
  signal lbl2_n_50, lbl2_n_51, lbl2_n_52, lbl2_n_53, lbl2_n_54 : std_logic;
  signal lbl2_n_55, lbl2_n_56, lbl2_n_57, lbl2_n_58, lbl2_n_59 : std_logic;
  signal lbl2_n_60, lbl2_n_62, lbl2_n_63, lbl2_n_64, lbl2_n_65 : std_logic;
  signal lbl2_n_66, lbl2_n_67, lbl2_n_68, lbl2_n_69, lbl2_n_70 : std_logic;
  signal lbl2_n_71, lbl2_n_73, lbl2_n_74, lbl2_n_75, lbl2_n_76 : std_logic;
  signal lbl2_n_77, lbl2_n_78, lbl2_n_79, lbl2_n_80, lbl2_n_82 : std_logic;
  signal lbl2_n_83, lbl2_n_84, lbl2_n_85, lbl2_n_86, lbl2_n_87 : std_logic;
  signal lbl2_n_88, lbl2_n_89, lbl2_n_90, lbl2_n_91, lbl2_n_92 : std_logic;
  signal lbl2_n_93, lbl2_n_94, lbl2_n_95, lbl2_n_96, lbl2_n_97 : std_logic;
  signal lbl2_n_98, lbl2_n_99, lbl2_n_100, lbl2_n_101, lbl2_n_102 : std_logic;
  signal lbl2_n_103, lbl2_n_104, lbl2_n_105, lbl2_n_107, lbl2_n_108 : std_logic;
  signal lbl2_n_109, lbl2_n_110, lbl2_n_111, lbl2_n_112, lbl2_n_113 : std_logic;
  signal lbl2_n_115, lbl2_n_116, lbl2_n_117, lbl2_n_118, lbl2_n_119 : std_logic;
  signal lbl2_n_120, lbl2_n_121, lbl2_n_122, lbl2_n_123, lbl2_n_124 : std_logic;
  signal lbl2_n_125, lbl2_n_126, lbl2_n_127, lbl2_n_128, lbl2_n_129 : std_logic;
  signal lbl2_n_130, lbl2_n_131, lbl2_n_132, lbl2_n_133, lbl2_n_134 : std_logic;
  signal lbl2_n_137, lbl2_n_138, lbl2_n_139, lbl2_n_140, lbl2_n_141 : std_logic;
  signal lbl2_n_142, lbl2_n_143, lbl2_n_147, lbl2_n_148, lbl2_n_149 : std_logic;
  signal lbl2_n_150, lbl2_n_151, lbl2_n_152, lbl2_n_188, lbl2_n_189 : std_logic;
  signal lbl2_n_215, lbl2_n_216, lbl2_n_217, lbl2_n_218, lbl2_n_219 : std_logic;
  signal lbl2_pxl_n_0, lbl2_pxl_n_1, lbl2_pxl_n_2, lbl2_pxl_n_3, lbl2_pxl_n_4 : std_logic;
  signal lbl2_pxl_n_5, lbl2_pxl_n_6, lbl2_pxl_n_7, lbl2_pxl_n_8, lbl2_pxl_n_9 : std_logic;
  signal lbl2_pxl_n_10, lbl2_pxl_n_11, lbl2_pxl_n_12, lbl2_pxl_n_13, lbl2_pxl_n_14 : std_logic;
  signal lbl2_pxl_n_15, lbl2_pxl_n_16, lbl2_pxl_n_17, lbl2_pxl_n_18, lbl2_pxl_n_19 : std_logic;
  signal lbl2_pxl_n_20, lbl2_pxl_n_21, lbl2_pxl_n_22, lbl2_pxl_n_23, lbl2_pxl_n_24 : std_logic;
  signal lbl2_pxl_n_25, lbl2_pxl_n_26, lbl2_pxl_n_27, lbl2_pxl_n_28, lbl2_pxl_n_29 : std_logic;
  signal lbl2_pxl_n_30, lbl2_pxl_n_31, lbl2_pxl_n_32, lbl2_pxl_n_33, lbl2_pxl_n_34 : std_logic;
  signal lbl2_pxl_n_35, lbl2_pxl_n_36, lbl2_pxl_n_37, lbl2_pxl_n_38, lbl2_pxl_n_39 : std_logic;
  signal lbl2_pxl_n_40, lbl2_pxl_n_41, lbl2_pxl_n_42, lbl2_pxl_n_43, lbl2_pxl_n_44 : std_logic;
  signal lbl2_pxl_n_45, lbl2_pxl_n_46, lbl2_pxl_n_47, lbl2_pxl_n_48, lbl2_pxl_n_49 : std_logic;
  signal lbl2_pxl_n_50, lbl2_pxl_n_51, lbl2_pxl_n_52, lbl2_pxl_n_53, lbl2_pxl_n_54 : std_logic;
  signal lbl2_pxl_n_55, lbl2_pxl_n_56, lbl2_pxl_n_57, lbl2_pxl_n_58, lbl2_pxl_n_59 : std_logic;
  signal lbl2_pxl_n_60, lbl2_pxl_n_61, lbl2_pxl_n_62, lbl2_pxl_n_63, lbl2_pxl_n_64 : std_logic;
  signal lbl2_pxl_n_65, lbl2_pxl_n_66, lbl2_pxl_n_67, lbl2_pxl_n_68, lbl2_pxl_n_69 : std_logic;
  signal lbl2_pxl_n_70, lbl2_pxl_n_71, lbl2_pxl_n_72, lbl2_pxl_n_73, lbl2_pxl_n_74 : std_logic;
  signal lbl2_pxl_n_75, lbl2_pxl_n_76, lbl2_pxl_n_77, lbl2_pxl_n_78, lbl2_pxl_n_79 : std_logic;
  signal lbl2_pxl_n_80, lbl2_pxl_n_81, lbl2_pxl_n_82, lbl2_pxl_n_83, lbl2_pxl_n_84 : std_logic;
  signal lbl2_pxl_n_85, lbl2_pxl_n_86, lbl2_pxl_n_87, lbl2_pxl_n_88, lbl2_pxl_n_89 : std_logic;
  signal lbl2_pxl_n_90, lbl2_pxl_n_91, lbl2_pxl_n_92, lbl2_pxl_n_93, lbl2_pxl_n_94 : std_logic;
  signal lbl2_pxl_n_95, lbl2_pxl_n_96, lbl2_pxl_n_97, lbl2_pxl_n_98, lbl2_pxl_n_99 : std_logic;
  signal lbl2_pxl_n_100, lbl2_pxl_n_101, lbl2_pxl_n_102, lbl2_pxl_n_103, lbl2_pxl_n_104 : std_logic;
  signal lbl2_pxl_n_105, lbl2_pxl_n_106, lbl2_pxl_n_107, lbl2_pxl_n_108, lbl2_pxl_n_109 : std_logic;
  signal lbl2_pxl_n_110, lbl2_pxl_n_111, lbl2_pxl_n_112, lbl2_pxl_n_113, lbl2_pxl_n_114 : std_logic;
  signal lbl2_pxl_n_115, lbl2_pxl_n_116, lbl2_pxl_n_117, lbl2_pxl_n_118, lbl2_pxl_n_119 : std_logic;
  signal lbl2_pxl_n_120, lbl2_pxl_n_121, lbl2_pxl_n_122, lbl2_pxl_n_123, lbl2_pxl_n_124 : std_logic;
  signal lbl2_pxl_n_125, lbl2_pxl_n_126, lbl2_pxl_n_127, lbl2_pxl_n_128, lbl2_pxl_n_129 : std_logic;
  signal lbl2_pxl_n_130, lbl2_pxl_n_131, lbl2_pxl_n_132, lbl2_pxl_n_133, lbl2_pxl_n_134 : std_logic;
  signal lbl2_pxl_n_135, lbl2_pxl_n_136, lbl2_pxl_n_137, lbl2_pxl_n_138, lbl2_pxl_n_139 : std_logic;
  signal lbl2_pxl_n_140, lbl2_pxl_n_141, lbl2_pxl_n_142, lbl2_pxl_n_143, lbl2_pxl_n_144 : std_logic;
  signal lbl2_pxl_n_145, lbl2_pxl_n_146, lbl2_pxl_n_147, lbl2_pxl_n_148, lbl2_pxl_n_149 : std_logic;
  signal lbl2_pxl_n_150, lbl2_pxl_n_151, lbl2_pxl_n_152, lbl2_pxl_n_153, lbl2_pxl_n_154 : std_logic;
  signal lbl2_pxl_n_155, lbl2_pxl_n_156, lbl2_pxl_n_157, lbl2_pxl_n_158, lbl2_pxl_n_159 : std_logic;
  signal lbl2_pxl_n_160, lbl2_pxl_n_161, lbl2_pxl_n_162, lbl2_pxl_n_163, lbl2_pxl_n_164 : std_logic;
  signal lbl2_pxl_n_165, lbl2_pxl_n_166, lbl2_pxl_n_167, lbl2_pxl_n_168, lbl2_pxl_n_169 : std_logic;
  signal lbl2_pxl_n_170, lbl2_pxl_n_171, lbl2_pxl_n_172, lbl2_pxl_n_173, lbl2_pxl_n_174 : std_logic;
  signal lbl2_pxl_n_175, lbl2_pxl_n_176, lbl2_pxl_n_177, lbl2_pxl_n_178, lbl2_pxl_n_179 : std_logic;
  signal lbl2_pxl_n_180, lbl2_pxl_n_181, lbl2_pxl_n_182, lbl2_pxl_n_183, lbl2_pxl_n_184 : std_logic;
  signal lbl2_pxl_n_185, lbl2_pxl_n_186, lbl2_pxl_n_187, lbl2_pxl_n_188, lbl2_pxl_n_189 : std_logic;
  signal lbl2_pxl_n_190, lbl2_pxl_n_191, lbl2_pxl_n_192, lbl2_pxl_n_193, lbl2_pxl_n_194 : std_logic;
  signal lbl2_pxl_n_195, lbl2_pxl_n_196, lbl2_pxl_n_197, lbl2_pxl_n_198, lbl2_pxl_n_199 : std_logic;
  signal lbl2_pxl_n_200, lbl2_pxl_n_201, lbl2_pxl_n_202, lbl2_pxl_n_203, lbl2_pxl_n_204 : std_logic;
  signal lbl2_pxl_n_205, lbl2_pxl_n_206, lbl2_pxl_n_207, lbl2_pxl_n_208, lbl2_pxl_n_211 : std_logic;
  signal lbl2_pxl_n_212, lbl2_pxl_n_213, lbl2_pxl_n_214, lbl2_pxl_n_215, lbl2_sdb_n_0 : std_logic;
  signal lbl2_sdb_n_1, lbl2_sdb_n_2, lbl2_sdb_n_3, lbl2_sdb_n_4, lbl2_sdb_n_5 : std_logic;
  signal lbl2_sdb_n_6, lbl2_sdb_n_7, lbl2_sdb_n_8, lbl2_sdb_n_9, lbl2_sdb_n_10 : std_logic;
  signal lbl2_sdb_n_11, lbl2_sdb_n_12, lbl2_sdb_n_13, lbl2_sdb_n_14, lbl2_sdb_n_15 : std_logic;
  signal lbl2_sdb_n_16, lbl2_sdb_n_17, lbl2_sdb_n_18, lbl2_sdb_n_19, lbl2_sdb_n_20 : std_logic;
  signal lbl2_sdb_n_21, lbl2_sdb_n_22, lbl2_sdb_n_23, lbl2_sdb_n_24, lbl2_sdb_n_25 : std_logic;
  signal lbl2_sdb_n_26, lbl2_sdb_n_27, lbl2_sdb_n_28, lbl2_sdb_n_29, lbl2_sdb_n_30 : std_logic;
  signal lbl2_sdb_n_31, lbl2_sdb_n_32, lbl2_sdb_n_33, lbl2_sdb_n_34, lbl2_sdb_n_35 : std_logic;
  signal lbl2_sdb_n_36, lbl2_sdb_n_37, lbl2_sdb_n_38, lbl2_sdb_n_39, lbl2_sdb_n_40 : std_logic;
  signal lbl2_sdb_n_41, lbl2_sdb_n_42, lbl2_sdb_n_43, lbl2_sdb_n_44, lbl2_sdb_n_45 : std_logic;
  signal lbl2_sdb_n_46, lbl2_sdb_n_47, lbl2_sdb_n_48, lbl2_sdb_n_49, lbl2_sdb_n_50 : std_logic;
  signal lbl2_sdb_n_51, lbl2_sdb_n_52, lbl2_sdb_n_53, lbl2_sdb_n_54, lbl2_sdb_n_55 : std_logic;
  signal lbl2_sdb_n_56, lbl2_sdb_n_57, lbl2_sdb_n_58, lbl2_sdb_n_59, lbl2_sdb_n_60 : std_logic;
  signal lbl2_sdb_n_61, lbl2_sdb_n_62, lbl2_sdb_n_63, lbl2_sdb_n_64, lbl2_sdb_n_65 : std_logic;
  signal lbl2_sdb_n_66, lbl2_sdb_n_67, lbl2_sdb_n_68, lbl2_sdb_n_69, lbl2_sdb_n_70 : std_logic;
  signal lbl2_sdb_n_71, lbl2_sdb_n_72, lbl2_sdb_n_73, lbl2_sdb_n_74, lbl2_sdb_n_75 : std_logic;
  signal lbl2_sdb_n_76, lbl2_sdb_n_77, lbl2_sdb_n_78, lbl2_sdb_n_79, lbl2_sdb_n_80 : std_logic;
  signal lbl2_sdb_n_81, lbl2_sdb_n_82, lbl2_sdb_n_83, lbl2_sdb_n_84, lbl2_sdb_n_85 : std_logic;
  signal lbl2_sdb_n_86, lbl2_sdb_n_87, lbl2_sdb_n_88, lbl2_sdb_n_89, lbl2_sdb_n_90 : std_logic;
  signal lbl2_sdb_n_91, lbl2_sdb_n_92, lbl2_sdb_n_93, lbl2_sdb_n_94, lbl2_sdb_n_95 : std_logic;
  signal lbl2_sdb_n_96, lbl2_sdb_n_97, lbl2_sdb_n_98, lbl2_sdb_n_99, lbl2_sdb_n_100 : std_logic;
  signal lbl2_sdb_n_101, lbl2_sdb_n_102, lbl2_sdb_n_103, lbl2_sdb_n_104, lbl2_sdb_n_105 : std_logic;
  signal lbl2_sdb_n_106, lbl2_sdb_n_107, lbl2_sdb_n_108, lbl2_sdb_n_109, lbl2_sdb_n_110 : std_logic;
  signal lbl2_sdb_n_111, lbl2_sdb_n_112, lbl2_sdb_n_113, lbl2_sdb_n_114, lbl2_sdb_n_115 : std_logic;
  signal lbl2_sdb_n_116, lbl2_sdb_n_117, lbl2_sdb_n_118, lbl2_sdb_n_119, lbl2_sdb_n_120 : std_logic;
  signal lbl2_sdb_n_121, lbl2_sdb_n_122, lbl2_sdb_n_123, lbl2_sdb_n_124, lbl2_sdb_n_125 : std_logic;
  signal lbl2_sdb_n_126, lbl2_sdb_n_127, lbl2_sdb_n_128, lbl2_sdb_n_129, lbl2_sdb_n_130 : std_logic;
  signal lbl2_sdb_n_131, lbl2_sdb_n_132, lbl2_sdb_n_133, lbl2_sdb_n_134, lbl2_sdb_n_135 : std_logic;
  signal lbl2_sdb_n_136, lbl2_sdb_n_137, lbl2_sdb_n_138, lbl2_sdb_n_139, lbl2_sdb_n_140 : std_logic;
  signal lbl2_sdb_n_141, lbl2_sdb_n_142, lbl2_sdb_n_143, lbl2_sdb_n_144, lbl2_sdb_n_145 : std_logic;
  signal lbl2_sdb_n_146, lbl2_sdb_n_147, lbl2_sdb_n_148, lbl2_sdb_n_149, lbl2_sdb_n_150 : std_logic;
  signal lbl2_sdb_n_151, lbl2_sdb_n_152, lbl2_sdb_n_153, lbl2_sdb_n_154, lbl2_sdb_n_155 : std_logic;
  signal lbl2_sdb_n_156, lbl2_sdb_n_157, lbl2_sdb_n_158, lbl2_sdb_n_159, lbl2_sdb_n_160 : std_logic;
  signal lbl2_sdb_n_161, lbl2_sdb_n_162, lbl2_sdb_n_163, lbl2_sdb_n_164, lbl2_sdb_n_165 : std_logic;
  signal lbl2_sdb_n_166, lbl2_sdb_n_167, lbl2_sdb_n_168, lbl2_sdb_n_169, lbl2_sdb_n_170 : std_logic;
  signal lbl2_sdb_n_171, lbl2_sdb_n_172, lbl2_sdb_n_173, lbl2_sdb_n_174, lbl2_sdb_n_175 : std_logic;
  signal lbl2_sdb_n_176, lbl2_sdb_n_177, lbl2_sdb_n_178, lbl2_sdb_n_179, memory_ready : std_logic;
  signal random4, random5, reset_vga_mem, write_enable, x_increment : std_logic;
  signal y_increment : std_logic;

begin

  lbl3 : input_buffer port map(clk => clk, rst => rst, dir_in => direction_in, dir_out => direction_between, start_in => random4, start_out => random5);
  lbl2_g2212 : NR4D0BWP7T port map(A1 => lbl2_n_134, A2 => lbl2_n_110, A3 => lbl2_n_121, A4 => lbl2_n_113, ZN => lbl2_n_189);
  lbl2_g2213 : NR4D0BWP7T port map(A1 => lbl2_n_133, A2 => lbl2_n_118, A3 => lbl2_n_116, A4 => lbl2_n_117, ZN => lbl2_n_188);
  lbl2_g2214 : ND4D0BWP7T port map(A1 => lbl2_n_132, A2 => lbl2_n_115, A3 => lbl2_n_107, A4 => lbl2_n_120, ZN => lbl2_n_134);
  lbl2_g2215 : ND4D0BWP7T port map(A1 => lbl2_n_131, A2 => lbl2_n_109, A3 => lbl2_n_112, A4 => lbl2_n_111, ZN => lbl2_n_133);
  lbl2_g2216 : NR3D0BWP7T port map(A1 => lbl2_n_124, A2 => lbl2_n_130, A3 => lbl2_n_128, ZN => lbl2_n_132);
  lbl2_g2217 : NR3D0BWP7T port map(A1 => lbl2_n_123, A2 => lbl2_n_129, A3 => lbl2_n_127, ZN => lbl2_n_131);
  lbl2_g2218 : OAI211D1BWP7T port map(A1 => position_0(2), A2 => lbl2_n_215, B => lbl2_n_126, C => lbl2_n_119, ZN => lbl2_n_130);
  lbl2_g2219 : OAI211D1BWP7T port map(A1 => position_1(2), A2 => lbl2_n_215, B => lbl2_n_125, C => lbl2_n_108, ZN => lbl2_n_129);
  lbl2_g2220 : MOAI22D0BWP7T port map(A1 => lbl2_n_122, A2 => position_0(3), B1 => lbl2_n_215, B2 => position_0(2), ZN => lbl2_n_128);
  lbl2_g2221 : MOAI22D0BWP7T port map(A1 => lbl2_n_122, A2 => position_1(3), B1 => lbl2_n_215, B2 => position_1(2), ZN => lbl2_n_127);
  lbl2_g2222 : ND2D1BWP7T port map(A1 => lbl2_n_122, A2 => position_0(3), ZN => lbl2_n_126);
  lbl2_g2223 : ND2D1BWP7T port map(A1 => lbl2_n_122, A2 => position_1(3), ZN => lbl2_n_125);
  lbl2_g2224 : CKXOR2D1BWP7T port map(A1 => lbl2_x_vec(4), A2 => position_0(4), Z => lbl2_n_124);
  lbl2_g2225 : CKXOR2D1BWP7T port map(A1 => lbl2_x_vec(4), A2 => position_1(4), Z => lbl2_n_123);
  lbl2_g2227 : MAOI22D0BWP7T port map(A1 => lbl2_n_143, A2 => lbl2_h_count(7), B1 => lbl2_n_143, B2 => lbl2_h_count(7), ZN => lbl2_n_122);
  lbl2_g2228 : CKXOR2D1BWP7T port map(A1 => lbl2_n_138, A2 => lbl2_h_count(8), Z => lbl2_x_vec(4));
  lbl2_g2230 : MAOI22D0BWP7T port map(A1 => lbl2_v_count(7), A2 => position_0(8), B1 => lbl2_v_count(7), B2 => position_0(8), ZN => lbl2_n_121);
  lbl2_g2231 : XNR2D1BWP7T port map(A1 => lbl2_v_count(5), A2 => position_0(6), ZN => lbl2_n_120);
  lbl2_g2232 : MAOI22D0BWP7T port map(A1 => lbl2_h_count(5), A2 => position_0(1), B1 => lbl2_h_count(5), B2 => position_0(1), ZN => lbl2_n_119);
  lbl2_g2233 : MAOI22D0BWP7T port map(A1 => lbl2_v_count(7), A2 => position_1(8), B1 => lbl2_v_count(7), B2 => position_1(8), ZN => lbl2_n_118);
  lbl2_g2234 : MAOI22D0BWP7T port map(A1 => lbl2_h_count(4), A2 => position_1(0), B1 => lbl2_h_count(4), B2 => position_1(0), ZN => lbl2_n_117);
  lbl2_g2235 : MAOI22D0BWP7T port map(A1 => lbl2_v_count(8), A2 => position_1(9), B1 => lbl2_v_count(8), B2 => position_1(9), ZN => lbl2_n_116);
  lbl2_g2236 : XNR2D1BWP7T port map(A1 => lbl2_v_count(4), A2 => position_0(5), ZN => lbl2_n_115);
  lbl2_g2237 : ND2D1BWP7T port map(A1 => lbl2_n_140, A2 => lbl2_h_count(5), ZN => lbl2_n_138);
  lbl2_g2238 : MAOI22D0BWP7T port map(A1 => lbl2_h_count(4), A2 => position_0(0), B1 => lbl2_h_count(4), B2 => position_0(0), ZN => lbl2_n_113);
  lbl2_g2239 : XNR2D1BWP7T port map(A1 => lbl2_v_count(6), A2 => position_1(7), ZN => lbl2_n_112);
  lbl2_g2240 : XNR2D1BWP7T port map(A1 => lbl2_v_count(4), A2 => position_1(5), ZN => lbl2_n_111);
  lbl2_g2241 : MAOI22D0BWP7T port map(A1 => lbl2_v_count(8), A2 => position_0(9), B1 => lbl2_v_count(8), B2 => position_0(9), ZN => lbl2_n_110);
  lbl2_g2242 : XNR2D1BWP7T port map(A1 => lbl2_v_count(5), A2 => position_1(6), ZN => lbl2_n_109);
  lbl2_g2243 : MAOI22D0BWP7T port map(A1 => lbl2_h_count(5), A2 => position_1(1), B1 => lbl2_h_count(5), B2 => position_1(1), ZN => lbl2_n_108);
  lbl2_g2244 : XNR2D1BWP7T port map(A1 => lbl2_v_count(6), A2 => position_0(7), ZN => lbl2_n_107);
  lbl2_g2246 : CKND2D1BWP7T port map(A1 => lbl2_h_count(5), A2 => lbl2_h_count(6), ZN => lbl2_n_143);
  lbl2_g2247 : AN2D1BWP7T port map(A1 => lbl2_h_count(7), A2 => lbl2_h_count(6), Z => lbl2_n_140);
  lbl2_g1752 : MOAI22D0BWP7T port map(A1 => lbl2_n_104, A2 => lbl2_h_count(5), B1 => lbl2_n_104, B2 => lbl2_h_count(5), ZN => lbl2_n_148);
  lbl2_g1753 : MOAI22D0BWP7T port map(A1 => lbl2_n_105, A2 => lbl2_h_count(6), B1 => lbl2_n_105, B2 => lbl2_h_count(6), ZN => lbl2_n_149);
  lbl2_g1754 : IOA21D1BWP7T port map(A1 => lbl2_h_count(4), A2 => lbl2_h_count(9), B => lbl2_n_104, ZN => lbl2_n_147);
  lbl2_g1755 : INR2D1BWP7T port map(A1 => lbl2_n_139, B1 => lbl2_h_count(9), ZN => lbl2_n_105);
  lbl2_g1756 : MUX2D1BWP7T port map(I0 => direction_0(1), I1 => direction_1(1), S => lbl2_h_count(9), Z => lbl2_n_152);
  lbl2_g1757 : CKMUX2D1BWP7T port map(I0 => direction_0(0), I1 => direction_1(0), S => lbl2_h_count(9), Z => lbl2_n_151);
  lbl2_g1758 : CKMUX2D1BWP7T port map(I0 => player_state_0(0), I1 => player_state_1(0), S => lbl2_h_count(9), Z => lbl2_n_150);
  lbl2_g1759 : OR2D1BWP7T port map(A1 => lbl2_h_count(5), A2 => lbl2_h_count(4), Z => lbl2_n_139);
  lbl2_g1760 : OR2D1BWP7T port map(A1 => lbl2_h_count(4), A2 => lbl2_h_count(9), Z => lbl2_n_104);
  lbl2_color_reg_3 : DFD0BWP7T port map(CP => clk, D => lbl2_n_96, Q => UNCONNECTED, QN => lbl2_n_103);
  lbl2_g2501 : INVD4BWP7T port map(I => lbl2_n_103, ZN => color_out(3));
  lbl2_color_reg_2 : DFD0BWP7T port map(CP => clk, D => lbl2_n_97, Q => UNCONNECTED0, QN => lbl2_n_102);
  lbl2_g2503 : INVD4BWP7T port map(I => lbl2_n_102, ZN => color_out(2));
  lbl2_color_reg_1 : DFD0BWP7T port map(CP => clk, D => lbl2_n_98, Q => UNCONNECTED1, QN => lbl2_n_101);
  lbl2_g2505 : INVD4BWP7T port map(I => lbl2_n_101, ZN => color_out(1));
  lbl2_color_reg_0 : DFD0BWP7T port map(CP => clk, D => lbl2_n_99, Q => UNCONNECTED2, QN => lbl2_n_100);
  lbl2_g2507 : INVD4BWP7T port map(I => lbl2_n_100, ZN => color_out(0));
  lbl2_g2508 : AO221D0BWP7T port map(A1 => lbl2_pixelator_color(0), A2 => lbl2_n_92, B1 => lbl2_sidebar_color(0), B2 => lbl2_n_93, C => lbl2_n_94, Z => lbl2_n_99);
  lbl2_g2509 : AO221D0BWP7T port map(A1 => lbl2_pixelator_color(1), A2 => lbl2_n_92, B1 => lbl2_sidebar_color(1), B2 => lbl2_n_93, C => lbl2_n_94, Z => lbl2_n_98);
  lbl2_g2510 : AO221D0BWP7T port map(A1 => lbl2_pixelator_color(2), A2 => lbl2_n_92, B1 => lbl2_sidebar_color(2), B2 => lbl2_n_93, C => lbl2_n_94, Z => lbl2_n_97);
  lbl2_g2511 : AO221D0BWP7T port map(A1 => lbl2_pixelator_color(3), A2 => lbl2_n_92, B1 => lbl2_sidebar_color(3), B2 => lbl2_n_93, C => lbl2_n_94, Z => lbl2_n_96);
  lbl2_g2512 : IINR4D0BWP7T port map(A1 => lbl2_n_60, A2 => lbl2_n_74, B1 => lbl2_v_count(2), B2 => lbl2_v_count(3), ZN => y_increment);
  lbl2_v_sync_reg : DFKSND0BWP7T port map(CP => clk, D => rst, SN => lbl2_n_91, Q => UNCONNECTED3, QN => lbl2_n_95);
  lbl2_g2514 : INVD4BWP7T port map(I => lbl2_n_95, ZN => v_sync_out);
  lbl2_g2515 : AN2D1BWP7T port map(A1 => lbl2_n_92, A2 => lbl2_n_68, Z => lbl2_n_94);
  lbl2_g2516 : AN2D1BWP7T port map(A1 => lbl2_n_90, A2 => lbl2_n_219, Z => lbl2_n_93);
  lbl2_g2517 : INR2D1BWP7T port map(A1 => lbl2_n_90, B1 => lbl2_n_219, ZN => lbl2_n_92);
  lbl2_g2519 : INR3D0BWP7T port map(A1 => lbl2_n_74, B1 => lbl2_n_82, B2 => lbl2_n_89, ZN => reset_vga_mem);
  lbl2_g2520 : OAI21D0BWP7T port map(A1 => lbl2_n_88, A2 => lbl2_v_count(2), B => lbl2_n_62, ZN => lbl2_n_91);
  lbl2_g2521 : AOI211D1BWP7T port map(A1 => lbl2_n_86, A2 => lbl2_n_87, B => lbl2_n_80, C => rst, ZN => lbl2_n_90);
  lbl2_g2522 : IND4D0BWP7T port map(A1 => lbl2_h_count(3), B1 => lbl2_n_67, B2 => lbl2_n_73, B3 => lbl2_n_84, ZN => lbl2_n_89);
  lbl2_g2523 : ND3D0BWP7T port map(A1 => lbl2_n_83, A2 => lbl2_v_count(1), A3 => lbl2_v_count(3), ZN => lbl2_n_88);
  lbl2_g2524 : NR3D0BWP7T port map(A1 => lbl2_n_86, A2 => lbl2_n_75, A3 => lbl2_n_142, ZN => x_increment);
  lbl2_g2525 : ND2D1BWP7T port map(A1 => lbl2_n_74, A2 => lbl2_n_84, ZN => lbl2_n_87);
  lbl2_g2526 : IND3D1BWP7T port map(A1 => lbl2_n_141, B1 => busy, B2 => lbl2_n_74, ZN => lbl2_n_86);
  lbl2_h_sync_reg : DFKSND1BWP7T port map(CP => clk, D => lbl2_n_79, SN => lbl2_n_62, Q => UNCONNECTED4, QN => lbl2_n_85);
  lbl2_g2528 : INVD4BWP7T port map(I => lbl2_n_85, ZN => h_sync_out);
  lbl2_g2529 : NR3D0BWP7T port map(A1 => lbl2_n_137, A2 => lbl2_n_77, A3 => lbl2_v_count(9), ZN => lbl2_n_83);
  lbl2_g2530 : IINR4D0BWP7T port map(A1 => busy, A2 => lbl2_n_69, B1 => lbl2_h_count(6), B2 => lbl2_h_count(7), ZN => lbl2_n_84);
  lbl2_g2532 : IND2D1BWP7T port map(A1 => lbl2_v_count(5), B1 => lbl2_n_78, ZN => lbl2_n_82);
  lbl2_g2533 : INR2XD0BWP7T port map(A1 => lbl2_n_77, B1 => lbl2_v_count(9), ZN => busy);
  lbl2_g2534 : AOI211XD0BWP7T port map(A1 => lbl2_n_70, A2 => lbl2_h_count(7), B => lbl2_n_140, C => lbl2_n_66, ZN => lbl2_n_80);
  lbl2_g2536 : AOI31D0BWP7T port map(A1 => lbl2_n_143, A2 => lbl2_n_67, A3 => lbl2_n_63, B => rst, ZN => lbl2_n_79);
  lbl2_g2537 : NR4D0BWP7T port map(A1 => lbl2_v_count(7), A2 => lbl2_v_count(6), A3 => lbl2_v_count(8), A4 => lbl2_v_count(4), ZN => lbl2_n_78);
  lbl2_g2538 : AN4D1BWP7T port map(A1 => lbl2_v_count(4), A2 => lbl2_v_count(5), A3 => lbl2_v_count(7), A4 => lbl2_v_count(6), Z => lbl2_n_137);
  lbl2_g2539 : AOI22D0BWP7T port map(A1 => lbl2_n_138, A2 => lbl2_n_67, B1 => lbl2_n_64, B2 => lbl2_h_count(9), ZN => lbl2_n_76);
  lbl2_g2540 : MAOI22D0BWP7T port map(A1 => lbl2_n_65, A2 => lbl2_n_66, B1 => lbl2_n_65, B2 => lbl2_h_count(9), ZN => lbl2_n_75);
  lbl2_g2541 : ND4D0BWP7T port map(A1 => lbl2_v_count(8), A2 => lbl2_v_count(5), A3 => lbl2_v_count(7), A4 => lbl2_v_count(6), ZN => lbl2_n_77);
  lbl2_g2542 : IND2D1BWP7T port map(A1 => lbl2_n_71, B1 => lbl2_h_count(1), ZN => lbl2_n_142);
  lbl2_g2543 : NR3D0BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(1), A3 => lbl2_h_count(0), ZN => lbl2_n_73);
  lbl2_g2544 : ND2D1BWP7T port map(A1 => lbl2_n_68, A2 => game_state(2), ZN => lbl2_n_74);
  lbl2_g2546 : ND3D0BWP7T port map(A1 => lbl2_h_count(3), A2 => lbl2_h_count(2), A3 => lbl2_h_count(0), ZN => lbl2_n_71);
  lbl2_g2547 : INVD0BWP7T port map(I => lbl2_n_69, ZN => lbl2_n_70);
  lbl2_g2548 : INVD0BWP7T port map(I => lbl2_n_67, ZN => lbl2_n_66);
  lbl2_g2549 : NR2XD0BWP7T port map(A1 => lbl2_h_count(4), A2 => lbl2_h_count(5), ZN => lbl2_n_69);
  lbl2_g2550 : NR2D1BWP7T port map(A1 => game_state(0), A2 => game_state(1), ZN => lbl2_n_68);
  lbl2_g2552 : NR2XD0BWP7T port map(A1 => lbl2_h_count(9), A2 => lbl2_h_count(8), ZN => lbl2_n_67);
  lbl2_g2553 : IND2D1BWP7T port map(A1 => lbl2_h_count(8), B1 => lbl2_n_138, ZN => lbl2_n_64);
  lbl2_g2555 : CKND2D1BWP7T port map(A1 => lbl2_n_140, A2 => lbl2_n_139, ZN => lbl2_n_65);
  lbl2_g2556 : AN2D0BWP7T port map(A1 => lbl2_h_count(9), A2 => lbl2_h_count(8), Z => lbl2_n_141);
  lbl2_drc_bufs2560 : INVD0BWP7T port map(I => rst, ZN => lbl2_n_62);
  lbl2_g2 : INR4D0BWP7T port map(A1 => lbl2_n_82, B1 => lbl2_n_89, B2 => lbl2_v_count(1), B3 => lbl2_v_count(0), ZN => lbl2_n_60);
  lbl2_borders_synced_reg_0 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(0), DB => borders(0), SA => lbl2_n_142, Q => lbl2_borders_synced(0));
  lbl2_borders_synced_reg_1 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(1), DB => borders(1), SA => lbl2_n_142, Q => lbl2_borders_synced(1));
  lbl2_borders_synced_reg_2 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(2), DB => borders(2), SA => lbl2_n_142, Q => lbl2_borders_synced(2));
  lbl2_borders_synced_reg_3 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(3), DB => borders(3), SA => lbl2_n_142, Q => lbl2_borders_synced(3));
  lbl2_borders_synced_reg_4 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(4), DB => borders(4), SA => lbl2_n_142, Q => lbl2_borders_synced(4));
  lbl2_borders_synced_reg_5 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(5), DB => borders(5), SA => lbl2_n_142, Q => lbl2_borders_synced(5));
  lbl2_borders_synced_reg_6 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(6), DB => borders(6), SA => lbl2_n_142, Q => lbl2_borders_synced(6));
  lbl2_borders_synced_reg_7 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_borders_synced(7), DB => borders(7), SA => lbl2_n_142, Q => lbl2_borders_synced(7));
  lbl2_data_synced_reg_0 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(0), DB => read_memory_in(0), SA => lbl2_n_142, Q => lbl2_data_synced(0));
  lbl2_data_synced_reg_1 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(1), DB => read_memory_in(1), SA => lbl2_n_142, Q => lbl2_data_synced(1));
  lbl2_data_synced_reg_2 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(2), DB => read_memory_in(2), SA => lbl2_n_142, Q => lbl2_data_synced(2));
  lbl2_data_synced_reg_3 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(3), DB => read_memory_in(3), SA => lbl2_n_142, Q => lbl2_data_synced(3));
  lbl2_data_synced_reg_4 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(4), DB => read_memory_in(4), SA => lbl2_n_142, Q => lbl2_data_synced(4));
  lbl2_data_synced_reg_5 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(5), DB => read_memory_in(5), SA => lbl2_n_142, Q => lbl2_data_synced(5));
  lbl2_data_synced_reg_6 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(6), DB => read_memory_in(6), SA => lbl2_n_142, Q => lbl2_data_synced(6));
  lbl2_data_synced_reg_7 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_data_synced(7), DB => read_memory_in(7), SA => lbl2_n_142, Q => lbl2_data_synced(7));
  lbl2_h_count_reg_1 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_16, D => lbl2_n_32, Q => lbl2_h_count(1));
  lbl2_h_count_reg_2 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_25, D => lbl2_n_32, Q => lbl2_h_count(2));
  lbl2_h_count_reg_3 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_36, D => lbl2_n_32, Q => lbl2_h_count(3));
  lbl2_h_count_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_15, D => lbl2_n_32, Q => lbl2_h_count(4));
  lbl2_h_count_reg_5 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_22, D => lbl2_n_32, Q => lbl2_h_count(5));
  lbl2_h_count_reg_8 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_40, D => lbl2_n_32, Q => lbl2_h_count(8));
  lbl2_h_count_reg_9 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl2_n_32, D => lbl2_n_50, Q => lbl2_h_count(9));
  lbl2_jumps_synced_reg_0 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(0), DB => ramps(0), SA => lbl2_n_142, Q => lbl2_jumps_synced(0));
  lbl2_jumps_synced_reg_1 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(1), DB => ramps(1), SA => lbl2_n_142, Q => lbl2_jumps_synced(1));
  lbl2_jumps_synced_reg_2 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(2), DB => ramps(2), SA => lbl2_n_142, Q => lbl2_jumps_synced(2));
  lbl2_jumps_synced_reg_3 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(3), DB => ramps(3), SA => lbl2_n_142, Q => lbl2_jumps_synced(3));
  lbl2_jumps_synced_reg_4 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(4), DB => ramps(4), SA => lbl2_n_142, Q => lbl2_jumps_synced(4));
  lbl2_jumps_synced_reg_5 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(5), DB => ramps(5), SA => lbl2_n_142, Q => lbl2_jumps_synced(5));
  lbl2_jumps_synced_reg_6 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(6), DB => ramps(6), SA => lbl2_n_142, Q => lbl2_jumps_synced(6));
  lbl2_jumps_synced_reg_7 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_jumps_synced(7), DB => ramps(7), SA => lbl2_n_142, Q => lbl2_jumps_synced(7));
  lbl2_v_count_reg_0 : DFXQD1BWP7T port map(CP => clk, DA => lbl2_n_32, DB => lbl2_n_41, SA => lbl2_v_count(0), Q => lbl2_v_count(0));
  lbl2_v_count_reg_1 : DFQD1BWP7T port map(CP => clk, D => lbl2_n_44, Q => lbl2_v_count(1));
  lbl2_v_count_reg_5 : DFQD1BWP7T port map(CP => clk, D => lbl2_n_53, Q => lbl2_v_count(5));
  lbl2_v_count_reg_7 : DFQD1BWP7T port map(CP => clk, D => lbl2_n_56, Q => lbl2_v_count(7));
  lbl2_g2893 : OAI32D1BWP7T port map(A1 => lbl2_v_count(8), A2 => lbl2_n_27, A3 => lbl2_n_42, B1 => lbl2_n_8, B2 => lbl2_n_48, ZN => lbl2_n_59);
  lbl2_g2894 : OAI31D0BWP7T port map(A1 => lbl2_v_count(6), A2 => lbl2_n_216, A3 => lbl2_n_42, B => lbl2_n_51, ZN => lbl2_n_58);
  lbl2_g2895 : OAI32D1BWP7T port map(A1 => lbl2_v_count(2), A2 => lbl2_n_12, A3 => lbl2_n_42, B1 => lbl2_n_7, B2 => lbl2_n_49, ZN => lbl2_n_57);
  lbl2_g2897 : MOAI22D0BWP7T port map(A1 => lbl2_n_42, A2 => lbl2_n_37, B1 => lbl2_n_47, B2 => lbl2_v_count(7), ZN => lbl2_n_56);
  lbl2_g2898 : MOAI22D0BWP7T port map(A1 => lbl2_n_48, A2 => lbl2_n_4, B1 => lbl2_n_41, B2 => lbl2_n_38, ZN => lbl2_n_55);
  lbl2_g2899 : OAI32D1BWP7T port map(A1 => lbl2_v_count(4), A2 => lbl2_n_217, A3 => lbl2_n_42, B1 => lbl2_n_5, B2 => lbl2_n_45, ZN => lbl2_n_54);
  lbl2_g2900 : MOAI22D0BWP7T port map(A1 => lbl2_n_42, A2 => lbl2_n_29, B1 => lbl2_n_46, B2 => lbl2_v_count(5), ZN => lbl2_n_53);
  lbl2_g2901 : OAI22D0BWP7T port map(A1 => lbl2_n_49, A2 => lbl2_n_11, B1 => lbl2_n_42, B2 => lbl2_n_23, ZN => lbl2_n_52);
  lbl2_g2904 : ND2D1BWP7T port map(A1 => lbl2_n_47, A2 => lbl2_v_count(6), ZN => lbl2_n_51);
  lbl2_g2905 : MOAI22D0BWP7T port map(A1 => lbl2_n_39, A2 => lbl2_h_count(9), B1 => lbl2_n_39, B2 => lbl2_h_count(9), ZN => lbl2_n_50);
  lbl2_g2907 : AOI21D0BWP7T port map(A1 => lbl2_n_41, A2 => lbl2_n_12, B => lbl2_n_32, ZN => lbl2_n_49);
  lbl2_g2908 : AOI21D0BWP7T port map(A1 => lbl2_n_41, A2 => lbl2_n_27, B => lbl2_n_32, ZN => lbl2_n_48);
  lbl2_g2910 : CKND1BWP7T port map(I => lbl2_n_45, ZN => lbl2_n_46);
  lbl2_g2911 : MOAI22D0BWP7T port map(A1 => lbl2_n_42, A2 => lbl2_n_1, B1 => lbl2_n_32, B2 => lbl2_v_count(1), ZN => lbl2_n_44);
  lbl2_g2912 : MOAI22D0BWP7T port map(A1 => lbl2_n_34, A2 => lbl2_h_count(7), B1 => lbl2_n_34, B2 => lbl2_h_count(7), ZN => lbl2_n_43);
  lbl2_g2913 : AO21D0BWP7T port map(A1 => lbl2_n_41, A2 => lbl2_n_216, B => lbl2_n_32, Z => lbl2_n_47);
  lbl2_g2914 : AOI21D0BWP7T port map(A1 => lbl2_n_41, A2 => lbl2_n_217, B => lbl2_n_32, ZN => lbl2_n_45);
  lbl2_g2919 : INVD1BWP7T port map(I => lbl2_n_42, ZN => lbl2_n_41);
  lbl2_g2920 : MOAI22D0BWP7T port map(A1 => lbl2_n_33, A2 => lbl2_h_count(8), B1 => lbl2_n_33, B2 => lbl2_h_count(8), ZN => lbl2_n_40);
  lbl2_g2923 : IND4D0BWP7T port map(A1 => rst, B1 => lbl2_n_6, B2 => lbl2_n_30, B3 => lbl2_n_28, ZN => lbl2_n_42);
  lbl2_g2924 : OAI31D0BWP7T port map(A1 => lbl2_v_count(9), A2 => lbl2_n_8, A3 => lbl2_n_27, B => lbl2_n_13, ZN => lbl2_n_38);
  lbl2_g2925 : IND2D1BWP7T port map(A1 => lbl2_n_33, B1 => lbl2_h_count(8), ZN => lbl2_n_39);
  lbl2_g2926 : MAOI22D0BWP7T port map(A1 => lbl2_n_9, A2 => lbl2_v_count(7), B1 => lbl2_n_31, B2 => lbl2_v_count(7), ZN => lbl2_n_37);
  lbl2_g2927 : MOAI22D0BWP7T port map(A1 => lbl2_n_21, A2 => lbl2_h_count(3), B1 => lbl2_n_21, B2 => lbl2_h_count(3), ZN => lbl2_n_36);
  lbl2_g2928 : MOAI22D0BWP7T port map(A1 => lbl2_n_19, A2 => lbl2_h_count(6), B1 => lbl2_n_19, B2 => lbl2_h_count(6), ZN => lbl2_n_35);
  lbl2_g2929 : OR2D1BWP7T port map(A1 => lbl2_n_19, A2 => lbl2_n_6, Z => lbl2_n_34);
  lbl2_g2930 : IND2D1BWP7T port map(A1 => lbl2_n_19, B1 => lbl2_n_140, ZN => lbl2_n_33);
  lbl2_g2931 : AOI21D0BWP7T port map(A1 => lbl2_n_28, A2 => lbl2_n_6, B => rst, ZN => lbl2_n_32);
  lbl2_g2932 : OR2D1BWP7T port map(A1 => lbl2_n_216, A2 => lbl2_n_9, Z => lbl2_n_31);
  lbl2_g2933 : IND3D0BWP7T port map(A1 => lbl2_n_13, B1 => lbl2_n_17, B2 => lbl2_n_18, ZN => lbl2_n_30);
  lbl2_g2934 : AOI21D0BWP7T port map(A1 => lbl2_n_5, A2 => lbl2_v_count(5), B => lbl2_n_24, ZN => lbl2_n_29);
  lbl2_g2935 : INR4D0BWP7T port map(A1 => lbl2_n_141, B1 => lbl2_h_count(5), B2 => lbl2_h_count(7), B3 => lbl2_n_0, ZN => lbl2_n_28);
  lbl2_g2936 : IND2D1BWP7T port map(A1 => lbl2_n_217, B1 => lbl2_n_137, ZN => lbl2_n_27);
  lbl2_g2938 : MOAI22D0BWP7T port map(A1 => lbl2_n_14, A2 => lbl2_h_count(2), B1 => lbl2_n_14, B2 => lbl2_h_count(2), ZN => lbl2_n_25);
  lbl2_g2939 : NR3D0BWP7T port map(A1 => lbl2_n_217, A2 => lbl2_n_5, A3 => lbl2_v_count(5), ZN => lbl2_n_24);
  lbl2_g2940 : OA32D1BWP7T port map(A1 => lbl2_v_count(3), A2 => lbl2_n_7, A3 => lbl2_n_12, B1 => lbl2_v_count(2), B2 => lbl2_n_11, Z => lbl2_n_23);
  lbl2_g2941 : MOAI22D0BWP7T port map(A1 => lbl2_n_0, A2 => lbl2_h_count(5), B1 => lbl2_n_0, B2 => lbl2_h_count(5), ZN => lbl2_n_22);
  lbl2_g2942 : IND2D1BWP7T port map(A1 => lbl2_n_14, B1 => lbl2_h_count(2), ZN => lbl2_n_21);
  lbl2_g2944 : NR4D0BWP7T port map(A1 => lbl2_v_count(0), A2 => lbl2_v_count(1), A3 => lbl2_v_count(4), A4 => lbl2_v_count(5), ZN => lbl2_n_18);
  lbl2_g2945 : IND2D1BWP7T port map(A1 => lbl2_n_0, B1 => lbl2_h_count(5), ZN => lbl2_n_19);
  lbl2_g2970 : NR4D0BWP7T port map(A1 => lbl2_n_11, A2 => lbl2_n_7, A3 => lbl2_v_count(6), A4 => lbl2_v_count(7), ZN => lbl2_n_17);
  lbl2_g2971 : MOAI22D0BWP7T port map(A1 => lbl2_n_10, A2 => lbl2_h_count(1), B1 => lbl2_n_10, B2 => lbl2_h_count(1), ZN => lbl2_n_16);
  lbl2_g2972 : MOAI22D0BWP7T port map(A1 => lbl2_n_142, A2 => lbl2_h_count(4), B1 => lbl2_n_142, B2 => lbl2_h_count(4), ZN => lbl2_n_15);
  lbl2_g2974 : ND2D1BWP7T port map(A1 => lbl2_h_count(0), A2 => lbl2_h_count(1), ZN => lbl2_n_14);
  lbl2_g2976 : CKND2D1BWP7T port map(A1 => lbl2_n_8, A2 => lbl2_v_count(9), ZN => lbl2_n_13);
  lbl2_g2977 : ND2D1BWP7T port map(A1 => lbl2_v_count(1), A2 => lbl2_v_count(0), ZN => lbl2_n_12);
  lbl2_g2563 : XNR2D1BWP7T port map(A1 => lbl2_v_count(1), A2 => lbl2_v_count(0), ZN => lbl2_n_1);
  lbl2_g2999 : IND2D1BWP7T port map(A1 => lbl2_n_142, B1 => lbl2_h_count(4), ZN => lbl2_n_0);
  lbl2_g3000 : XNR2D1BWP7T port map(A1 => lbl2_h_count(5), A2 => lbl2_h_count(6), ZN => lbl2_n_215);
  lbl2_h_count_reg_7 : DFKCND1BWP7T port map(CP => clk, CN => lbl2_n_43, D => lbl2_n_32, Q => lbl2_h_count(7), QN => lbl2_n_63);
  lbl2_v_count_reg_9 : DFD1BWP7T port map(CP => clk, D => lbl2_n_55, Q => lbl2_v_count(9), QN => lbl2_n_4);
  lbl2_v_count_reg_3 : DFD1BWP7T port map(CP => clk, D => lbl2_n_52, Q => lbl2_v_count(3), QN => lbl2_n_11);
  lbl2_h_count_reg_0 : DFKCND1BWP7T port map(CP => clk, CN => lbl2_n_10, D => lbl2_n_32, Q => lbl2_h_count(0), QN => lbl2_n_10);
  lbl2_v_count_reg_6 : DFD1BWP7T port map(CP => clk, D => lbl2_n_58, Q => lbl2_v_count(6), QN => lbl2_n_9);
  lbl2_v_count_reg_8 : DFD1BWP7T port map(CP => clk, D => lbl2_n_59, Q => lbl2_v_count(8), QN => lbl2_n_8);
  lbl2_v_count_reg_2 : DFD1BWP7T port map(CP => clk, D => lbl2_n_57, Q => lbl2_v_count(2), QN => lbl2_n_7);
  lbl2_h_count_reg_6 : DFKCND1BWP7T port map(CP => clk, CN => lbl2_n_35, D => lbl2_n_32, Q => lbl2_h_count(6), QN => lbl2_n_6);
  lbl2_v_count_reg_4 : DFD1BWP7T port map(CP => clk, D => lbl2_n_54, Q => lbl2_v_count(4), QN => lbl2_n_5);
  lbl2_g3019 : IND3D1BWP7T port map(A1 => lbl2_n_217, B1 => lbl2_v_count(4), B2 => lbl2_v_count(5), ZN => lbl2_n_216);
  lbl2_g3020 : IND3D1BWP7T port map(A1 => lbl2_n_12, B1 => lbl2_v_count(2), B2 => lbl2_v_count(3), ZN => lbl2_n_217);
  lbl2_g3021 : IOA21D1BWP7T port map(A1 => lbl2_x_vec(4), A2 => lbl2_n_218, B => lbl2_n_76, ZN => lbl2_n_219);
  lbl2_g3 : NR3D0BWP7T port map(A1 => lbl2_n_122, A2 => lbl2_n_215, A3 => lbl2_h_count(5), ZN => lbl2_n_218);
  lbl2_dec0_g100 : AO22D0BWP7T port map(A1 => lbl2_dec0_n_2, A2 => lbl2_data_synced(0), B1 => lbl2_data_synced(1), B2 => lbl2_dec0_n_1, Z => lbl2_walls(2));
  lbl2_dec0_g101 : IOA21D1BWP7T port map(A1 => lbl2_dec0_n_2, A2 => lbl2_dec0_n_0, B => lbl2_dec0_n_5, ZN => lbl2_walls(0));
  lbl2_dec0_g102 : IND2D1BWP7T port map(A1 => lbl2_dec0_n_2, B1 => lbl2_dec0_n_3, ZN => lbl2_walls(1));
  lbl2_dec0_g103 : IOA21D1BWP7T port map(A1 => lbl2_dec0_n_0, A2 => lbl2_data_synced(2), B => lbl2_data_synced(1), ZN => lbl2_dec0_n_5);
  lbl2_dec0_g104 : IOA21D1BWP7T port map(A1 => lbl2_data_synced(1), A2 => lbl2_data_synced(2), B => lbl2_dec0_n_3, ZN => lbl2_walls(3));
  lbl2_dec0_g105 : IND2D1BWP7T port map(A1 => lbl2_data_synced(2), B1 => lbl2_data_synced(0), ZN => lbl2_dec0_n_3);
  lbl2_dec0_g106 : ND2D0BWP7T port map(A1 => lbl2_data_synced(0), A2 => lbl2_data_synced(2), ZN => lbl2_dec0_n_1);
  lbl2_dec0_g107 : INR2D1BWP7T port map(A1 => lbl2_data_synced(2), B1 => lbl2_data_synced(1), ZN => lbl2_dec0_n_2);
  lbl2_dec0_g108 : INVD0BWP7T port map(I => lbl2_data_synced(0), ZN => lbl2_dec0_n_0);
  lbl2_dec1_g100 : AO22D0BWP7T port map(A1 => lbl2_dec1_n_2, A2 => lbl2_data_synced(4), B1 => lbl2_data_synced(5), B2 => lbl2_dec1_n_1, Z => lbl2_walls(6));
  lbl2_dec1_g101 : IOA21D1BWP7T port map(A1 => lbl2_dec1_n_2, A2 => lbl2_dec1_n_0, B => lbl2_dec1_n_5, ZN => lbl2_walls(4));
  lbl2_dec1_g102 : IND2D1BWP7T port map(A1 => lbl2_dec1_n_2, B1 => lbl2_dec1_n_3, ZN => lbl2_walls(5));
  lbl2_dec1_g103 : IOA21D1BWP7T port map(A1 => lbl2_dec1_n_0, A2 => lbl2_data_synced(6), B => lbl2_data_synced(5), ZN => lbl2_dec1_n_5);
  lbl2_dec1_g104 : IOA21D1BWP7T port map(A1 => lbl2_data_synced(5), A2 => lbl2_data_synced(6), B => lbl2_dec1_n_3, ZN => lbl2_walls(7));
  lbl2_dec1_g105 : IND2D1BWP7T port map(A1 => lbl2_data_synced(6), B1 => lbl2_data_synced(4), ZN => lbl2_dec1_n_3);
  lbl2_dec1_g106 : ND2D0BWP7T port map(A1 => lbl2_data_synced(4), A2 => lbl2_data_synced(6), ZN => lbl2_dec1_n_1);
  lbl2_dec1_g107 : INR2D1BWP7T port map(A1 => lbl2_data_synced(6), B1 => lbl2_data_synced(5), ZN => lbl2_dec1_n_2);
  lbl2_dec1_g108 : INVD0BWP7T port map(I => lbl2_data_synced(4), ZN => lbl2_dec1_n_0);
  lbl2_pxl_g8183 : NR4D0BWP7T port map(A1 => lbl2_pxl_n_215, A2 => lbl2_pxl_n_195, A3 => lbl2_pxl_n_127, A4 => lbl2_pxl_n_117, ZN => lbl2_pixelator_color(2));
  lbl2_pxl_g8184 : NR4D0BWP7T port map(A1 => lbl2_pxl_n_213, A2 => lbl2_pxl_n_208, A3 => lbl2_pxl_n_195, A4 => lbl2_pxl_n_178, ZN => lbl2_pixelator_color(0));
  lbl2_pxl_g8185 : OAI221D0BWP7T port map(A1 => lbl2_pxl_n_158, A2 => lbl2_pxl_n_121, B1 => player_state_1(0), B2 => lbl2_pxl_n_159, C => lbl2_pxl_n_214, ZN => lbl2_pxl_n_215);
  lbl2_pxl_g8186 : NR4D0BWP7T port map(A1 => lbl2_pxl_n_212, A2 => lbl2_pxl_n_202, A3 => lbl2_pxl_n_198, A4 => lbl2_pxl_n_177, ZN => lbl2_pxl_n_214);
  lbl2_pxl_g8187 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_117, B1 => lbl2_pxl_n_129, B2 => lbl2_pxl_n_211, ZN => lbl2_pxl_n_213);
  lbl2_pxl_g8188 : AO221D0BWP7T port map(A1 => lbl2_pxl_n_207, A2 => lbl2_pxl_n_154, B1 => lbl2_pxl_n_200, B2 => lbl2_pxl_n_163, C => lbl2_pxl_n_178, Z => lbl2_pxl_n_212);
  lbl2_pxl_g8189 : AOI31D0BWP7T port map(A1 => lbl2_pxl_n_207, A2 => lbl2_pxl_n_141, A3 => lbl2_pxl_n_138, B => lbl2_pxl_n_162, ZN => lbl2_pxl_n_211);
  lbl2_pxl_g8190 : INR4D0BWP7T port map(A1 => lbl2_pxl_n_159, B1 => lbl2_pxl_n_183, B2 => lbl2_pxl_n_205, B3 => lbl2_pxl_n_207, ZN => lbl2_pixelator_color(1));
  lbl2_pxl_g8191 : NR2D0BWP7T port map(A1 => lbl2_pxl_n_207, A2 => lbl2_pxl_n_203, ZN => lbl2_pixelator_color(3));
  lbl2_pxl_g8192 : OAI211D1BWP7T port map(A1 => lbl2_pxl_n_165, A2 => lbl2_pxl_n_199, B => lbl2_pxl_n_206, C => lbl2_pxl_n_197, ZN => lbl2_pxl_n_208);
  lbl2_pxl_g8193 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_204, A2 => lbl2_pxl_n_135, A3 => lbl2_pxl_n_124, ZN => lbl2_pxl_n_207);
  lbl2_pxl_g8194 : AOI211XD0BWP7T port map(A1 => lbl2_pxl_n_201, A2 => lbl2_pxl_n_111, B => lbl2_pxl_n_193, C => lbl2_pxl_n_186, ZN => lbl2_pxl_n_206);
  lbl2_pxl_g8195 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_198, B1 => lbl2_pxl_n_181, B2 => lbl2_pxl_n_185, B3 => lbl2_pxl_n_197, ZN => lbl2_pxl_n_205);
  lbl2_pxl_g8196 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_200, A2 => lbl2_pxl_n_157, A3 => lbl2_pxl_n_149, ZN => lbl2_pxl_n_204);
  lbl2_pxl_g8197 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_127, B1 => lbl2_pxl_n_129, B2 => lbl2_pxl_n_189, B3 => lbl2_pxl_n_190, ZN => lbl2_pxl_n_203);
  lbl2_pxl_g8198 : OAI21D0BWP7T port map(A1 => lbl2_pxl_n_196, A2 => lbl2_pxl_n_111, B => lbl2_pxl_n_194, ZN => lbl2_pxl_n_202);
  lbl2_pxl_g8199 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_196, A2 => lbl2_pxl_n_113, ZN => lbl2_pxl_n_201);
  lbl2_pxl_g8200 : CKND1BWP7T port map(I => lbl2_pxl_n_199, ZN => lbl2_pxl_n_200);
  lbl2_pxl_g8201 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_191, A2 => lbl2_pxl_n_113, A3 => lbl2_pxl_n_111, ZN => lbl2_pxl_n_199);
  lbl2_pxl_g8202 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_192, A2 => player_state_1(0), ZN => lbl2_pxl_n_198);
  lbl2_pxl_g8203 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_192, B1 => player_state_1(0), ZN => lbl2_pxl_n_197);
  lbl2_pxl_g8204 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_191, A2 => lbl2_pxl_n_100, ZN => lbl2_pxl_n_196);
  lbl2_pxl_g8205 : IAO21D0BWP7T port map(A1 => lbl2_pxl_n_189, A2 => lbl2_pxl_n_8, B => lbl2_pxl_n_186, ZN => lbl2_pxl_n_194);
  lbl2_pxl_g8206 : MOAI22D0BWP7T port map(A1 => lbl2_pxl_n_189, A2 => player_state_0(0), B1 => lbl2_pxl_n_182, B2 => position_1(10), ZN => lbl2_pxl_n_193);
  lbl2_pxl_g8207 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_187, B1 => lbl2_pxl_n_181, B2 => lbl2_pxl_n_185, ZN => lbl2_pxl_n_195);
  lbl2_pxl_g8208 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_188, A2 => lbl2_pxl_n_114, ZN => lbl2_pxl_n_192);
  lbl2_pxl_g8209 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_187, A2 => lbl2_pxl_n_183, ZN => lbl2_pxl_n_190);
  lbl2_pxl_g8210 : INR2XD0BWP7T port map(A1 => lbl2_pxl_n_188, B1 => lbl2_pxl_n_114, ZN => lbl2_pxl_n_191);
  lbl2_pxl_g8211 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_184, A2 => lbl2_pxl_n_112, ZN => lbl2_pxl_n_189);
  lbl2_pxl_g8212 : INR2XD0BWP7T port map(A1 => lbl2_pxl_n_184, B1 => lbl2_pxl_n_112, ZN => lbl2_pxl_n_188);
  lbl2_pxl_g8213 : OAI32D1BWP7T port map(A1 => lbl2_data_synced(7), A2 => lbl2_pxl_n_115, A3 => lbl2_pxl_n_179, B1 => lbl2_pxl_n_130, B2 => lbl2_pxl_n_176, ZN => lbl2_pxl_n_187);
  lbl2_pxl_g8214 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_179, A2 => lbl2_pxl_n_116, ZN => lbl2_pxl_n_186);
  lbl2_pxl_g8215 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_115, B1 => lbl2_data_synced(7), B2 => lbl2_pxl_n_180, ZN => lbl2_pxl_n_185);
  lbl2_pxl_g8216 : AN4D1BWP7T port map(A1 => lbl2_pxl_n_180, A2 => lbl2_pxl_n_115, A3 => lbl2_pxl_n_116, A4 => lbl2_pxl_n_98, Z => lbl2_pxl_n_184);
  lbl2_pxl_g8217 : AN4D1BWP7T port map(A1 => lbl2_pxl_n_180, A2 => lbl2_pxl_n_115, A3 => lbl2_pxl_n_116, A4 => lbl2_pxl_n_97, Z => lbl2_pxl_n_183);
  lbl2_pxl_g8218 : OAI211D1BWP7T port map(A1 => lbl2_pxl_n_134, A2 => lbl2_pxl_n_174, B => lbl2_pxl_n_172, C => lbl2_pxl_n_167, ZN => lbl2_pxl_n_182);
  lbl2_pxl_g8219 : INVD0BWP7T port map(I => lbl2_pxl_n_180, ZN => lbl2_pxl_n_179);
  lbl2_pxl_g8220 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_176, B1 => lbl2_pxl_n_130, B2 => lbl2_pxl_n_132, ZN => lbl2_pxl_n_181);
  lbl2_pxl_g8221 : INR3D0BWP7T port map(A1 => lbl2_pxl_n_130, B1 => lbl2_pxl_n_132, B2 => lbl2_pxl_n_176, ZN => lbl2_pxl_n_180);
  lbl2_pxl_g8222 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_173, A2 => lbl2_pxl_n_124, A3 => lbl2_pxl_n_114, ZN => lbl2_pxl_n_178);
  lbl2_pxl_g8223 : OAI221D0BWP7T port map(A1 => lbl2_pxl_n_168, A2 => lbl2_pxl_n_144, B1 => lbl2_pxl_n_143, B2 => lbl2_pxl_n_161, C => lbl2_pxl_n_175, ZN => lbl2_pxl_n_177);
  lbl2_pxl_g8224 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_135, A2 => position_1(10), B => lbl2_pxl_n_174, Z => lbl2_pxl_n_176);
  lbl2_pxl_g8225 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_171, A2 => lbl2_pxl_n_146, B1 => lbl2_pxl_n_166, B2 => lbl2_pxl_n_148, ZN => lbl2_pxl_n_175);
  lbl2_pxl_g8226 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_146, B1 => lbl2_pxl_n_171, ZN => lbl2_pxl_n_174);
  lbl2_pxl_g8227 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_112, B1 => lbl2_pxl_n_113, B2 => lbl2_pxl_n_111, B3 => lbl2_pxl_n_169, ZN => lbl2_pxl_n_173);
  lbl2_pxl_g8228 : AOI31D0BWP7T port map(A1 => lbl2_pxl_n_160, A2 => lbl2_pxl_n_143, A3 => lbl2_pxl_n_136, B => lbl2_pxl_n_170, ZN => lbl2_pxl_n_172);
  lbl2_pxl_g8229 : AOI211XD0BWP7T port map(A1 => lbl2_pxl_n_124, A2 => position_1(10), B => lbl2_pxl_n_168, C => lbl2_pxl_n_145, ZN => lbl2_pxl_n_171);
  lbl2_pxl_g8230 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_168, A2 => lbl2_pxl_n_145, A3 => lbl2_pxl_n_123, ZN => lbl2_pxl_n_170);
  lbl2_pxl_g8231 : AN4D0BWP7T port map(A1 => lbl2_pxl_n_164, A2 => lbl2_pxl_n_157, A3 => lbl2_pxl_n_134, A4 => lbl2_pxl_n_98, Z => lbl2_pxl_n_169);
  lbl2_pxl_g8232 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_148, B1 => lbl2_pxl_n_125, B2 => lbl2_pxl_n_166, ZN => lbl2_pxl_n_167);
  lbl2_pxl_g8233 : OAI211D1BWP7T port map(A1 => lbl2_pxl_n_4, A2 => lbl2_pxl_n_126, B => lbl2_pxl_n_166, C => lbl2_pxl_n_147, ZN => lbl2_pxl_n_168);
  lbl2_pxl_g8234 : AOI211XD0BWP7T port map(A1 => lbl2_pxl_n_136, A2 => position_1(10), B => lbl2_pxl_n_161, C => lbl2_pxl_n_142, ZN => lbl2_pxl_n_166);
  lbl2_pxl_g8235 : AOI222D0BWP7T port map(A1 => lbl2_pxl_n_157, A2 => lbl2_pxl_n_151, B1 => lbl2_pxl_n_139, B2 => lbl2_pxl_n_136, C1 => lbl2_pxl_n_131, C2 => lbl2_pxl_n_125, ZN => lbl2_pxl_n_165);
  lbl2_pxl_g8236 : INR3D0BWP7T port map(A1 => lbl2_pxl_n_138, B1 => lbl2_pxl_n_140, B2 => lbl2_pxl_n_155, ZN => lbl2_pxl_n_164);
  lbl2_pxl_g8237 : OAI21D0BWP7T port map(A1 => lbl2_pxl_n_156, A2 => lbl2_pxl_n_149, B => lbl2_pxl_n_150, ZN => lbl2_pxl_n_163);
  lbl2_pxl_g8238 : OAI22D0BWP7T port map(A1 => lbl2_pxl_n_158, A2 => lbl2_pxl_n_133, B1 => lbl2_pxl_n_159, B2 => lbl2_pxl_n_13, ZN => lbl2_pxl_n_162);
  lbl2_pxl_g8239 : INVD0BWP7T port map(I => lbl2_pxl_n_161, ZN => lbl2_pxl_n_160);
  lbl2_pxl_g8240 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_158, B1 => lbl2_pxl_n_122, B2 => lbl2_pxl_n_121, ZN => lbl2_pxl_n_161);
  lbl2_pxl_g8241 : OR2D1BWP7T port map(A1 => lbl2_pxl_n_152, A2 => lbl2_pxl_n_120, Z => lbl2_pxl_n_159);
  lbl2_pxl_g8242 : OAI211D1BWP7T port map(A1 => lbl2_pxl_n_100, A2 => lbl2_pxl_n_54, B => lbl2_pxl_n_153, C => lbl2_pxl_n_120, ZN => lbl2_pxl_n_158);
  lbl2_pxl_g8243 : INVD1BWP7T port map(I => lbl2_pxl_n_156, ZN => lbl2_pxl_n_157);
  lbl2_pxl_g8244 : ND4D0BWP7T port map(A1 => lbl2_pxl_n_149, A2 => lbl2_pxl_n_119, A3 => lbl2_pxl_n_96, A4 => lbl2_pxl_n_94, ZN => lbl2_pxl_n_155);
  lbl2_pxl_g8245 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_136, B1 => lbl2_pxl_n_126, B2 => lbl2_pxl_n_150, ZN => lbl2_pxl_n_156);
  lbl2_pxl_g8246 : OAI31D0BWP7T port map(A1 => lbl2_data_synced(3), A2 => lbl2_pxl_n_119, A3 => lbl2_pxl_n_140, B => lbl2_pxl_n_138, ZN => lbl2_pxl_n_154);
  lbl2_pxl_g8247 : CKND1BWP7T port map(I => lbl2_pxl_n_152, ZN => lbl2_pxl_n_153);
  lbl2_pxl_g8248 : MOAI22D0BWP7T port map(A1 => lbl2_pxl_n_137, A2 => lbl2_pxl_n_134, B1 => lbl2_pxl_n_124, B2 => lbl2_pxl_n_128, ZN => lbl2_pxl_n_151);
  lbl2_pxl_g8249 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_127, B1 => lbl2_pxl_n_99, B2 => lbl2_pxl_n_129, ZN => lbl2_pxl_n_152);
  lbl2_pxl_g8250 : INVD0BWP7T port map(I => lbl2_pxl_n_147, ZN => lbl2_pxl_n_148);
  lbl2_pxl_g8251 : AN2D1BWP7T port map(A1 => lbl2_pxl_n_131, A2 => lbl2_pxl_n_139, Z => lbl2_pxl_n_150);
  lbl2_pxl_g8252 : INR2D1BWP7T port map(A1 => lbl2_pxl_n_128, B1 => lbl2_pxl_n_137, ZN => lbl2_pxl_n_149);
  lbl2_pxl_g8253 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_131, B1 => position_0(10), ZN => lbl2_pxl_n_147);
  lbl2_pxl_g8254 : INVD0BWP7T port map(I => lbl2_pxl_n_145, ZN => lbl2_pxl_n_144);
  lbl2_pxl_g8255 : INVD0BWP7T port map(I => lbl2_pxl_n_142, ZN => lbl2_pxl_n_143);
  lbl2_pxl_g8256 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_118, A2 => lbl2_data_synced(3), B => lbl2_pxl_n_140, Z => lbl2_pxl_n_141);
  lbl2_pxl_g8257 : AN2D0BWP7T port map(A1 => lbl2_pxl_n_137, A2 => position_0(10), Z => lbl2_pxl_n_146);
  lbl2_pxl_g8258 : INR2D1BWP7T port map(A1 => position_0(10), B1 => lbl2_pxl_n_128, ZN => lbl2_pxl_n_145);
  lbl2_pxl_g8259 : INR2D1BWP7T port map(A1 => position_0(10), B1 => lbl2_pxl_n_139, ZN => lbl2_pxl_n_142);
  lbl2_pxl_g8260 : INVD0BWP7T port map(I => lbl2_pxl_n_135, ZN => lbl2_pxl_n_134);
  lbl2_pxl_g8261 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_122, B1 => lbl2_pxl_n_121, ZN => lbl2_pxl_n_133);
  lbl2_pxl_g8262 : AOI21D0BWP7T port map(A1 => lbl2_pxl_n_106, A2 => lbl2_pxl_n_103, B => lbl2_pxl_n_30, ZN => lbl2_pxl_n_140);
  lbl2_pxl_g8263 : OR4XD1BWP7T port map(A1 => lbl2_pxl_n_3, A2 => lbl2_pxl_n_15, A3 => lbl2_pxl_n_102, A4 => lbl2_pxl_n_0, Z => lbl2_pxl_n_139);
  lbl2_pxl_g8264 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_104, A2 => lbl2_pxl_n_108, B => lbl2_pxl_n_19, Z => lbl2_pxl_n_138);
  lbl2_pxl_g8265 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_0, A2 => lbl2_pxl_n_110, A3 => lbl2_pxl_n_32, ZN => lbl2_pxl_n_137);
  lbl2_pxl_g8266 : NR4D0BWP7T port map(A1 => lbl2_pxl_n_1, A2 => lbl2_pxl_n_102, A3 => lbl2_pxl_n_28, A4 => lbl2_pxl_n_3, ZN => lbl2_pxl_n_136);
  lbl2_pxl_g8267 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_1, A2 => lbl2_pxl_n_110, A3 => lbl2_pxl_n_16, ZN => lbl2_pxl_n_135);
  lbl2_pxl_g8268 : INVD0BWP7T port map(I => lbl2_pxl_n_126, ZN => lbl2_pxl_n_125);
  lbl2_pxl_g8269 : INVD1BWP7T port map(I => lbl2_pxl_n_123, ZN => lbl2_pxl_n_124);
  lbl2_pxl_g8270 : AOI211XD0BWP7T port map(A1 => lbl2_pxl_n_91, A2 => lbl2_pxl_n_93, B => lbl2_pxl_n_30, C => lbl2_pxl_n_4, ZN => lbl2_pxl_n_132);
  lbl2_pxl_g8271 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_0, B1 => lbl2_pxl_n_3, B2 => lbl2_pxl_n_20, B3 => lbl2_pxl_n_101, ZN => lbl2_pxl_n_131);
  lbl2_pxl_g8272 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_19, B1 => position_0(10), B2 => lbl2_pxl_n_107, ZN => lbl2_pxl_n_130);
  lbl2_pxl_g8273 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_112, A2 => lbl2_pxl_n_8, A3 => position_0(10), ZN => lbl2_pxl_n_129);
  lbl2_pxl_g8274 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_0, B1 => lbl2_pxl_n_31, B2 => lbl2_pxl_n_109, ZN => lbl2_pxl_n_128);
  lbl2_pxl_g8275 : AN3D1BWP7T port map(A1 => lbl2_pxl_n_112, A2 => player_state_0(0), A3 => position_0(10), Z => lbl2_pxl_n_127);
  lbl2_pxl_g8276 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_1, B1 => lbl2_pxl_n_3, B2 => lbl2_pxl_n_26, B3 => lbl2_pxl_n_101, ZN => lbl2_pxl_n_126);
  lbl2_pxl_g8277 : IND3D1BWP7T port map(A1 => lbl2_pxl_n_1, B1 => lbl2_pxl_n_21, B2 => lbl2_pxl_n_109, ZN => lbl2_pxl_n_123);
  lbl2_pxl_g8278 : OR2D1BWP7T port map(A1 => lbl2_pxl_n_113, A2 => lbl2_pxl_n_4, Z => lbl2_pxl_n_122);
  lbl2_pxl_g8279 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_111, B1 => position_0(10), ZN => lbl2_pxl_n_121);
  lbl2_pxl_g8280 : INVD0BWP7T port map(I => lbl2_pxl_n_119, ZN => lbl2_pxl_n_118);
  lbl2_pxl_g8281 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_114, A2 => position_1(10), ZN => lbl2_pxl_n_120);
  lbl2_pxl_g8282 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_83, A2 => lbl2_walls(0), B1 => lbl2_pxl_n_90, B2 => lbl2_walls(1), C => lbl2_pxl_n_105, ZN => lbl2_pxl_n_119);
  lbl2_pxl_g8283 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_99, A2 => lbl2_pxl_n_97, ZN => lbl2_pxl_n_117);
  lbl2_pxl_g8284 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_80, A2 => lbl2_jumps_synced(4), B1 => lbl2_pxl_n_81, B2 => lbl2_jumps_synced(6), C => lbl2_pxl_n_73, ZN => lbl2_pxl_n_116);
  lbl2_pxl_g8285 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_67, A2 => lbl2_walls(4), B1 => lbl2_pxl_n_75, B2 => lbl2_walls(7), C => lbl2_pxl_n_95, ZN => lbl2_pxl_n_115);
  lbl2_pxl_g8286 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_77, A2 => lbl2_pxl_n_12, B1 => lbl2_pxl_n_57, B2 => direction_1(0), C => lbl2_pxl_n_30, ZN => lbl2_pxl_n_114);
  lbl2_pxl_g8287 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_48, A2 => lbl2_pxl_n_2, ZN => lbl2_pxl_n_113);
  lbl2_pxl_g8288 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_77, A2 => lbl2_pxl_n_6, B1 => lbl2_pxl_n_57, B2 => direction_0(0), C => lbl2_pxl_n_19, ZN => lbl2_pxl_n_112);
  lbl2_pxl_g8289 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_42, A2 => lbl2_pxl_n_2, ZN => lbl2_pxl_n_111);
  lbl2_pxl_g8290 : AOI33D1BWP7T port map(A1 => lbl2_pxl_n_83, A2 => lbl2_pxl_n_6, A3 => direction_0(1), B1 => lbl2_pxl_n_90, B2 => direction_0(0), B3 => direction_0(1), ZN => lbl2_pxl_n_108);
  lbl2_pxl_g8291 : OAI211D1BWP7T port map(A1 => lbl2_pxl_n_15, A2 => lbl2_pxl_n_79, B => lbl2_pxl_n_92, C => lbl2_pxl_n_78, ZN => lbl2_pxl_n_107);
  lbl2_pxl_g8292 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_90, A2 => lbl2_pxl_n_27, B1 => lbl2_pxl_n_89, B2 => lbl2_pxl_n_21, ZN => lbl2_pxl_n_106);
  lbl2_pxl_g8293 : AO22D0BWP7T port map(A1 => lbl2_pxl_n_84, A2 => lbl2_walls(3), B1 => lbl2_walls(2), B2 => lbl2_pxl_n_89, Z => lbl2_pxl_n_105);
  lbl2_pxl_g8294 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_89, A2 => lbl2_pxl_n_31, B1 => lbl2_pxl_n_84, B2 => lbl2_pxl_n_20, ZN => lbl2_pxl_n_104);
  lbl2_pxl_g8295 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_83, A2 => lbl2_pxl_n_17, B1 => lbl2_pxl_n_84, B2 => lbl2_pxl_n_26, ZN => lbl2_pxl_n_103);
  lbl2_pxl_g8296 : OAI21D0BWP7T port map(A1 => lbl2_pxl_n_87, A2 => lbl2_v_count(2), B => lbl2_v_count(3), ZN => lbl2_pxl_n_110);
  lbl2_pxl_g8297 : AOI21D0BWP7T port map(A1 => lbl2_pxl_n_88, A2 => lbl2_v_count(2), B => lbl2_v_count(3), ZN => lbl2_pxl_n_109);
  lbl2_pxl_g8298 : INVD0BWP7T port map(I => lbl2_pxl_n_98, ZN => lbl2_pxl_n_97);
  lbl2_pxl_g8299 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_86, A2 => lbl2_h_count(2), ZN => lbl2_pxl_n_102);
  lbl2_pxl_g8300 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_85, A2 => lbl2_h_count(2), ZN => lbl2_pxl_n_101);
  lbl2_pxl_g8301 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_76, A2 => lbl2_pxl_n_41, A3 => lbl2_pxl_n_38, ZN => lbl2_pxl_n_100);
  lbl2_pxl_g8302 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_70, A2 => lbl2_borders_synced(4), B1 => lbl2_pxl_n_69, B2 => lbl2_borders_synced(6), C => lbl2_pxl_n_65, ZN => lbl2_pxl_n_99);
  lbl2_pxl_g8304 : AOI221D0BWP7T port map(A1 => lbl2_pxl_n_70, A2 => lbl2_borders_synced(0), B1 => lbl2_pxl_n_69, B2 => lbl2_borders_synced(2), C => lbl2_pxl_n_64, ZN => lbl2_pxl_n_98);
  lbl2_pxl_g8305 : AOI222D0BWP7T port map(A1 => lbl2_pxl_n_58, A2 => lbl2_jumps_synced(1), B1 => lbl2_pxl_n_56, B2 => lbl2_jumps_synced(3), C1 => lbl2_pxl_n_74, C2 => lbl2_pxl_n_55, ZN => lbl2_pxl_n_96);
  lbl2_pxl_g8306 : MOAI22D0BWP7T port map(A1 => lbl2_pxl_n_79, A2 => lbl2_pxl_n_9, B1 => lbl2_pxl_n_68, B2 => lbl2_walls(6), ZN => lbl2_pxl_n_95);
  lbl2_pxl_g8307 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_80, A2 => lbl2_jumps_synced(0), B1 => lbl2_pxl_n_81, B2 => lbl2_jumps_synced(2), ZN => lbl2_pxl_n_94);
  lbl2_pxl_g8308 : MAOI22D0BWP7T port map(A1 => lbl2_pxl_n_68, A2 => lbl2_pxl_n_21, B1 => lbl2_pxl_n_79, B2 => lbl2_pxl_n_28, ZN => lbl2_pxl_n_93);
  lbl2_pxl_g8309 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_67, A2 => lbl2_pxl_n_33, B1 => lbl2_pxl_n_75, B2 => lbl2_pxl_n_20, ZN => lbl2_pxl_n_92);
  lbl2_pxl_g8310 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_67, A2 => lbl2_pxl_n_17, B1 => lbl2_pxl_n_75, B2 => lbl2_pxl_n_26, ZN => lbl2_pxl_n_91);
  lbl2_pxl_g8311 : INVD0BWP7T port map(I => lbl2_pxl_n_88, ZN => lbl2_pxl_n_87);
  lbl2_pxl_g8312 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_82, A2 => lbl2_pxl_n_71, ZN => lbl2_pxl_n_90);
  lbl2_pxl_g8313 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_82, A2 => lbl2_pxl_n_50, ZN => lbl2_pxl_n_89);
  lbl2_pxl_g8314 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_76, A2 => lbl2_pxl_n_41, ZN => lbl2_pxl_n_88);
  lbl2_pxl_g8315 : INVD0BWP7T port map(I => lbl2_pxl_n_85, ZN => lbl2_pxl_n_86);
  lbl2_pxl_g8316 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_76, A2 => lbl2_pxl_n_38, ZN => lbl2_pxl_n_85);
  lbl2_pxl_g8317 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_50, A2 => lbl2_pxl_n_71, A3 => lbl2_pxl_n_72, ZN => lbl2_pxl_n_84);
  lbl2_pxl_g8318 : NR3D0BWP7T port map(A1 => lbl2_pxl_n_50, A2 => lbl2_pxl_n_71, A3 => lbl2_pxl_n_53, ZN => lbl2_pxl_n_83);
  lbl2_pxl_g8319 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_68, A2 => lbl2_pxl_n_31, ZN => lbl2_pxl_n_78);
  lbl2_pxl_g8320 : OR2D1BWP7T port map(A1 => lbl2_pxl_n_53, A2 => lbl2_pxl_n_72, Z => lbl2_pxl_n_82);
  lbl2_pxl_g8321 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_63, A2 => lbl2_h_count(1), B => lbl2_pxl_n_69, Z => lbl2_pxl_n_81);
  lbl2_pxl_g8322 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_62, A2 => lbl2_h_count(1), B => lbl2_pxl_n_70, Z => lbl2_pxl_n_80);
  lbl2_pxl_g8323 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_47, A2 => lbl2_pxl_n_61, A3 => lbl2_pxl_n_60, ZN => lbl2_pxl_n_79);
  lbl2_pxl_g8324 : OAI33D1BWP7T port map(A1 => lbl2_v_count(0), A2 => lbl2_pxl_n_11, A3 => lbl2_pxl_n_18, B1 => lbl2_v_count(3), B2 => lbl2_pxl_n_5, B3 => lbl2_pxl_n_29, ZN => lbl2_pxl_n_74);
  lbl2_pxl_g8325 : AO22D0BWP7T port map(A1 => lbl2_pxl_n_58, A2 => lbl2_jumps_synced(5), B1 => lbl2_jumps_synced(7), B2 => lbl2_pxl_n_56, Z => lbl2_pxl_n_73);
  lbl2_pxl_g8326 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_66, A2 => lbl2_pxl_n_41, ZN => lbl2_pxl_n_77);
  lbl2_pxl_g8327 : MAOI222D1BWP7T port map(A => lbl2_pxl_n_59, B => lbl2_pxl_n_37, C => lbl2_pxl_n_43, ZN => lbl2_pxl_n_76);
  lbl2_pxl_g8328 : AN3D1BWP7T port map(A1 => lbl2_pxl_n_61, A2 => lbl2_pxl_n_46, A3 => lbl2_pxl_n_60, Z => lbl2_pxl_n_75);
  lbl2_pxl_g8329 : INR2XD0BWP7T port map(A1 => lbl2_pxl_n_23, B1 => lbl2_pxl_n_60, ZN => lbl2_pxl_n_72);
  lbl2_pxl_g8330 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_61, A2 => lbl2_pxl_n_22, ZN => lbl2_pxl_n_71);
  lbl2_pxl_g8331 : AN2D1BWP7T port map(A1 => lbl2_pxl_n_62, A2 => lbl2_pxl_n_5, Z => lbl2_pxl_n_70);
  lbl2_pxl_g8332 : AN2D1BWP7T port map(A1 => lbl2_pxl_n_63, A2 => lbl2_v_count(0), Z => lbl2_pxl_n_69);
  lbl2_pxl_g8333 : NR2D0BWP7T port map(A1 => lbl2_pxl_n_62, A2 => lbl2_pxl_n_63, ZN => lbl2_pxl_n_66);
  lbl2_pxl_g8334 : AO22D0BWP7T port map(A1 => lbl2_pxl_n_49, A2 => lbl2_borders_synced(5), B1 => lbl2_borders_synced(7), B2 => lbl2_pxl_n_52, Z => lbl2_pxl_n_65);
  lbl2_pxl_g8335 : AO22D0BWP7T port map(A1 => lbl2_pxl_n_49, A2 => lbl2_borders_synced(1), B1 => lbl2_borders_synced(3), B2 => lbl2_pxl_n_52, Z => lbl2_pxl_n_64);
  lbl2_pxl_g8336 : INR2D1BWP7T port map(A1 => lbl2_pxl_n_60, B1 => lbl2_pxl_n_51, ZN => lbl2_pxl_n_68);
  lbl2_pxl_g8337 : INR2D1BWP7T port map(A1 => lbl2_pxl_n_61, B1 => lbl2_pxl_n_51, ZN => lbl2_pxl_n_67);
  lbl2_pxl_g8338 : IND4D0BWP7T port map(A1 => lbl2_pxl_n_22, B1 => lbl2_pxl_n_35, B2 => lbl2_pxl_n_23, B3 => lbl2_pxl_n_36, ZN => lbl2_pxl_n_59);
  lbl2_pxl_g8339 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_29, A2 => lbl2_pxl_n_11, ZN => lbl2_pxl_n_63);
  lbl2_pxl_g8340 : NR2XD0BWP7T port map(A1 => lbl2_pxl_n_18, A2 => lbl2_v_count(3), ZN => lbl2_pxl_n_62);
  lbl2_pxl_g8341 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_18, A2 => lbl2_v_count(3), ZN => lbl2_pxl_n_61);
  lbl2_pxl_g8342 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_29, A2 => lbl2_pxl_n_11, ZN => lbl2_pxl_n_60);
  lbl2_pxl_g8343 : OAI33D1BWP7T port map(A1 => lbl2_h_count(0), A2 => lbl2_pxl_n_3, A3 => lbl2_pxl_n_14, B1 => lbl2_pxl_n_7, B2 => lbl2_pxl_n_25, B3 => lbl2_h_count(3), ZN => lbl2_pxl_n_55);
  lbl2_pxl_g8344 : AOI22D0BWP7T port map(A1 => lbl2_pxl_n_48, A2 => position_1(10), B1 => lbl2_pxl_n_42, B2 => position_0(10), ZN => lbl2_pxl_n_54);
  lbl2_pxl_g8345 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_44, A2 => lbl2_v_count(1), B => lbl2_pxl_n_49, Z => lbl2_pxl_n_58);
  lbl2_pxl_g8346 : ND3D0BWP7T port map(A1 => lbl2_pxl_n_40, A2 => lbl2_pxl_n_45, A3 => lbl2_pxl_n_38, ZN => lbl2_pxl_n_57);
  lbl2_pxl_g8347 : AO21D0BWP7T port map(A1 => lbl2_pxl_n_39, A2 => lbl2_v_count(1), B => lbl2_pxl_n_52, Z => lbl2_pxl_n_56);
  lbl2_pxl_g8348 : INR2XD0BWP7T port map(A1 => lbl2_pxl_n_36, B1 => lbl2_pxl_n_47, ZN => lbl2_pxl_n_53);
  lbl2_pxl_g8349 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_40, A2 => lbl2_pxl_n_7, ZN => lbl2_pxl_n_52);
  lbl2_pxl_g8350 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_47, A2 => lbl2_pxl_n_46, ZN => lbl2_pxl_n_51);
  lbl2_pxl_g8351 : INR2XD0BWP7T port map(A1 => lbl2_pxl_n_35, B1 => lbl2_pxl_n_46, ZN => lbl2_pxl_n_50);
  lbl2_pxl_g8352 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_45, A2 => lbl2_h_count(0), ZN => lbl2_pxl_n_49);
  lbl2_pxl_g8353 : CKND1BWP7T port map(I => lbl2_pxl_n_44, ZN => lbl2_pxl_n_45);
  lbl2_pxl_g8354 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_34, A2 => player_state_1(0), ZN => lbl2_pxl_n_48);
  lbl2_pxl_g8355 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_14, A2 => lbl2_pxl_n_25, ZN => lbl2_pxl_n_43);
  lbl2_pxl_g8356 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_14, A2 => lbl2_h_count(3), ZN => lbl2_pxl_n_47);
  lbl2_pxl_g8357 : ND2D1BWP7T port map(A1 => lbl2_pxl_n_25, A2 => lbl2_pxl_n_3, ZN => lbl2_pxl_n_46);
  lbl2_pxl_g8358 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_14, A2 => lbl2_h_count(3), ZN => lbl2_pxl_n_44);
  lbl2_pxl_g8360 : CKND1BWP7T port map(I => lbl2_pxl_n_39, ZN => lbl2_pxl_n_40);
  lbl2_pxl_g8362 : MAOI22D0BWP7T port map(A1 => lbl2_pxl_n_10, A2 => lbl2_v_count(1), B1 => lbl2_pxl_n_10, B2 => lbl2_v_count(1), ZN => lbl2_pxl_n_37);
  lbl2_pxl_g8363 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_24, A2 => player_state_0(0), ZN => lbl2_pxl_n_42);
  lbl2_pxl_g8364 : MOAI22D0BWP7T port map(A1 => lbl2_pxl_n_3, A2 => lbl2_h_count(2), B1 => lbl2_pxl_n_3, B2 => lbl2_h_count(2), ZN => lbl2_pxl_n_41);
  lbl2_pxl_g8365 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_25, A2 => lbl2_pxl_n_3, ZN => lbl2_pxl_n_39);
  lbl2_pxl_g8367 : MOAI22D0BWP7T port map(A1 => lbl2_pxl_n_11, A2 => lbl2_v_count(2), B1 => lbl2_pxl_n_11, B2 => lbl2_v_count(2), ZN => lbl2_pxl_n_38);
  lbl2_pxl_g8369 : INVD0BWP7T port map(I => lbl2_pxl_n_32, ZN => lbl2_pxl_n_33);
  lbl2_pxl_g8370 : INVD0BWP7T port map(I => lbl2_pxl_n_28, ZN => lbl2_pxl_n_27);
  lbl2_pxl_g8371 : IND2D1BWP7T port map(A1 => lbl2_h_count(2), B1 => lbl2_pxl_n_7, ZN => lbl2_pxl_n_36);
  lbl2_pxl_g8372 : ND2D1BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(0), ZN => lbl2_pxl_n_35);
  lbl2_pxl_g8373 : IND2D1BWP7T port map(A1 => player_state_1(1), B1 => lbl2_n_188, ZN => lbl2_pxl_n_34);
  lbl2_pxl_g8374 : CKND2D1BWP7T port map(A1 => lbl2_pxl_n_6, A2 => direction_0(1), ZN => lbl2_pxl_n_32);
  lbl2_pxl_g8375 : NR2D1BWP7T port map(A1 => direction_0(0), A2 => direction_0(1), ZN => lbl2_pxl_n_31);
  lbl2_pxl_g8376 : ND2D1BWP7T port map(A1 => lbl2_n_188, A2 => player_state_1(1), ZN => lbl2_pxl_n_30);
  lbl2_pxl_g8377 : ND2D1BWP7T port map(A1 => lbl2_v_count(2), A2 => lbl2_v_count(1), ZN => lbl2_pxl_n_29);
  lbl2_pxl_g8378 : CKND2D1BWP7T port map(A1 => direction_1(1), A2 => direction_1(0), ZN => lbl2_pxl_n_28);
  lbl2_pxl_g8379 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_12, A2 => direction_1(1), ZN => lbl2_pxl_n_26);
  lbl2_pxl_g8380 : CKND2D1BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(1), ZN => lbl2_pxl_n_25);
  lbl2_pxl_g8382 : INVD0BWP7T port map(I => lbl2_pxl_n_16, ZN => lbl2_pxl_n_17);
  lbl2_pxl_g8383 : IND2D1BWP7T port map(A1 => player_state_0(1), B1 => lbl2_n_189, ZN => lbl2_pxl_n_24);
  lbl2_pxl_g8384 : ND2D1BWP7T port map(A1 => lbl2_v_count(2), A2 => lbl2_v_count(0), ZN => lbl2_pxl_n_23);
  lbl2_pxl_g8385 : NR2XD0BWP7T port map(A1 => lbl2_v_count(2), A2 => lbl2_v_count(0), ZN => lbl2_pxl_n_22);
  lbl2_pxl_g8386 : NR2D0BWP7T port map(A1 => direction_1(1), A2 => direction_1(0), ZN => lbl2_pxl_n_21);
  lbl2_pxl_g8387 : NR2D1BWP7T port map(A1 => lbl2_pxl_n_6, A2 => direction_0(1), ZN => lbl2_pxl_n_20);
  lbl2_pxl_g8388 : ND2D1BWP7T port map(A1 => lbl2_n_189, A2 => player_state_0(1), ZN => lbl2_pxl_n_19);
  lbl2_pxl_g8389 : IND2D1BWP7T port map(A1 => lbl2_v_count(1), B1 => lbl2_pxl_n_10, ZN => lbl2_pxl_n_18);
  lbl2_pxl_g8390 : CKND2D1BWP7T port map(A1 => lbl2_pxl_n_12, A2 => direction_1(1), ZN => lbl2_pxl_n_16);
  lbl2_pxl_g8391 : CKND2D1BWP7T port map(A1 => direction_0(1), A2 => direction_0(0), ZN => lbl2_pxl_n_15);
  lbl2_pxl_g8392 : OR2D1BWP7T port map(A1 => lbl2_h_count(1), A2 => lbl2_h_count(2), Z => lbl2_pxl_n_14);
  lbl2_pxl_g8393 : INVD0BWP7T port map(I => player_state_1(0), ZN => lbl2_pxl_n_13);
  lbl2_pxl_g8394 : INVD1BWP7T port map(I => direction_1(0), ZN => lbl2_pxl_n_12);
  lbl2_pxl_g8395 : INVD1BWP7T port map(I => lbl2_v_count(3), ZN => lbl2_pxl_n_11);
  lbl2_pxl_g8396 : INVD0BWP7T port map(I => lbl2_v_count(2), ZN => lbl2_pxl_n_10);
  lbl2_pxl_g8397 : CKND1BWP7T port map(I => lbl2_walls(5), ZN => lbl2_pxl_n_9);
  lbl2_pxl_g8398 : INVD0BWP7T port map(I => player_state_0(0), ZN => lbl2_pxl_n_8);
  lbl2_pxl_g8399 : INVD1BWP7T port map(I => lbl2_h_count(0), ZN => lbl2_pxl_n_7);
  lbl2_pxl_g8400 : INVD1BWP7T port map(I => direction_0(0), ZN => lbl2_pxl_n_6);
  lbl2_pxl_g8401 : INVD0BWP7T port map(I => lbl2_v_count(0), ZN => lbl2_pxl_n_5);
  lbl2_pxl_g8402 : INVD1BWP7T port map(I => position_1(10), ZN => lbl2_pxl_n_4);
  lbl2_pxl_g8403 : INVD1BWP7T port map(I => lbl2_h_count(3), ZN => lbl2_pxl_n_3);
  lbl2_pxl_g2 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_38, B1 => lbl2_pxl_n_88, ZN => lbl2_pxl_n_2);
  lbl2_pxl_g8404 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_34, B1 => player_state_1(0), ZN => lbl2_pxl_n_1);
  lbl2_pxl_g8405 : IND2D1BWP7T port map(A1 => lbl2_pxl_n_24, B1 => player_state_0(0), ZN => lbl2_pxl_n_0);
  lbl2_sdb_g8050 : OR2D1BWP7T port map(A1 => lbl2_sidebar_color(3), A2 => lbl2_sdb_n_167, Z => lbl2_sidebar_color(2));
  lbl2_sdb_g8051 : OR2D1BWP7T port map(A1 => lbl2_sidebar_color(1), A2 => lbl2_sdb_n_167, Z => lbl2_sidebar_color(0));
  lbl2_sdb_g8052 : AN2D0BWP7T port map(A1 => lbl2_sdb_n_179, A2 => lbl2_h_count(9), Z => lbl2_sidebar_color(3));
  lbl2_sdb_g8053 : INR2D1BWP7T port map(A1 => lbl2_sdb_n_179, B1 => lbl2_h_count(9), ZN => lbl2_sidebar_color(1));
  lbl2_sdb_g8054 : OAI211D1BWP7T port map(A1 => lbl2_v_count(7), A2 => lbl2_sdb_n_178, B => lbl2_sdb_n_176, C => lbl2_sdb_n_160, ZN => lbl2_sdb_n_179);
  lbl2_sdb_g8055 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_177, A2 => lbl2_v_count(5), ZN => lbl2_sdb_n_178);
  lbl2_sdb_g8056 : NR4D0BWP7T port map(A1 => lbl2_sdb_n_175, A2 => game_state(2), A3 => lbl2_v_count(8), A4 => lbl2_v_count(6), ZN => lbl2_sdb_n_177);
  lbl2_sdb_g8057 : NR4D0BWP7T port map(A1 => lbl2_sdb_n_173, A2 => lbl2_sdb_n_169, A3 => lbl2_sdb_n_170, A4 => lbl2_sdb_n_151, ZN => lbl2_sdb_n_176);
  lbl2_sdb_g8058 : AOI31D0BWP7T port map(A1 => lbl2_sdb_n_163, A2 => lbl2_sdb_n_31, A3 => game_state(1), B => lbl2_sdb_n_174, ZN => lbl2_sdb_n_175);
  lbl2_sdb_g8059 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_172, A2 => lbl2_sdb_n_161, B => lbl2_sdb_n_79, ZN => lbl2_sdb_n_174);
  lbl2_sdb_g8060 : OAI32D1BWP7T port map(A1 => lbl2_sdb_n_16, A2 => lbl2_sdb_n_79, A3 => lbl2_sdb_n_171, B1 => lbl2_sdb_n_33, B2 => lbl2_sdb_n_124, ZN => lbl2_sdb_n_173);
  lbl2_sdb_g8061 : IND3D1BWP7T port map(A1 => lbl2_sdb_n_31, B1 => game_state(1), B2 => lbl2_sdb_n_168, ZN => lbl2_sdb_n_172);
  lbl2_sdb_g8062 : OAI211D1BWP7T port map(A1 => lbl2_sdb_n_139, A2 => lbl2_sdb_n_164, B => lbl2_sdb_n_32, C => lbl2_sdb_n_43, ZN => lbl2_sdb_n_171);
  lbl2_sdb_g8063 : NR3D0BWP7T port map(A1 => lbl2_sdb_n_166, A2 => lbl2_sdb_n_63, A3 => lbl2_h_count(9), ZN => lbl2_sdb_n_170);
  lbl2_sdb_g8064 : OAI32D1BWP7T port map(A1 => lbl2_v_count(5), A2 => lbl2_sdb_n_16, A3 => lbl2_sdb_n_122, B1 => lbl2_sdb_n_6, B2 => lbl2_sdb_n_165, ZN => lbl2_sdb_n_169);
  lbl2_sdb_g8065 : OAI221D0BWP7T port map(A1 => lbl2_sdb_n_142, A2 => lbl2_sdb_n_29, B1 => lbl2_sdb_n_36, B2 => lbl2_sdb_n_93, C => lbl2_sdb_n_162, ZN => lbl2_sdb_n_168);
  lbl2_sdb_g8066 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_165, A2 => lbl2_n_150, ZN => lbl2_sdb_n_167);
  lbl2_sdb_g8067 : OA32D1BWP7T port map(A1 => lbl2_sdb_n_29, A2 => lbl2_sdb_n_79, A3 => lbl2_sdb_n_0, B1 => lbl2_sdb_n_79, B2 => lbl2_sdb_n_149, Z => lbl2_sdb_n_166);
  lbl2_sdb_g8068 : AOI221D0BWP7T port map(A1 => lbl2_sdb_n_155, A2 => lbl2_sdb_n_29, B1 => lbl2_sdb_n_130, B2 => lbl2_sdb_n_108, C => lbl2_sdb_n_146, ZN => lbl2_sdb_n_164);
  lbl2_sdb_g8069 : IND4D0BWP7T port map(A1 => lbl2_sdb_n_158, B1 => lbl2_v_count(6), B2 => lbl2_v_count(5), B3 => lbl2_v_count(7), ZN => lbl2_sdb_n_165);
  lbl2_sdb_g8070 : AOI211XD0BWP7T port map(A1 => lbl2_sdb_n_55, A2 => lbl2_n_149, B => lbl2_sdb_n_159, C => lbl2_sdb_n_65, ZN => lbl2_sdb_n_163);
  lbl2_sdb_g8071 : AOI211XD0BWP7T port map(A1 => lbl2_sdb_n_157, A2 => lbl2_sdb_n_29, B => lbl2_sdb_n_152, C => lbl2_sdb_n_140, ZN => lbl2_sdb_n_162);
  lbl2_sdb_g8072 : OAI31D0BWP7T port map(A1 => lbl2_sdb_n_120, A2 => lbl2_sdb_n_143, A3 => lbl2_sdb_n_153, B => lbl2_sdb_n_28, ZN => lbl2_sdb_n_161);
  lbl2_sdb_g8073 : IND3D1BWP7T port map(A1 => lbl2_sdb_n_63, B1 => lbl2_h_count(9), B2 => lbl2_sdb_n_156, ZN => lbl2_sdb_n_160);
  lbl2_sdb_g8075 : AOI211XD0BWP7T port map(A1 => lbl2_sdb_n_148, A2 => lbl2_h_count(2), B => lbl2_sdb_n_141, C => lbl2_sdb_n_138, ZN => lbl2_sdb_n_159);
  lbl2_sdb_g8076 : IND4D0BWP7T port map(A1 => lbl2_v_count(8), B1 => game_state(2), B2 => lbl2_sdb_n_28, B3 => lbl2_sdb_n_131, ZN => lbl2_sdb_n_158);
  lbl2_sdb_g8077 : OAI221D0BWP7T port map(A1 => lbl2_sdb_n_136, A2 => lbl2_sdb_n_81, B1 => lbl2_sdb_n_84, B2 => lbl2_sdb_n_108, C => lbl2_sdb_n_144, ZN => lbl2_sdb_n_157);
  lbl2_sdb_g8078 : OAI221D0BWP7T port map(A1 => lbl2_sdb_n_52, A2 => lbl2_sdb_n_82, B1 => lbl2_sdb_n_77, B2 => lbl2_sdb_n_60, C => lbl2_sdb_n_150, ZN => lbl2_sdb_n_156);
  lbl2_sdb_g8079 : OA211D0BWP7T port map(A1 => lbl2_sdb_n_77, A2 => lbl2_sdb_n_108, B => lbl2_sdb_n_154, C => lbl2_sdb_n_94, Z => lbl2_sdb_n_155);
  lbl2_sdb_g8080 : OA221D0BWP7T port map(A1 => lbl2_sdb_n_109, A2 => lbl2_sdb_n_62, B1 => lbl2_sdb_n_24, B2 => lbl2_sdb_n_93, C => lbl2_sdb_n_145, Z => lbl2_sdb_n_154);
  lbl2_sdb_g8081 : OAI211D1BWP7T port map(A1 => lbl2_sdb_n_94, A2 => lbl2_sdb_n_128, B => lbl2_sdb_n_135, C => lbl2_sdb_n_119, ZN => lbl2_sdb_n_153);
  lbl2_sdb_g8082 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_137, A2 => lbl2_sdb_n_92, B => lbl2_sdb_n_57, ZN => lbl2_sdb_n_152);
  lbl2_sdb_g8083 : OAI33D1BWP7T port map(A1 => lbl2_sdb_n_15, A2 => lbl2_n_149, A3 => lbl2_sdb_n_126, B1 => lbl2_sdb_n_2, B2 => lbl2_sdb_n_17, B3 => lbl2_sdb_n_117, ZN => lbl2_sdb_n_151);
  lbl2_sdb_g8084 : AOI211XD0BWP7T port map(A1 => lbl2_sdb_n_125, A2 => lbl2_sdb_n_29, B => lbl2_sdb_n_98, C => lbl2_sdb_n_96, ZN => lbl2_sdb_n_150);
  lbl2_sdb_g8085 : MAOI22D0BWP7T port map(A1 => lbl2_sdb_n_134, A2 => lbl2_sdb_n_13, B1 => lbl2_sdb_n_127, B2 => lbl2_sdb_n_82, ZN => lbl2_sdb_n_149);
  lbl2_sdb_g8086 : OAI32D1BWP7T port map(A1 => lbl2_v_count(4), A2 => lbl2_sdb_n_30, A3 => lbl2_sdb_n_89, B1 => lbl2_sdb_n_75, B2 => lbl2_sdb_n_133, ZN => lbl2_sdb_n_148);
  lbl2_sdb_g8087 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_121, A2 => lbl2_sdb_n_110, B => lbl2_sdb_n_44, ZN => lbl2_sdb_n_147);
  lbl2_sdb_g8088 : OA211D0BWP7T port map(A1 => lbl2_sdb_n_92, A2 => lbl2_sdb_n_112, B => lbl2_sdb_n_93, C => lbl2_sdb_n_50, Z => lbl2_sdb_n_146);
  lbl2_sdb_g8089 : AOI33D1BWP7T port map(A1 => lbl2_sdb_n_114, A2 => lbl2_sdb_n_90, A3 => lbl2_v_count(2), B1 => lbl2_sdb_n_113, B2 => lbl2_sdb_n_84, B3 => lbl2_sdb_n_13, ZN => lbl2_sdb_n_145);
  lbl2_sdb_g8091 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_127, A2 => lbl2_sdb_n_90, B1 => lbl2_sdb_n_129, B2 => lbl2_sdb_n_29, ZN => lbl2_sdb_n_143);
  lbl2_sdb_g8092 : OA22D0BWP7T port map(A1 => lbl2_sdb_n_127, A2 => lbl2_sdb_n_62, B1 => lbl2_sdb_n_19, B2 => lbl2_sdb_n_92, Z => lbl2_sdb_n_142);
  lbl2_sdb_g8093 : AOI33D1BWP7T port map(A1 => lbl2_sdb_n_113, A2 => lbl2_sdb_n_70, A3 => lbl2_v_count(2), B1 => lbl2_sdb_n_77, B2 => lbl2_sdb_n_13, B3 => lbl2_sdb_n_7, ZN => lbl2_sdb_n_144);
  lbl2_sdb_g8094 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_123, A2 => lbl2_h_count(2), ZN => lbl2_sdb_n_141);
  lbl2_sdb_g8095 : NR2D0BWP7T port map(A1 => lbl2_sdb_n_128, A2 => lbl2_sdb_n_93, ZN => lbl2_sdb_n_140);
  lbl2_sdb_g8096 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_109, A2 => lbl2_sdb_n_111, B => lbl2_sdb_n_92, ZN => lbl2_sdb_n_139);
  lbl2_sdb_g8097 : OA221D0BWP7T port map(A1 => lbl2_sdb_n_105, A2 => lbl2_sdb_n_83, B1 => lbl2_sdb_n_18, B2 => lbl2_sdb_n_30, C => lbl2_sdb_n_118, Z => lbl2_sdb_n_138);
  lbl2_sdb_g8098 : OA31D1BWP7T port map(A1 => lbl2_sdb_n_1, A2 => lbl2_sdb_n_90, A3 => lbl2_sdb_n_103, B => lbl2_sdb_n_110, Z => lbl2_sdb_n_137);
  lbl2_sdb_g8099 : AOI31D0BWP7T port map(A1 => lbl2_sdb_n_103, A2 => lbl2_sdb_n_84, A3 => lbl2_sdb_n_35, B => lbl2_sdb_n_114, ZN => lbl2_sdb_n_136);
  lbl2_sdb_g8100 : AO211D0BWP7T port map(A1 => lbl2_sdb_n_84, A2 => lbl2_sdb_n_29, B => lbl2_sdb_n_109, C => lbl2_sdb_n_77, Z => lbl2_sdb_n_135);
  lbl2_sdb_g8101 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_92, A2 => lbl2_sdb_n_90, B => lbl2_sdb_n_128, ZN => lbl2_sdb_n_134);
  lbl2_sdb_g8102 : AOI222D0BWP7T port map(A1 => lbl2_sdb_n_105, A2 => lbl2_sdb_n_30, B1 => lbl2_sdb_n_100, B2 => lbl2_sdb_n_7, C1 => lbl2_sdb_n_89, C2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_133);
  lbl2_sdb_g8103 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_109, A2 => lbl2_sdb_n_112, B => lbl2_sdb_n_62, ZN => lbl2_sdb_n_132);
  lbl2_sdb_g8104 : OAI221D0BWP7T port map(A1 => lbl2_sdb_n_106, A2 => lbl2_sdb_n_50, B1 => lbl2_sdb_n_77, B2 => lbl2_sdb_n_69, C => lbl2_sdb_n_107, ZN => lbl2_sdb_n_131);
  lbl2_sdb_g8105 : OAI32D1BWP7T port map(A1 => lbl2_sdb_n_1, A2 => lbl2_sdb_n_29, A3 => lbl2_sdb_n_91, B1 => lbl2_sdb_n_29, B2 => lbl2_sdb_n_113, ZN => lbl2_sdb_n_130);
  lbl2_sdb_g8106 : IAO21D0BWP7T port map(A1 => lbl2_sdb_n_71, A2 => lbl2_n_152, B => lbl2_sdb_n_116, ZN => lbl2_sdb_n_126);
  lbl2_sdb_g8107 : OAI211D1BWP7T port map(A1 => lbl2_v_count(3), A2 => lbl2_sdb_n_87, B => lbl2_sdb_n_85, C => lbl2_sdb_n_48, ZN => lbl2_sdb_n_125);
  lbl2_sdb_g8108 : IAO21D0BWP7T port map(A1 => lbl2_sdb_n_74, A2 => lbl2_n_152, B => lbl2_sdb_n_115, ZN => lbl2_sdb_n_124);
  lbl2_sdb_g8109 : INR2D1BWP7T port map(A1 => lbl2_sdb_n_114, B1 => lbl2_sdb_n_90, ZN => lbl2_sdb_n_129);
  lbl2_sdb_g8110 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_113, A2 => lbl2_sdb_n_29, ZN => lbl2_sdb_n_128);
  lbl2_sdb_g8111 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_114, A2 => lbl2_sdb_n_1, ZN => lbl2_sdb_n_127);
  lbl2_sdb_g8112 : AOI22D0BWP7T port map(A1 => lbl2_sdb_n_95, A2 => lbl2_sdb_n_88, B1 => lbl2_sdb_n_97, B2 => lbl2_sdb_n_49, ZN => lbl2_sdb_n_123);
  lbl2_sdb_g8113 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_73, A2 => lbl2_n_152, B => lbl2_sdb_n_115, ZN => lbl2_sdb_n_122);
  lbl2_sdb_g8114 : OAI21D0BWP7T port map(A1 => lbl2_sdb_n_104, A2 => lbl2_sdb_n_37, B => lbl2_sdb_n_84, ZN => lbl2_sdb_n_121);
  lbl2_sdb_g8115 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_90, A2 => lbl2_sdb_n_82, B => lbl2_sdb_n_108, ZN => lbl2_sdb_n_120);
  lbl2_sdb_g8116 : IOA21D1BWP7T port map(A1 => lbl2_sdb_n_80, A2 => lbl2_sdb_n_81, B => lbl2_sdb_n_113, ZN => lbl2_sdb_n_119);
  lbl2_sdb_g8117 : MAOI22D0BWP7T port map(A1 => lbl2_sdb_n_102, A2 => lbl2_sdb_n_83, B1 => lbl2_sdb_n_75, B2 => lbl2_sdb_n_13, ZN => lbl2_sdb_n_118);
  lbl2_sdb_g8118 : AOI31D0BWP7T port map(A1 => lbl2_sdb_n_68, A2 => lbl2_n_152, A3 => lbl2_n_151, B => lbl2_sdb_n_116, ZN => lbl2_sdb_n_117);
  lbl2_sdb_g8119 : INVD0BWP7T port map(I => lbl2_sdb_n_113, ZN => lbl2_sdb_n_112);
  lbl2_sdb_g8120 : CKND2D0BWP7T port map(A1 => lbl2_sdb_n_104, A2 => lbl2_sdb_n_37, ZN => lbl2_sdb_n_111);
  lbl2_sdb_g8121 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_99, A2 => lbl2_sdb_n_56, ZN => lbl2_sdb_n_116);
  lbl2_sdb_g8122 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_54, A2 => lbl2_sdb_n_99, ZN => lbl2_sdb_n_115);
  lbl2_sdb_g8123 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_103, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_114);
  lbl2_sdb_g8124 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_104, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_113);
  lbl2_sdb_g8125 : OA33D0BWP7T port map(A1 => lbl2_sdb_n_44, A2 => lbl2_sdb_n_80, A3 => lbl2_sdb_n_38, B1 => lbl2_sdb_n_29, B2 => lbl2_sdb_n_81, B3 => lbl2_sdb_n_21, Z => lbl2_sdb_n_107);
  lbl2_sdb_g8126 : OA221D0BWP7T port map(A1 => lbl2_sdb_n_64, A2 => lbl2_n_147, B1 => lbl2_sdb_n_24, B2 => lbl2_sdb_n_17, C => lbl2_sdb_n_101, Z => lbl2_sdb_n_106);
  lbl2_sdb_g8127 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_103, A2 => lbl2_sdb_n_70, ZN => lbl2_sdb_n_110);
  lbl2_sdb_g8128 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_103, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_109);
  lbl2_sdb_g8129 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_104, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_108);
  lbl2_sdb_g8130 : INVD1BWP7T port map(I => lbl2_sdb_n_104, ZN => lbl2_sdb_n_103);
  lbl2_sdb_g8131 : ND2D0BWP7T port map(A1 => lbl2_sdb_n_88, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_102);
  lbl2_sdb_g8132 : IAO21D0BWP7T port map(A1 => lbl2_sdb_n_39, A2 => lbl2_sdb_n_15, B => lbl2_sdb_n_86, ZN => lbl2_sdb_n_101);
  lbl2_sdb_g8133 : NR2D0BWP7T port map(A1 => lbl2_sdb_n_89, A2 => lbl2_sdb_n_27, ZN => lbl2_sdb_n_100);
  lbl2_sdb_g8134 : NR2D0BWP7T port map(A1 => lbl2_sdb_n_88, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_105);
  lbl2_sdb_g8135 : IOA21D1BWP7T port map(A1 => lbl2_sdb_n_67, A2 => lbl2_n_148, B => lbl2_sdb_n_66, ZN => lbl2_sdb_n_104);
  lbl2_sdb_g8136 : NR3D0BWP7T port map(A1 => lbl2_sdb_n_21, A2 => lbl2_sdb_n_80, A3 => lbl2_v_count(2), ZN => lbl2_sdb_n_98);
  lbl2_sdb_g8137 : AOI211D1BWP7T port map(A1 => lbl2_sdb_n_19, A2 => lbl2_v_count(4), B => lbl2_sdb_n_88, C => lbl2_sdb_n_76, ZN => lbl2_sdb_n_97);
  lbl2_sdb_g8138 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_81, A2 => lbl2_sdb_n_57, B => lbl2_sdb_n_38, ZN => lbl2_sdb_n_96);
  lbl2_sdb_g8139 : OAI32D1BWP7T port map(A1 => lbl2_sdb_n_3, A2 => lbl2_v_count(4), A3 => lbl2_sdb_n_76, B1 => lbl2_sdb_n_36, B2 => lbl2_sdb_n_75, ZN => lbl2_sdb_n_95);
  lbl2_sdb_g8140 : AOI222D0BWP7T port map(A1 => lbl2_sdb_n_42, A2 => lbl2_sdb_n_61, B1 => lbl2_sdb_n_41, B2 => lbl2_sdb_n_30, C1 => lbl2_sdb_n_78, C2 => lbl2_sdb_n_34, ZN => lbl2_sdb_n_99);
  lbl2_sdb_g8141 : INVD0BWP7T port map(I => lbl2_sdb_n_92, ZN => lbl2_sdb_n_91);
  lbl2_sdb_g8142 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_70, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_94);
  lbl2_sdb_g8143 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_84, A2 => lbl2_sdb_n_77, ZN => lbl2_sdb_n_93);
  lbl2_sdb_g8144 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_70, A2 => lbl2_sdb_n_77, ZN => lbl2_sdb_n_92);
  lbl2_sdb_g8145 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_84, A2 => lbl2_sdb_n_62, ZN => lbl2_sdb_n_90);
  lbl2_sdb_g8146 : INVD1BWP7T port map(I => lbl2_sdb_n_89, ZN => lbl2_sdb_n_88);
  lbl2_sdb_g8147 : AO21D0BWP7T port map(A1 => lbl2_sdb_n_15, A2 => lbl2_sdb_n_77, B => lbl2_sdb_n_40, Z => lbl2_sdb_n_87);
  lbl2_sdb_g8148 : IAO21D0BWP7T port map(A1 => lbl2_sdb_n_15, A2 => lbl2_sdb_n_62, B => lbl2_sdb_n_40, ZN => lbl2_sdb_n_86);
  lbl2_sdb_g8149 : AOI22D0BWP7T port map(A1 => lbl2_sdb_n_51, A2 => lbl2_sdb_n_62, B1 => lbl2_sdb_n_46, B2 => lbl2_v_count(2), ZN => lbl2_sdb_n_85);
  lbl2_sdb_g8150 : OAI21D0BWP7T port map(A1 => lbl2_sdb_n_72, A2 => lbl2_sdb_n_10, B => lbl2_sdb_n_55, ZN => lbl2_sdb_n_89);
  lbl2_sdb_g8151 : INVD1BWP7T port map(I => lbl2_sdb_n_70, ZN => lbl2_sdb_n_84);
  lbl2_sdb_g8152 : NR2XD0BWP7T port map(A1 => lbl2_sdb_n_76, A2 => lbl2_sdb_n_49, ZN => lbl2_sdb_n_83);
  lbl2_sdb_g8153 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_77, A2 => lbl2_sdb_n_29, ZN => lbl2_sdb_n_82);
  lbl2_sdb_g8154 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_62, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_81);
  lbl2_sdb_g8155 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_12, A2 => lbl2_sdb_n_4, B1 => lbl2_sdb_n_14, B2 => lbl2_sdb_n_3, ZN => lbl2_sdb_n_78);
  lbl2_sdb_g8156 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_62, A2 => lbl2_sdb_n_50, ZN => lbl2_sdb_n_80);
  lbl2_sdb_g8157 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_66, A2 => lbl2_n_149, B1 => lbl2_sdb_n_66, B2 => lbl2_n_149, ZN => lbl2_sdb_n_79);
  lbl2_sdb_g8158 : INVD1BWP7T port map(I => lbl2_sdb_n_62, ZN => lbl2_sdb_n_77);
  lbl2_sdb_g8159 : INVD1BWP7T port map(I => lbl2_sdb_n_76, ZN => lbl2_sdb_n_75);
  lbl2_sdb_g8160 : CKND1BWP7T port map(I => lbl2_sdb_n_73, ZN => lbl2_sdb_n_74);
  lbl2_sdb_g8161 : HA1D0BWP7T port map(A => lbl2_sdb_n_12, B => lbl2_sdb_n_2, CO => lbl2_sdb_n_72, S => lbl2_sdb_n_76);
  lbl2_sdb_g8162 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_68, A2 => lbl2_n_151, ZN => lbl2_sdb_n_71);
  lbl2_sdb_g8163 : NR3D0BWP7T port map(A1 => lbl2_sdb_n_54, A2 => lbl2_sdb_n_58, A3 => lbl2_n_151, ZN => lbl2_sdb_n_73);
  lbl2_sdb_g8164 : IAO21D0BWP7T port map(A1 => lbl2_sdb_n_39, A2 => lbl2_sdb_n_2, B => lbl2_sdb_n_59, ZN => lbl2_sdb_n_69);
  lbl2_sdb_g8165 : OAI21D0BWP7T port map(A1 => lbl2_sdb_n_2, A2 => lbl2_sdb_n_53, B => lbl2_sdb_n_67, ZN => lbl2_sdb_n_70);
  lbl2_sdb_g8166 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_58, A2 => lbl2_sdb_n_56, ZN => lbl2_sdb_n_68);
  lbl2_sdb_g8167 : NR2XD0BWP7T port map(A1 => lbl2_sdb_n_55, A2 => lbl2_n_149, ZN => lbl2_sdb_n_65);
  lbl2_sdb_g8168 : OAI21D0BWP7T port map(A1 => lbl2_sdb_n_46, A2 => lbl2_sdb_n_45, B => lbl2_sdb_n_9, ZN => lbl2_sdb_n_64);
  lbl2_sdb_g8169 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_2, A2 => lbl2_sdb_n_53, ZN => lbl2_sdb_n_67);
  lbl2_sdb_g8170 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_26, A2 => lbl2_sdb_n_53, ZN => lbl2_sdb_n_66);
  lbl2_sdb_g8171 : OAI32D1BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(3), A3 => lbl2_sdb_n_4, B1 => lbl2_h_count(1), B2 => lbl2_sdb_n_12, ZN => lbl2_sdb_n_61);
  lbl2_sdb_g8172 : AOI21D0BWP7T port map(A1 => lbl2_sdb_n_45, A2 => lbl2_sdb_n_2, B => lbl2_sdb_n_47, ZN => lbl2_sdb_n_60);
  lbl2_sdb_g8173 : AO33D0BWP7T port map(A1 => lbl2_sdb_n_8, A2 => lbl2_sdb_n_2, A3 => lbl2_sdb_n_37, B1 => lbl2_sdb_n_22, B2 => lbl2_sdb_n_10, B3 => lbl2_sdb_n_1, Z => lbl2_sdb_n_59);
  lbl2_sdb_g8174 : IND3D1BWP7T port map(A1 => lbl2_sdb_n_43, B1 => lbl2_sdb_n_5, B2 => lbl2_sdb_n_32, ZN => lbl2_sdb_n_63);
  lbl2_sdb_g8175 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_14, A2 => lbl2_h_count(3), B1 => lbl2_sdb_n_14, B2 => lbl2_h_count(3), ZN => lbl2_sdb_n_62);
  lbl2_sdb_g8176 : NR2XD0BWP7T port map(A1 => lbl2_sdb_n_34, A2 => lbl2_sdb_n_30, ZN => lbl2_sdb_n_58);
  lbl2_sdb_g8177 : IND2D1BWP7T port map(A1 => lbl2_sdb_n_24, B1 => lbl2_sdb_n_29, ZN => lbl2_sdb_n_57);
  lbl2_sdb_g8178 : IND3D1BWP7T port map(A1 => lbl2_sdb_n_33, B1 => lbl2_v_count(7), B2 => lbl2_v_count(4), ZN => lbl2_sdb_n_56);
  lbl2_sdb_g8179 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_26, A2 => lbl2_sdb_n_12, ZN => lbl2_sdb_n_55);
  lbl2_sdb_g8180 : AOI33D1BWP7T port map(A1 => lbl2_sdb_n_22, A2 => lbl2_sdb_n_2, A3 => lbl2_sdb_n_20, B1 => lbl2_sdb_n_26, B2 => lbl2_sdb_n_23, B3 => lbl2_v_count(2), ZN => lbl2_sdb_n_52);
  lbl2_sdb_g8181 : AO21D0BWP7T port map(A1 => lbl2_sdb_n_22, A2 => lbl2_sdb_n_25, B => lbl2_sdb_n_45, Z => lbl2_sdb_n_51);
  lbl2_sdb_g8182 : IND4D0BWP7T port map(A1 => lbl2_sdb_n_17, B1 => lbl2_v_count(7), B2 => lbl2_sdb_n_7, B3 => lbl2_sdb_n_2, ZN => lbl2_sdb_n_54);
  lbl2_sdb_g8183 : OA21D0BWP7T port map(A1 => lbl2_sdb_n_4, A2 => lbl2_sdb_n_3, B => lbl2_sdb_n_12, Z => lbl2_sdb_n_53);
  lbl2_sdb_g8184 : INVD0BWP7T port map(I => lbl2_sdb_n_29, ZN => lbl2_sdb_n_50);
  lbl2_sdb_g8185 : INVD0BWP7T port map(I => lbl2_sdb_n_30, ZN => lbl2_sdb_n_49);
  lbl2_sdb_g8186 : CKND1BWP7T port map(I => lbl2_sdb_n_47, ZN => lbl2_sdb_n_48);
  lbl2_sdb_g8187 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_39, A2 => lbl2_sdb_n_10, ZN => lbl2_sdb_n_47);
  lbl2_sdb_g8188 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_38, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_46);
  lbl2_sdb_g8189 : NR2XD0BWP7T port map(A1 => lbl2_n_149, A2 => lbl2_sdb_n_36, ZN => lbl2_sdb_n_45);
  lbl2_sdb_g8190 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_27, A2 => lbl2_v_count(1), B1 => lbl2_sdb_n_20, B2 => lbl2_v_count(1), ZN => lbl2_sdb_n_42);
  lbl2_sdb_g8191 : MUX2ND0BWP7T port map(I0 => lbl2_sdb_n_19, I1 => lbl2_sdb_n_27, S => lbl2_v_count(1), ZN => lbl2_sdb_n_41);
  lbl2_sdb_g8192 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_35, A2 => lbl2_sdb_n_23, ZN => lbl2_sdb_n_44);
  lbl2_sdb_g8193 : OA21D0BWP7T port map(A1 => lbl2_sdb_n_16, A2 => lbl2_sdb_n_11, B => lbl2_sdb_n_5, Z => lbl2_sdb_n_43);
  lbl2_sdb_g8194 : CKND1BWP7T port map(I => lbl2_sdb_n_36, ZN => lbl2_sdb_n_35);
  lbl2_sdb_g8195 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_22, A2 => lbl2_v_count(2), ZN => lbl2_sdb_n_40);
  lbl2_sdb_g8196 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_8, A2 => lbl2_sdb_n_20, ZN => lbl2_sdb_n_39);
  lbl2_sdb_g8197 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_26, A2 => lbl2_n_149, ZN => lbl2_sdb_n_38);
  lbl2_sdb_g8198 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_24, A2 => lbl2_v_count(2), ZN => lbl2_sdb_n_37);
  lbl2_sdb_g8199 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_20, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_36);
  lbl2_sdb_g8200 : OR2D1BWP7T port map(A1 => lbl2_sdb_n_18, A2 => lbl2_sdb_n_13, Z => lbl2_sdb_n_34);
  lbl2_sdb_g8201 : IND3D0BWP7T port map(A1 => lbl2_v_count(6), B1 => lbl2_v_count(8), B2 => lbl2_v_count(5), ZN => lbl2_sdb_n_33);
  lbl2_sdb_g8202 : NR3D0BWP7T port map(A1 => game_state(0), A2 => game_state(2), A3 => game_state(1), ZN => lbl2_sdb_n_32);
  lbl2_sdb_g8203 : MOAI22D0BWP7T port map(A1 => game_state(0), A2 => lbl2_h_count(9), B1 => game_state(0), B2 => lbl2_h_count(9), ZN => lbl2_sdb_n_31);
  lbl2_sdb_g8204 : MOAI22D0BWP7T port map(A1 => lbl2_sdb_n_3, A2 => lbl2_h_count(2), B1 => lbl2_sdb_n_3, B2 => lbl2_h_count(2), ZN => lbl2_sdb_n_30);
  lbl2_sdb_g8205 : AOI21D0BWP7T port map(A1 => lbl2_h_count(1), A2 => lbl2_h_count(2), B => lbl2_sdb_n_14, ZN => lbl2_sdb_n_29);
  lbl2_sdb_g8206 : INVD0BWP7T port map(I => lbl2_sdb_n_26, ZN => lbl2_sdb_n_25);
  lbl2_sdb_g8207 : INVD0BWP7T port map(I => lbl2_sdb_n_24, ZN => lbl2_sdb_n_23);
  lbl2_sdb_g8208 : INVD0BWP7T port map(I => lbl2_sdb_n_22, ZN => lbl2_sdb_n_21);
  lbl2_sdb_g8209 : INVD1BWP7T port map(I => lbl2_sdb_n_20, ZN => lbl2_sdb_n_19);
  lbl2_sdb_g8210 : INR2D1BWP7T port map(A1 => game_state(0), B1 => game_state(1), ZN => lbl2_sdb_n_28);
  lbl2_sdb_g8211 : ND2D1BWP7T port map(A1 => lbl2_v_count(2), A2 => lbl2_v_count(3), ZN => lbl2_sdb_n_27);
  lbl2_sdb_g8212 : NR2D1BWP7T port map(A1 => lbl2_n_148, A2 => lbl2_n_147, ZN => lbl2_sdb_n_26);
  lbl2_sdb_g8213 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_7, A2 => lbl2_v_count(3), ZN => lbl2_sdb_n_24);
  lbl2_sdb_g8214 : NR2XD0BWP7T port map(A1 => lbl2_n_149, A2 => lbl2_v_count(4), ZN => lbl2_sdb_n_22);
  lbl2_sdb_g8215 : NR2XD0BWP7T port map(A1 => lbl2_v_count(3), A2 => lbl2_v_count(2), ZN => lbl2_sdb_n_20);
  lbl2_sdb_g8216 : NR2D0BWP7T port map(A1 => lbl2_sdb_n_9, A2 => lbl2_v_count(2), ZN => lbl2_sdb_n_18);
  lbl2_sdb_g8217 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_8, A2 => lbl2_n_148, ZN => lbl2_sdb_n_17);
  lbl2_sdb_g8218 : CKND2D1BWP7T port map(A1 => lbl2_v_count(8), A2 => lbl2_v_count(6), ZN => lbl2_sdb_n_16);
  lbl2_sdb_g8219 : ND2D1BWP7T port map(A1 => lbl2_sdb_n_10, A2 => lbl2_n_147, ZN => lbl2_sdb_n_15);
  lbl2_sdb_g8220 : NR2D1BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(1), ZN => lbl2_sdb_n_14);
  lbl2_sdb_g8221 : NR2D1BWP7T port map(A1 => lbl2_sdb_n_1, A2 => lbl2_v_count(3), ZN => lbl2_sdb_n_13);
  lbl2_sdb_g8222 : ND2D1BWP7T port map(A1 => lbl2_h_count(2), A2 => lbl2_h_count(3), ZN => lbl2_sdb_n_12);
  lbl2_sdb_g8223 : INVD0BWP7T port map(I => lbl2_v_count(5), ZN => lbl2_sdb_n_11);
  lbl2_sdb_g8224 : INVD1BWP7T port map(I => lbl2_n_148, ZN => lbl2_sdb_n_10);
  lbl2_sdb_g8225 : INVD0BWP7T port map(I => lbl2_v_count(3), ZN => lbl2_sdb_n_9);
  lbl2_sdb_g8226 : INVD1BWP7T port map(I => lbl2_n_149, ZN => lbl2_sdb_n_8);
  lbl2_sdb_g8227 : INVD1BWP7T port map(I => lbl2_v_count(4), ZN => lbl2_sdb_n_7);
  lbl2_sdb_g8228 : CKND1BWP7T port map(I => lbl2_n_150, ZN => lbl2_sdb_n_6);
  lbl2_sdb_g8229 : INVD0BWP7T port map(I => lbl2_v_count(7), ZN => lbl2_sdb_n_5);
  lbl2_sdb_g8230 : INVD0BWP7T port map(I => lbl2_h_count(1), ZN => lbl2_sdb_n_4);
  lbl2_sdb_g8231 : INVD1BWP7T port map(I => lbl2_h_count(3), ZN => lbl2_sdb_n_3);
  lbl2_sdb_g8232 : INVD1BWP7T port map(I => lbl2_n_147, ZN => lbl2_sdb_n_2);
  lbl2_sdb_g8233 : INVD1BWP7T port map(I => lbl2_v_count(2), ZN => lbl2_sdb_n_1);
  lbl2_sdb_g2 : INR4D0BWP7T port map(A1 => lbl2_sdb_n_144, B1 => lbl2_sdb_n_147, B2 => lbl2_sdb_n_132, B3 => lbl2_sdb_n_129, ZN => lbl2_sdb_n_0);
  lbl0_busy_counter_reset_reg : LNQD1BWP7T port map(EN => lbl0_n_328, D => lbl0_n_388, Q => lbl0_busy_counter_reset);
  lbl0_g12040 : IND4D0BWP7T port map(A1 => lbl0_n_309, B1 => lbl0_n_212, B2 => lbl0_n_311, B3 => lbl0_n_319, ZN => lbl0_n_361);
  lbl0_g12041 : ND3D0BWP7T port map(A1 => lbl0_n_319, A2 => lbl0_n_314, A3 => lbl0_n_212, ZN => lbl0_n_322);
  lbl0_g12042 : IND4D0BWP7T port map(A1 => lbl0_n_323, B1 => lbl0_n_311, B2 => lbl0_n_315, B3 => lbl0_n_308, ZN => lbl0_n_360);
  lbl0_g12043 : OAI21D0BWP7T port map(A1 => lbl0_n_312, A2 => lbl0_n_249, B => lbl0_n_317, ZN => lbl0_d_next_position_1(9));
  lbl0_g12044 : OAI21D0BWP7T port map(A1 => lbl0_n_313, A2 => lbl0_n_251, B => lbl0_n_318, ZN => lbl0_d_next_position_0(9));
  lbl0_g12045 : IND3D1BWP7T port map(A1 => lbl0_n_323, B1 => lbl0_n_315, B2 => lbl0_n_314, ZN => lbl0_n_321);
  lbl0_g12046 : ND2D1BWP7T port map(A1 => lbl0_n_316, A2 => lbl0_n_385, ZN => lbl0_n_319);
  lbl0_g12047 : AOI22D0BWP7T port map(A1 => lbl0_n_313, A2 => lbl0_n_253, B1 => lbl0_n_226, B2 => position_0(9), ZN => lbl0_n_318);
  lbl0_g12048 : AOI22D0BWP7T port map(A1 => lbl0_n_312, A2 => lbl0_n_254, B1 => lbl0_n_225, B2 => position_1(9), ZN => lbl0_n_317);
  lbl0_g12049 : OAI221D0BWP7T port map(A1 => lbl0_n_305, A2 => lbl0_n_112, B1 => position_1(3), B2 => lbl0_n_267, C => lbl0_n_268, ZN => lbl0_d_next_position_1(3));
  lbl0_g12050 : OAI222D0BWP7T port map(A1 => lbl0_n_300, A2 => lbl0_n_396, B1 => lbl0_next_position_0(0), B2 => lbl0_n_185, C1 => lbl0_next_position_0(5), C2 => lbl0_n_192, ZN => lbl0_n_316);
  lbl0_g12051 : MOAI22D0BWP7T port map(A1 => lbl0_n_298, A2 => position_1(4), B1 => lbl0_n_310, B2 => position_1(4), ZN => lbl0_d_next_position_1(4));
  lbl0_g12052 : AO221D0BWP7T port map(A1 => lbl0_n_299, A2 => position_0(2), B1 => lbl0_n_243, B2 => lbl0_n_173, C => lbl0_n_262, Z => lbl0_d_next_position_0(2));
  lbl0_g12053 : AO221D0BWP7T port map(A1 => lbl0_n_304, A2 => position_0(8), B1 => lbl0_n_252, B2 => lbl0_n_265, C => lbl0_n_87, Z => lbl0_d_next_position_0(8));
  lbl0_g12054 : ND2D1BWP7T port map(A1 => lbl0_n_307, A2 => lbl0_n_385, ZN => lbl0_n_315);
  lbl0_g12055 : ND3D0BWP7T port map(A1 => lbl0_n_306, A2 => lbl0_n_284, A3 => lbl0_n_293, ZN => lbl0_n_314);
  lbl0_g12056 : MOAI22D0BWP7T port map(A1 => lbl0_n_296, A2 => position_0(4), B1 => lbl0_n_303, B2 => position_0(4), ZN => lbl0_d_next_position_0(4));
  lbl0_g12057 : AO221D0BWP7T port map(A1 => lbl0_n_297, A2 => position_1(8), B1 => lbl0_n_250, B2 => lbl0_n_264, C => lbl0_n_88, Z => lbl0_d_next_position_1(8));
  lbl0_g12058 : MAOI22D0BWP7T port map(A1 => lbl0_n_301, A2 => position_0(9), B1 => lbl0_n_301, B2 => position_0(9), ZN => lbl0_n_313);
  lbl0_g12059 : MAOI22D0BWP7T port map(A1 => lbl0_n_302, A2 => position_1(9), B1 => lbl0_n_302, B2 => position_1(9), ZN => lbl0_n_312);
  lbl0_g12060 : OAI221D0BWP7T port map(A1 => lbl0_n_248, A2 => lbl0_n_112, B1 => position_1(3), B2 => lbl0_n_256, C => lbl0_n_305, ZN => lbl0_n_310);
  lbl0_g12061 : AO221D0BWP7T port map(A1 => lbl0_n_222, A2 => lbl0_n_383, B1 => lbl0_n_386, B2 => lbl0_n_213, C => lbl0_n_306, Z => lbl0_n_309);
  lbl0_g12062 : AOI31D0BWP7T port map(A1 => lbl0_n_269, A2 => lbl0_n_201, A3 => lbl0_n_380, B => lbl0_n_204, ZN => lbl0_n_311);
  lbl0_g12063 : AOI222D0BWP7T port map(A1 => lbl0_n_222, A2 => lbl0_n_381, B1 => lbl0_n_386, B2 => lbl0_n_214, C1 => lbl0_n_293, C2 => lbl0_n_380, ZN => lbl0_n_308);
  lbl0_g12064 : OAI222D0BWP7T port map(A1 => lbl0_n_259, A2 => lbl0_n_392, B1 => lbl0_next_position_1(0), B2 => lbl0_n_190, C1 => lbl0_next_position_1(5), C2 => lbl0_n_187, ZN => lbl0_n_307);
  lbl0_g12065 : OAI222D0BWP7T port map(A1 => lbl0_n_295, A2 => lbl0_n_90, B1 => lbl0_n_194, B2 => lbl0_n_256, C1 => position_1(2), C2 => lbl0_n_263, ZN => lbl0_d_next_position_1(2));
  lbl0_g12066 : OAI222D0BWP7T port map(A1 => lbl0_n_244, A2 => lbl0_n_215, B1 => lbl0_n_91, B2 => lbl0_n_294, C1 => position_0(3), C2 => lbl0_n_266, ZN => lbl0_d_next_position_0(3));
  lbl0_g12067 : AO221D0BWP7T port map(A1 => lbl0_n_252, A2 => lbl0_n_258, B1 => lbl0_n_253, B2 => lbl0_n_220, C => lbl0_n_226, Z => lbl0_n_304);
  lbl0_g12068 : CKND2D1BWP7T port map(A1 => lbl0_n_285, A2 => lbl0_n_286, ZN => address(1));
  lbl0_g12069 : CKND2D1BWP7T port map(A1 => lbl0_n_290, A2 => lbl0_n_278, ZN => address(0));
  lbl0_g12070 : CKND2D1BWP7T port map(A1 => lbl0_n_270, A2 => lbl0_n_292, ZN => address(6));
  lbl0_g12071 : CKND2D1BWP7T port map(A1 => lbl0_n_281, A2 => lbl0_n_277, ZN => address(5));
  lbl0_g12072 : CKND2D1BWP7T port map(A1 => lbl0_n_279, A2 => lbl0_n_280, ZN => address(4));
  lbl0_g12073 : OAI221D0BWP7T port map(A1 => lbl0_n_241, A2 => lbl0_n_113, B1 => lbl0_n_94, B2 => lbl0_n_224, C => lbl0_n_289, ZN => address(8));
  lbl0_g12074 : OAI221D0BWP7T port map(A1 => lbl0_n_241, A2 => lbl0_n_90, B1 => lbl0_n_117, B2 => lbl0_n_224, C => lbl0_n_287, ZN => address(2));
  lbl0_g12075 : OAI221D0BWP7T port map(A1 => lbl0_n_241, A2 => lbl0_n_112, B1 => lbl0_n_91, B2 => lbl0_n_224, C => lbl0_n_288, ZN => address(3));
  lbl0_g12076 : OAI221D0BWP7T port map(A1 => lbl0_n_241, A2 => lbl0_n_92, B1 => lbl0_n_93, B2 => lbl0_n_224, C => lbl0_n_291, ZN => address(7));
  lbl0_g12077 : OAI221D0BWP7T port map(A1 => lbl0_n_244, A2 => lbl0_n_211, B1 => position_0(3), B2 => lbl0_n_245, C => lbl0_n_294, ZN => lbl0_n_303);
  lbl0_g12078 : CKND2D1BWP7T port map(A1 => lbl0_n_282, A2 => lbl0_n_276, ZN => address(9));
  lbl0_g12079 : AN4D0BWP7T port map(A1 => lbl0_n_236, A2 => lbl0_n_216, A3 => lbl0_n_189, A4 => lbl0_n_380, Z => lbl0_n_306);
  lbl0_g12080 : OA221D0BWP7T port map(A1 => lbl0_n_256, A2 => lbl0_n_179, B1 => lbl0_n_90, B2 => lbl0_n_248, C => lbl0_n_295, Z => lbl0_n_305);
  lbl0_g12081 : AOI33D1BWP7T port map(A1 => lbl0_n_203, A2 => lbl0_n_94, A3 => lbl0_n_93, B1 => lbl0_n_211, B2 => lbl0_n_104, B3 => lbl0_n_397, ZN => lbl0_n_300);
  lbl0_g12082 : OAI221D0BWP7T port map(A1 => lbl0_n_244, A2 => lbl0_n_138, B1 => lbl0_n_128, B2 => lbl0_n_245, C => lbl0_n_228, ZN => lbl0_n_299);
  lbl0_g12083 : OA21D0BWP7T port map(A1 => lbl0_n_267, A2 => lbl0_n_112, B => lbl0_n_268, Z => lbl0_n_298);
  lbl0_g12084 : OAI21D0BWP7T port map(A1 => lbl0_n_244, A2 => lbl0_n_181, B => lbl0_n_274, ZN => lbl0_d_next_position_0(1));
  lbl0_g12085 : OAI21D0BWP7T port map(A1 => lbl0_n_248, A2 => lbl0_n_177, B => lbl0_n_272, ZN => lbl0_d_next_position_1(1));
  lbl0_g12086 : OAI21D0BWP7T port map(A1 => lbl0_n_251, A2 => lbl0_n_174, B => lbl0_n_275, ZN => lbl0_d_next_position_0(6));
  lbl0_g12087 : OAI21D0BWP7T port map(A1 => lbl0_n_249, A2 => lbl0_n_180, B => lbl0_n_273, ZN => lbl0_d_next_position_1(6));
  lbl0_g12088 : AO221D0BWP7T port map(A1 => lbl0_n_250, A2 => lbl0_n_257, B1 => lbl0_n_254, B2 => lbl0_n_221, C => lbl0_n_225, Z => lbl0_n_297);
  lbl0_g12089 : OAI21D0BWP7T port map(A1 => lbl0_n_251, A2 => lbl0_n_237, B => lbl0_n_271, ZN => lbl0_d_next_position_0(7));
  lbl0_g12090 : OAI21D0BWP7T port map(A1 => lbl0_n_249, A2 => lbl0_n_238, B => lbl0_n_283, ZN => lbl0_d_next_position_1(7));
  lbl0_g12091 : OAI32D1BWP7T port map(A1 => direction_0(0), A2 => lbl0_n_111, A3 => lbl0_n_235, B1 => direction_0(1), B2 => lbl0_n_261, ZN => lbl0_d_wallshape_0_1_4142);
  lbl0_g12092 : OAI32D1BWP7T port map(A1 => direction_1(0), A2 => lbl0_n_110, A3 => lbl0_n_233, B1 => direction_1(1), B2 => lbl0_n_260, ZN => lbl0_d_wallshape_1_1_4145);
  lbl0_g12093 : MAOI22D0BWP7T port map(A1 => lbl0_n_243, A2 => lbl0_n_211, B1 => lbl0_n_266, B2 => lbl0_n_91, ZN => lbl0_n_296);
  lbl0_g12094 : OAI22D0BWP7T port map(A1 => lbl0_n_264, A2 => lbl0_n_392, B1 => lbl0_n_221, B2 => lbl0_n_113, ZN => lbl0_n_302);
  lbl0_g12095 : OAI22D0BWP7T port map(A1 => lbl0_n_265, A2 => lbl0_n_396, B1 => lbl0_n_220, B2 => lbl0_n_94, ZN => lbl0_n_301);
  lbl0_g12096 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(6), B1 => lbl0_n_223, B2 => position_0(6), ZN => lbl0_n_292);
  lbl0_g12099 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(7), B1 => lbl0_n_219, B2 => lbl0_next_position_1(7), ZN => lbl0_n_291);
  lbl0_g12100 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(0), B1 => lbl0_n_219, B2 => lbl0_next_position_1(0), ZN => lbl0_n_290);
  lbl0_g12101 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(8), B1 => lbl0_n_219, B2 => lbl0_next_position_1(8), ZN => lbl0_n_289);
  lbl0_g12102 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(3), B1 => lbl0_n_219, B2 => lbl0_next_position_1(3), ZN => lbl0_n_288);
  lbl0_g12103 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(2), B1 => lbl0_n_219, B2 => lbl0_next_position_1(2), ZN => lbl0_n_287);
  lbl0_g12104 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(1), B1 => lbl0_n_223, B2 => position_0(1), ZN => lbl0_n_286);
  lbl0_g12105 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(1), B1 => lbl0_n_219, B2 => lbl0_next_position_1(1), ZN => lbl0_n_285);
  lbl0_g12106 : ND2D1BWP7T port map(A1 => lbl0_n_269, A2 => lbl0_n_201, ZN => lbl0_n_284);
  lbl0_g12107 : IAO21D0BWP7T port map(A1 => lbl0_n_248, A2 => lbl0_n_132, B => lbl0_n_231, ZN => lbl0_n_295);
  lbl0_g12108 : OA21D0BWP7T port map(A1 => lbl0_n_245, A2 => lbl0_n_178, B => lbl0_n_228, Z => lbl0_n_294);
  lbl0_g12109 : NR4D0BWP7T port map(A1 => lbl0_n_239, A2 => lbl0_n_196, A3 => lbl0_n_195, A4 => lbl0_n_193, ZN => lbl0_n_293);
  lbl0_g12110 : AOI22D0BWP7T port map(A1 => lbl0_n_254, A2 => lbl0_n_238, B1 => lbl0_n_225, B2 => position_1(7), ZN => lbl0_n_283);
  lbl0_g12111 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(9), B1 => lbl0_n_219, B2 => lbl0_next_position_1(9), ZN => lbl0_n_282);
  lbl0_g12112 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(5), B1 => lbl0_n_219, B2 => lbl0_next_position_1(5), ZN => lbl0_n_281);
  lbl0_g12113 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(4), B1 => lbl0_n_223, B2 => position_0(4), ZN => lbl0_n_280);
  lbl0_g12114 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(4), B1 => lbl0_n_219, B2 => lbl0_next_position_1(4), ZN => lbl0_n_279);
  lbl0_g12115 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(0), B1 => lbl0_n_223, B2 => position_0(0), ZN => lbl0_n_278);
  lbl0_g12116 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(5), B1 => lbl0_n_223, B2 => position_0(5), ZN => lbl0_n_277);
  lbl0_g12117 : AOI22D0BWP7T port map(A1 => lbl0_n_240, A2 => position_1(9), B1 => lbl0_n_223, B2 => position_0(9), ZN => lbl0_n_276);
  lbl0_g12118 : AOI22D0BWP7T port map(A1 => lbl0_n_253, A2 => lbl0_n_174, B1 => lbl0_n_226, B2 => position_0(6), ZN => lbl0_n_275);
  lbl0_g12119 : AOI22D0BWP7T port map(A1 => lbl0_n_246, A2 => lbl0_n_181, B1 => lbl0_n_229, B2 => position_0(1), ZN => lbl0_n_274);
  lbl0_g12120 : AOI22D0BWP7T port map(A1 => lbl0_n_254, A2 => lbl0_n_180, B1 => lbl0_n_225, B2 => position_1(6), ZN => lbl0_n_273);
  lbl0_g12121 : AOI22D0BWP7T port map(A1 => lbl0_n_255, A2 => lbl0_n_177, B1 => lbl0_n_231, B2 => position_1(1), ZN => lbl0_n_272);
  lbl0_g12122 : AOI22D0BWP7T port map(A1 => lbl0_n_253, A2 => lbl0_n_237, B1 => lbl0_n_226, B2 => position_0(7), ZN => lbl0_n_271);
  lbl0_g12123 : AOI22D0BWP7T port map(A1 => lbl0_n_242, A2 => lbl0_next_position_0(6), B1 => lbl0_n_219, B2 => lbl0_next_position_1(6), ZN => lbl0_n_270);
  lbl0_g12124 : NR2D1BWP7T port map(A1 => lbl0_n_232, A2 => lbl0_n_169, ZN => lbl0_d_wallshape_1_0_4144);
  lbl0_g12125 : NR2D1BWP7T port map(A1 => lbl0_n_234, A2 => lbl0_n_166, ZN => lbl0_d_wallshape_0_0_4141);
  lbl0_g12126 : ND2D0BWP7T port map(A1 => lbl0_n_247, A2 => lbl0_n_132, ZN => lbl0_n_263);
  lbl0_g12127 : AN3D0BWP7T port map(A1 => lbl0_n_246, A2 => lbl0_n_128, A3 => lbl0_n_117, Z => lbl0_n_262);
  lbl0_g12128 : NR4D0BWP7T port map(A1 => lbl0_n_217, A2 => lbl0_n_188, A3 => lbl0_n_191, A4 => lbl0_n_149, ZN => lbl0_n_269);
  lbl0_g12129 : ND2D0BWP7T port map(A1 => lbl0_n_247, A2 => lbl0_n_199, ZN => lbl0_n_268);
  lbl0_g12130 : ND2D1BWP7T port map(A1 => lbl0_n_255, A2 => lbl0_n_179, ZN => lbl0_n_267);
  lbl0_g12131 : ND2D1BWP7T port map(A1 => lbl0_n_246, A2 => lbl0_n_178, ZN => lbl0_n_266);
  lbl0_g12132 : NR2XD0BWP7T port map(A1 => lbl0_n_258, A2 => position_0(8), ZN => lbl0_n_265);
  lbl0_g12133 : NR2XD0BWP7T port map(A1 => lbl0_n_257, A2 => position_1(8), ZN => lbl0_n_264);
  lbl0_g12134 : AOI21D0BWP7T port map(A1 => lbl0_n_229, A2 => direction_0(0), B => lbl0_n_252, ZN => lbl0_n_261);
  lbl0_g12135 : AOI21D0BWP7T port map(A1 => lbl0_n_231, A2 => direction_1(0), B => lbl0_n_250, ZN => lbl0_n_260);
  lbl0_g12136 : AOI33D1BWP7T port map(A1 => lbl0_n_202, A2 => lbl0_n_113, A3 => lbl0_n_92, B1 => lbl0_n_199, B2 => lbl0_n_106, B3 => lbl0_n_393, ZN => lbl0_n_259);
  lbl0_g12137 : AO22D0BWP7T port map(A1 => lbl0_n_223, A2 => lbl0_wallshape_0(1), B1 => lbl0_wallshape_1(1), B2 => write_memory(3), Z => write_memory(1));
  lbl0_g12138 : AO22D0BWP7T port map(A1 => lbl0_n_223, A2 => lbl0_wallshape_0(0), B1 => lbl0_wallshape_1(0), B2 => write_memory(3), Z => write_memory(0));
  lbl0_g12139 : AO22D0BWP7T port map(A1 => lbl0_n_223, A2 => lbl0_wallshape_0(2), B1 => lbl0_wallshape_1(2), B2 => write_memory(3), Z => write_memory(2));
  lbl0_g12140 : MOAI22D0BWP7T port map(A1 => lbl0_n_228, A2 => position_0(5), B1 => lbl0_n_226, B2 => position_0(5), ZN => lbl0_d_next_position_0(5));
  lbl0_g12141 : MOAI22D0BWP7T port map(A1 => lbl0_n_227, A2 => position_0(0), B1 => lbl0_n_229, B2 => position_0(0), ZN => lbl0_d_next_position_0(0));
  lbl0_g12142 : MOAI22D0BWP7T port map(A1 => lbl0_n_230, A2 => position_1(5), B1 => lbl0_n_225, B2 => position_1(5), ZN => lbl0_d_next_position_1(5));
  lbl0_g12144 : INVD0BWP7T port map(I => lbl0_n_256, ZN => lbl0_n_255);
  lbl0_g12147 : INVD0BWP7T port map(I => lbl0_n_252, ZN => lbl0_n_251);
  lbl0_g12148 : INVD0BWP7T port map(I => lbl0_n_250, ZN => lbl0_n_249);
  lbl0_g12149 : INVD0BWP7T port map(I => lbl0_n_248, ZN => lbl0_n_247);
  lbl0_g12150 : INVD1BWP7T port map(I => lbl0_n_246, ZN => lbl0_n_245);
  lbl0_g12151 : INVD0BWP7T port map(I => lbl0_n_244, ZN => lbl0_n_243);
  lbl0_g12152 : INVD1BWP7T port map(I => lbl0_n_241, ZN => lbl0_n_240);
  lbl0_g12153 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(5), B => lbl0_n_204, Z => lbl0_d_position_1(5));
  lbl0_g12154 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(7), B => lbl0_n_204, Z => lbl0_d_position_1(7));
  lbl0_g12155 : OR2D1BWP7T port map(A1 => lbl0_n_218, A2 => lbl0_state(3), Z => game_state(1));
  lbl0_g12156 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(8), B => lbl0_n_204, Z => lbl0_d_position_1(8));
  lbl0_g12157 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(9), B => lbl0_n_204, Z => lbl0_d_position_1(9));
  lbl0_g12158 : ND4D0BWP7T port map(A1 => lbl0_n_186, A2 => lbl0_n_162, A3 => lbl0_n_165, A4 => lbl0_n_154, ZN => lbl0_n_239);
  lbl0_g12159 : ND2D1BWP7T port map(A1 => lbl0_n_220, A2 => lbl0_n_93, ZN => lbl0_n_258);
  lbl0_g12160 : ND2D1BWP7T port map(A1 => lbl0_n_221, A2 => lbl0_n_92, ZN => lbl0_n_257);
  lbl0_g12161 : ND2D1BWP7T port map(A1 => lbl0_n_225, A2 => lbl0_n_392, ZN => lbl0_n_256);
  lbl0_g12162 : NR2D1BWP7T port map(A1 => lbl0_n_230, A2 => lbl0_n_110, ZN => lbl0_n_254);
  lbl0_g12163 : NR2D1BWP7T port map(A1 => lbl0_n_228, A2 => lbl0_n_111, ZN => lbl0_n_253);
  lbl0_g12164 : NR2D0BWP7T port map(A1 => lbl0_n_228, A2 => lbl0_n_396, ZN => lbl0_n_252);
  lbl0_g12165 : NR2D0BWP7T port map(A1 => lbl0_n_230, A2 => lbl0_n_392, ZN => lbl0_n_250);
  lbl0_g12166 : ND2D1BWP7T port map(A1 => lbl0_n_225, A2 => lbl0_n_110, ZN => lbl0_n_248);
  lbl0_g12167 : NR2XD0BWP7T port map(A1 => lbl0_n_227, A2 => lbl0_n_111, ZN => lbl0_n_246);
  lbl0_g12168 : ND2D1BWP7T port map(A1 => lbl0_n_226, A2 => lbl0_n_111, ZN => lbl0_n_244);
  lbl0_g12169 : OR2D1BWP7T port map(A1 => lbl0_n_327, A2 => lbl0_n_384, Z => lbl0_n_242);
  lbl0_g12170 : NR2XD0BWP7T port map(A1 => lbl0_n_326, A2 => lbl0_n_377, ZN => lbl0_n_241);
  lbl0_g12171 : AO21D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(9), B => lbl0_n_204, Z => lbl0_d_position_0(9));
  lbl0_g12172 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(3), B => lbl0_n_204, Z => lbl0_d_position_1(3));
  lbl0_g12173 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(0), B => lbl0_n_204, Z => lbl0_d_position_1(0));
  lbl0_g12174 : NR4D0BWP7T port map(A1 => lbl0_n_184, A2 => lbl0_n_161, A3 => lbl0_n_153, A4 => lbl0_n_163, ZN => lbl0_n_236);
  lbl0_g12175 : OR3XD1BWP7T port map(A1 => lbl0_n_182, A2 => lbl0_n_382, A3 => lbl0_n_384, Z => go_to);
  lbl0_g12176 : AOI21D0BWP7T port map(A1 => lbl0_n_386, A2 => direction_0(1), B => lbl0_n_226, ZN => lbl0_n_235);
  lbl0_g12177 : AOI21D0BWP7T port map(A1 => lbl0_n_386, A2 => direction_0(0), B => lbl0_n_226, ZN => lbl0_n_234);
  lbl0_g12178 : AOI21D0BWP7T port map(A1 => lbl0_n_386, A2 => direction_1(1), B => lbl0_n_225, ZN => lbl0_n_233);
  lbl0_g12179 : AOI21D0BWP7T port map(A1 => lbl0_n_386, A2 => direction_1(0), B => lbl0_n_225, ZN => lbl0_n_232);
  lbl0_g12180 : AO21D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(4), B => lbl0_n_204, Z => lbl0_d_position_1(4));
  lbl0_g12181 : AO21D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(8), B => lbl0_n_204, Z => lbl0_d_position_0(8));
  lbl0_g12182 : AO21D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(7), B => lbl0_n_204, Z => lbl0_d_position_0(7));
  lbl0_g12183 : AO21D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(5), B => lbl0_n_204, Z => lbl0_d_position_0(5));
  lbl0_g12184 : AO21D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(2), B => lbl0_n_204, Z => lbl0_d_position_0(2));
  lbl0_g12185 : ND3D0BWP7T port map(A1 => lbl0_n_200, A2 => lbl0_n_172, A3 => lbl0_n_126, ZN => game_state(2));
  lbl0_g12186 : OAI211D1BWP7T port map(A1 => lbl0_state(1), A2 => lbl0_n_89, B => lbl0_n_200, C => lbl0_n_126, ZN => game_state(0));
  lbl0_g12187 : MAOI22D0BWP7T port map(A1 => lbl0_n_198, A2 => position_1(7), B1 => lbl0_n_198, B2 => position_1(7), ZN => lbl0_n_238);
  lbl0_g12188 : MAOI22D0BWP7T port map(A1 => lbl0_n_197, A2 => position_0(7), B1 => lbl0_n_197, B2 => position_0(7), ZN => lbl0_n_237);
  lbl0_g12189 : INVD0BWP7T port map(I => lbl0_n_231, ZN => lbl0_n_230);
  lbl0_g12190 : INVD1BWP7T port map(I => lbl0_n_229, ZN => lbl0_n_228);
  lbl0_g12191 : INVD1BWP7T port map(I => lbl0_n_227, ZN => lbl0_n_226);
  lbl0_g12193 : INVD1BWP7T port map(I => lbl0_n_224, ZN => lbl0_n_223);
  lbl0_g12194 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(10), Z => lbl0_d_position_0(10));
  lbl0_g12195 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(1), Z => lbl0_d_position_0(1));
  lbl0_g12196 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(0), Z => lbl0_d_position_0(0));
  lbl0_g12197 : AN2D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(10), Z => lbl0_d_position_1(10));
  lbl0_g12199 : AN2D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(6), Z => lbl0_d_position_1(6));
  lbl0_g12200 : AN2D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(2), Z => lbl0_d_position_1(2));
  lbl0_g12201 : AN2D0BWP7T port map(A1 => lbl0_n_210, A2 => lbl0_next_position_1(1), Z => lbl0_d_position_1(1));
  lbl0_g12202 : AN2D0BWP7T port map(A1 => lbl0_n_386, A2 => position_0(10), Z => lbl0_d_next_position_0(10));
  lbl0_g12203 : AN2D0BWP7T port map(A1 => lbl0_n_387, A2 => direction_between(1), Z => lbl0_d_next_direction_0(1));
  lbl0_g12204 : AN2D0BWP7T port map(A1 => lbl0_n_387, A2 => direction_between(0), Z => lbl0_d_next_direction_0(0));
  lbl0_g12205 : ND2D1BWP7T port map(A1 => lbl0_n_212, A2 => lbl0_n_205, ZN => lbl0_n_325);
  lbl0_g12206 : AN2D0BWP7T port map(A1 => lbl0_n_386, A2 => position_1(10), Z => lbl0_d_next_position_1(10));
  lbl0_g12207 : INR2XD0BWP7T port map(A1 => lbl0_n_383, B1 => lbl0_n_376, ZN => lbl0_n_327);
  lbl0_g12208 : INR2D1BWP7T port map(A1 => lbl0_n_376, B1 => lbl0_n_383, ZN => lbl0_n_326);
  lbl0_g12209 : OR2D1BWP7T port map(A1 => lbl0_n_376, A2 => lbl0_n_377, Z => write_memory(3));
  lbl0_g12210 : NR2D1BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_393, ZN => lbl0_n_231);
  lbl0_g12211 : NR2D1BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_397, ZN => lbl0_n_229);
  lbl0_g12212 : ND2D1BWP7T port map(A1 => lbl0_n_386, A2 => lbl0_n_397, ZN => lbl0_n_227);
  lbl0_g12213 : AN2D1BWP7T port map(A1 => lbl0_n_386, A2 => lbl0_n_393, Z => lbl0_n_225);
  lbl0_g12214 : NR2XD0BWP7T port map(A1 => lbl0_n_378, A2 => lbl0_n_379, ZN => lbl0_n_224);
  lbl0_g12215 : NR2XD0BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_403, ZN => lbl0_d_wallshape_0_2_4143);
  lbl0_g12216 : AN2D0BWP7T port map(A1 => lbl0_n_387, A2 => direction_between(2), Z => lbl0_d_next_direction_1(0));
  lbl0_g12217 : IND2D1BWP7T port map(A1 => lbl0_n_323, B1 => lbl0_n_205, ZN => lbl0_n_324);
  lbl0_g12218 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(6), Z => lbl0_d_position_0(6));
  lbl0_g12219 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(4), Z => lbl0_d_position_0(4));
  lbl0_g12220 : AN2D0BWP7T port map(A1 => lbl0_n_208, A2 => lbl0_next_position_0(3), Z => lbl0_d_position_0(3));
  lbl0_g12221 : OAI31D0BWP7T port map(A1 => lbl0_state(4), A2 => lbl0_n_131, A3 => lbl0_n_139, B => lbl0_n_205, ZN => clear_memory);
  lbl0_g12222 : ND2D1BWP7T port map(A1 => lbl0_n_205, A2 => lbl0_n_207, ZN => lbl0_n_365);
  lbl0_g12223 : ND2D1BWP7T port map(A1 => lbl0_n_205, A2 => lbl0_n_209, ZN => lbl0_n_364);
  lbl0_g12224 : NR2XD0BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_213, ZN => lbl0_n_363);
  lbl0_g12225 : NR2XD0BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_214, ZN => lbl0_n_362);
  lbl0_g12226 : AN2D0BWP7T port map(A1 => lbl0_n_387, A2 => direction_between(3), Z => lbl0_d_next_direction_1(1));
  lbl0_g12227 : NR2XD0BWP7T port map(A1 => lbl0_n_206, A2 => lbl0_n_402, ZN => lbl0_d_wallshape_1_2_4146);
  lbl0_g12228 : OAI211D1BWP7T port map(A1 => lbl0_state(1), A2 => lbl0_n_137, B => lbl0_n_126, C => lbl0_n_134, ZN => lbl0_n_218);
  lbl0_g12229 : ND4D0BWP7T port map(A1 => lbl0_n_85, A2 => lbl0_n_148, A3 => lbl0_n_147, A4 => lbl0_n_84, ZN => lbl0_n_217);
  lbl0_g12230 : NR4D0BWP7T port map(A1 => lbl0_n_145, A2 => lbl0_n_160, A3 => lbl0_n_159, A4 => lbl0_n_146, ZN => lbl0_n_216);
  lbl0_g12231 : OAI21D0BWP7T port map(A1 => lbl0_n_172, A2 => lbl0_state(3), B => lbl0_n_86, ZN => write_enable);
  lbl0_g12232 : IAO21D0BWP7T port map(A1 => lbl0_n_173, A2 => lbl0_n_91, B => lbl0_n_211, ZN => lbl0_n_215);
  lbl0_g12233 : AOI21D0BWP7T port map(A1 => lbl0_n_171, A2 => lbl0_n_170, B => lbl0_n_3, ZN => lbl0_n_222);
  lbl0_g12234 : OAI21D0BWP7T port map(A1 => lbl0_n_110, A2 => position_1(7), B => lbl0_n_198, ZN => lbl0_n_221);
  lbl0_g12235 : OAI21D0BWP7T port map(A1 => lbl0_n_111, A2 => position_0(7), B => lbl0_n_197, ZN => lbl0_n_220);
  lbl0_g12236 : OR2D1BWP7T port map(A1 => lbl0_n_382, A2 => lbl0_n_381, Z => lbl0_n_219);
  lbl0_g12237 : INVD1BWP7T port map(I => lbl0_n_209, ZN => lbl0_n_210);
  lbl0_g12238 : INVD1BWP7T port map(I => lbl0_n_207, ZN => lbl0_n_208);
  lbl0_g12239 : INVD1BWP7T port map(I => lbl0_n_386, ZN => lbl0_n_206);
  lbl0_g12240 : INVD1BWP7T port map(I => lbl0_n_205, ZN => lbl0_n_204);
  lbl0_g12241 : NR3D0BWP7T port map(A1 => lbl0_n_140, A2 => lbl0_n_397, A3 => position_0(9), ZN => lbl0_n_203);
  lbl0_g12242 : NR3D0BWP7T port map(A1 => lbl0_n_133, A2 => lbl0_n_393, A3 => position_1(9), ZN => lbl0_n_202);
  lbl0_g12243 : AN2D0BWP7T port map(A1 => lbl0_n_375, A2 => lbl0_n_396, Z => lbl0_d_direction_0(1));
  lbl0_g12244 : AN2D0BWP7T port map(A1 => lbl0_n_375, A2 => lbl0_n_397, Z => lbl0_d_direction_0(0));
  lbl0_g12245 : AN2D0BWP7T port map(A1 => lbl0_n_375, A2 => lbl0_n_393, Z => lbl0_d_direction_1(0));
  lbl0_g12246 : AN2D0BWP7T port map(A1 => lbl0_n_375, A2 => lbl0_n_392, Z => lbl0_d_direction_1(1));
  lbl0_g12247 : AN2D0BWP7T port map(A1 => lbl0_n_402, A2 => lbl0_n_169, Z => lbl0_n_214);
  lbl0_g12248 : AN2D0BWP7T port map(A1 => lbl0_n_403, A2 => lbl0_n_166, Z => lbl0_n_213);
  lbl0_g12249 : INR2D1BWP7T port map(A1 => lbl0_n_142, B1 => lbl0_n_172, ZN => lbl0_n_378);
  lbl0_g12250 : NR2D1BWP7T port map(A1 => lbl0_n_183, A2 => lbl0_n_109, ZN => lbl0_n_385);
  lbl0_g12251 : NR2XD0BWP7T port map(A1 => lbl0_n_391, A2 => lbl0_n_389, ZN => lbl0_n_212);
  lbl0_g12252 : NR2XD0BWP7T port map(A1 => lbl0_n_176, A2 => lbl0_n_109, ZN => lbl0_n_384);
  lbl0_g12253 : INR2XD0BWP7T port map(A1 => lbl0_state(0), B1 => lbl0_n_172, ZN => lbl0_n_376);
  lbl0_g12254 : AN2D1BWP7T port map(A1 => lbl0_n_173, A2 => lbl0_n_91, Z => lbl0_n_211);
  lbl0_g12255 : OR2D1BWP7T port map(A1 => lbl0_n_390, A2 => lbl0_n_389, Z => lbl0_n_323);
  lbl0_g12256 : NR2XD0BWP7T port map(A1 => lbl0_n_183, A2 => lbl0_state(1), ZN => lbl0_n_387);
  lbl0_g12257 : OAI21D0BWP7T port map(A1 => lbl0_n_125, A2 => player_state_1(1), B => lbl0_n_375, ZN => lbl0_n_209);
  lbl0_g12258 : OAI21D0BWP7T port map(A1 => lbl0_n_108, A2 => player_state_0(1), B => lbl0_n_375, ZN => lbl0_n_207);
  lbl0_g12259 : AN2D1BWP7T port map(A1 => lbl0_n_175, A2 => lbl0_n_109, Z => lbl0_n_386);
  lbl0_g12260 : ND2D1BWP7T port map(A1 => lbl0_n_329, A2 => lbl0_n_89, ZN => lbl0_n_205);
  lbl0_g12261 : OAI221D0BWP7T port map(A1 => lbl0_n_117, A2 => lbl0_next_position_1(2), B1 => position_0(2), B2 => lbl0_n_115, C => lbl0_n_156, ZN => lbl0_n_196);
  lbl0_g12262 : OAI221D0BWP7T port map(A1 => lbl0_n_94, A2 => lbl0_next_position_1(8), B1 => position_0(8), B2 => lbl0_n_116, C => lbl0_n_151, ZN => lbl0_n_195);
  lbl0_g12263 : MAOI22D0BWP7T port map(A1 => lbl0_n_129, A2 => position_1(2), B1 => lbl0_n_129, B2 => position_1(2), ZN => lbl0_n_194);
  lbl0_g12264 : OAI221D0BWP7T port map(A1 => lbl0_n_91, A2 => lbl0_next_position_1(3), B1 => position_0(3), B2 => lbl0_n_97, C => lbl0_n_150, ZN => lbl0_n_193);
  lbl0_g12265 : ND4D0BWP7T port map(A1 => lbl0_next_position_0(9), A2 => lbl0_next_position_0(8), A3 => lbl0_next_position_0(7), A4 => lbl0_next_position_0(6), ZN => lbl0_n_192);
  lbl0_g12266 : OAI221D0BWP7T port map(A1 => lbl0_n_114, A2 => lbl0_next_position_1(1), B1 => lbl0_next_position_0(1), B2 => lbl0_n_103, C => lbl0_n_152, ZN => lbl0_n_191);
  lbl0_g12267 : ND4D0BWP7T port map(A1 => lbl0_next_position_1(4), A2 => lbl0_next_position_1(3), A3 => lbl0_next_position_1(2), A4 => lbl0_next_position_1(1), ZN => lbl0_n_190);
  lbl0_g12268 : AOI221D0BWP7T port map(A1 => lbl0_n_120, A2 => position_1(2), B1 => lbl0_n_90, B2 => lbl0_next_position_0(2), C => lbl0_n_158, ZN => lbl0_n_189);
  lbl0_g12269 : OAI221D0BWP7T port map(A1 => lbl0_n_119, A2 => lbl0_next_position_1(9), B1 => lbl0_next_position_0(9), B2 => lbl0_n_96, C => lbl0_n_164, ZN => lbl0_n_188);
  lbl0_g12270 : ND4D0BWP7T port map(A1 => lbl0_next_position_1(9), A2 => lbl0_next_position_1(8), A3 => lbl0_next_position_1(7), A4 => lbl0_next_position_1(6), ZN => lbl0_n_187);
  lbl0_g12271 : AOI221D0BWP7T port map(A1 => lbl0_n_100, A2 => lbl0_next_position_0(0), B1 => lbl0_n_101, B2 => lbl0_next_position_1(0), C => lbl0_n_144, ZN => lbl0_n_201);
  lbl0_g12272 : AOI221D0BWP7T port map(A1 => lbl0_n_98, A2 => position_0(5), B1 => lbl0_n_123, B2 => lbl0_next_position_1(5), C => lbl0_n_155, ZN => lbl0_n_186);
  lbl0_g12273 : ND4D0BWP7T port map(A1 => lbl0_next_position_0(4), A2 => lbl0_next_position_0(3), A3 => lbl0_next_position_0(2), A4 => lbl0_next_position_0(1), ZN => lbl0_n_185);
  lbl0_g12274 : OAI221D0BWP7T port map(A1 => lbl0_n_118, A2 => lbl0_next_position_0(5), B1 => position_1(5), B2 => lbl0_n_95, C => lbl0_n_157, ZN => lbl0_n_184);
  lbl0_g12275 : IAO21D0BWP7T port map(A1 => lbl0_n_137, A2 => lbl0_state(2), B => lbl0_state(3), ZN => lbl0_n_200);
  lbl0_g12276 : AN3D0BWP7T port map(A1 => lbl0_n_132, A2 => lbl0_n_112, A3 => lbl0_n_90, Z => lbl0_n_199);
  lbl0_g12277 : NR3D0BWP7T port map(A1 => lbl0_n_136, A2 => lbl0_n_131, A3 => lbl0_state(4), ZN => lbl0_n_328);
  lbl0_g12278 : IOA21D1BWP7T port map(A1 => lbl0_n_133, A2 => lbl0_n_110, B => lbl0_n_143, ZN => lbl0_n_198);
  lbl0_g12279 : IOA21D1BWP7T port map(A1 => lbl0_n_140, A2 => lbl0_n_111, B => lbl0_n_135, ZN => lbl0_n_197);
  lbl0_g12280 : NR3D0BWP7T port map(A1 => lbl0_n_139, A2 => lbl0_n_335, A3 => lbl0_state(4), ZN => lbl0_n_382);
  lbl0_g12281 : INVD0BWP7T port map(I => lbl0_n_86, ZN => lbl0_n_182);
  lbl0_g12282 : INVD0BWP7T port map(I => lbl0_n_175, ZN => lbl0_n_176);
  lbl0_g12284 : NR2D0BWP7T port map(A1 => lbl0_n_336, A2 => lbl0_n_141, ZN => lbl0_n_372);
  lbl0_g12285 : NR4D0BWP7T port map(A1 => read_memory_in(5), A2 => read_memory_in(4), A3 => read_memory_in(6), A4 => read_memory_in(7), ZN => lbl0_n_171);
  lbl0_g12286 : NR4D0BWP7T port map(A1 => read_memory_in(1), A2 => read_memory_in(0), A3 => read_memory_in(2), A4 => read_memory_in(3), ZN => lbl0_n_170);
  lbl0_g12287 : NR2D1BWP7T port map(A1 => lbl0_n_136, A2 => lbl0_n_141, ZN => lbl0_n_374);
  lbl0_g12288 : NR2D0BWP7T port map(A1 => lbl0_n_336, A2 => lbl0_n_137, ZN => lbl0_n_373);
  lbl0_g12289 : IND2D1BWP7T port map(A1 => lbl0_n_126, B1 => lbl0_n_142, ZN => lbl0_n_183);
  lbl0_g12291 : NR2D0BWP7T port map(A1 => lbl0_n_128, A2 => lbl0_n_138, ZN => lbl0_n_181);
  lbl0_g12292 : AN2D0BWP7T port map(A1 => lbl0_n_133, A2 => lbl0_n_143, Z => lbl0_n_180);
  lbl0_g12293 : NR2XD0BWP7T port map(A1 => lbl0_n_129, A2 => lbl0_n_90, ZN => lbl0_n_179);
  lbl0_g12294 : CKAN2D1BWP7T port map(A1 => lbl0_n_128, A2 => position_0(2), Z => lbl0_n_178);
  lbl0_g12295 : INR2D1BWP7T port map(A1 => lbl0_n_129, B1 => lbl0_n_132, ZN => lbl0_n_177);
  lbl0_g12296 : NR2D0BWP7T port map(A1 => lbl0_n_127, A2 => lbl0_n_141, ZN => lbl0_n_390);
  lbl0_g12297 : INR2XD0BWP7T port map(A1 => lbl0_n_142, B1 => lbl0_n_136, ZN => lbl0_n_329);
  lbl0_g12298 : NR2XD0BWP7T port map(A1 => lbl0_n_126, A2 => lbl0_n_131, ZN => lbl0_n_175);
  lbl0_g12299 : NR2D1BWP7T port map(A1 => lbl0_n_127, A2 => lbl0_n_335, ZN => lbl0_n_379);
  lbl0_g12300 : NR2XD0BWP7T port map(A1 => lbl0_n_127, A2 => lbl0_n_137, ZN => lbl0_n_391);
  lbl0_g12301 : AN2D0BWP7T port map(A1 => lbl0_n_140, A2 => lbl0_n_135, Z => lbl0_n_174);
  lbl0_g12302 : NR2D1BWP7T port map(A1 => lbl0_n_336, A2 => lbl0_n_130, ZN => lbl0_n_389);
  lbl0_g12303 : NR2XD0BWP7T port map(A1 => lbl0_n_127, A2 => lbl0_n_130, ZN => lbl0_n_377);
  lbl0_g12304 : AN2D1BWP7T port map(A1 => lbl0_n_138, A2 => lbl0_n_117, Z => lbl0_n_173);
  lbl0_g12305 : NR2XD0BWP7T port map(A1 => lbl0_n_136, A2 => lbl0_n_335, ZN => lbl0_n_381);
  lbl0_g12306 : NR2XD0BWP7T port map(A1 => lbl0_n_139, A2 => lbl0_n_130, ZN => lbl0_n_383);
  lbl0_g12307 : OR2D1BWP7T port map(A1 => lbl0_n_134, A2 => lbl0_state(1), Z => lbl0_n_172);
  lbl0_g12308 : NR2D1BWP7T port map(A1 => lbl0_n_136, A2 => lbl0_n_130, ZN => lbl0_n_380);
  lbl0_g12309 : NR2D1BWP7T port map(A1 => lbl0_n_136, A2 => lbl0_n_137, ZN => lbl0_n_375);
  lbl0_g12310 : MAOI22D0BWP7T port map(A1 => lbl0_n_93, A2 => lbl0_next_position_1(7), B1 => lbl0_n_93, B2 => lbl0_next_position_1(7), ZN => lbl0_n_165);
  lbl0_g12311 : XNR2D1BWP7T port map(A1 => lbl0_next_position_0(10), A2 => lbl0_next_position_1(10), ZN => lbl0_n_164);
  lbl0_g12312 : MOAI22D0BWP7T port map(A1 => lbl0_n_92, A2 => lbl0_next_position_0(7), B1 => lbl0_n_92, B2 => lbl0_next_position_0(7), ZN => lbl0_n_163);
  lbl0_g12313 : XNR2D1BWP7T port map(A1 => lbl0_next_position_1(10), A2 => position_0(10), ZN => lbl0_n_162);
  lbl0_g12314 : CKXOR2D1BWP7T port map(A1 => lbl0_next_position_0(10), A2 => position_1(10), Z => lbl0_n_161);
  lbl0_g12315 : MOAI22D0BWP7T port map(A1 => lbl0_n_112, A2 => lbl0_next_position_0(3), B1 => lbl0_n_112, B2 => lbl0_next_position_0(3), ZN => lbl0_n_160);
  lbl0_g12316 : MOAI22D0BWP7T port map(A1 => lbl0_n_113, A2 => lbl0_next_position_0(8), B1 => lbl0_n_113, B2 => lbl0_next_position_0(8), ZN => lbl0_n_159);
  lbl0_g12317 : MOAI22D0BWP7T port map(A1 => lbl0_n_114, A2 => position_1(1), B1 => lbl0_n_114, B2 => position_1(1), ZN => lbl0_n_158);
  lbl0_g12318 : AOI22D0BWP7T port map(A1 => lbl0_n_121, A2 => position_1(6), B1 => lbl0_n_124, B2 => lbl0_next_position_0(6), ZN => lbl0_n_157);
  lbl0_g12319 : MAOI22D0BWP7T port map(A1 => lbl0_n_103, A2 => position_0(1), B1 => lbl0_n_103, B2 => position_0(1), ZN => lbl0_n_156);
  lbl0_g12320 : OAI22D0BWP7T port map(A1 => lbl0_n_105, A2 => lbl0_next_position_1(6), B1 => lbl0_n_102, B2 => position_0(6), ZN => lbl0_n_155);
  lbl0_g12321 : MAOI22D0BWP7T port map(A1 => lbl0_n_104, A2 => lbl0_next_position_1(4), B1 => lbl0_n_104, B2 => lbl0_next_position_1(4), ZN => lbl0_n_154);
  lbl0_g12322 : MOAI22D0BWP7T port map(A1 => lbl0_n_106, A2 => lbl0_next_position_0(4), B1 => lbl0_n_106, B2 => lbl0_next_position_0(4), ZN => lbl0_n_153);
  lbl0_g12323 : AOI22D0BWP7T port map(A1 => lbl0_n_115, A2 => lbl0_next_position_0(2), B1 => lbl0_n_120, B2 => lbl0_next_position_1(2), ZN => lbl0_n_152);
  lbl0_g12324 : MAOI22D0BWP7T port map(A1 => lbl0_n_96, A2 => position_0(9), B1 => lbl0_n_96, B2 => position_0(9), ZN => lbl0_n_151);
  lbl0_g12325 : MAOI22D0BWP7T port map(A1 => lbl0_n_100, A2 => position_0(0), B1 => lbl0_n_100, B2 => position_0(0), ZN => lbl0_n_150);
  lbl0_g12326 : MOAI22D0BWP7T port map(A1 => lbl0_n_116, A2 => lbl0_next_position_0(8), B1 => lbl0_n_116, B2 => lbl0_next_position_0(8), ZN => lbl0_n_149);
  lbl0_g12327 : AOI22D0BWP7T port map(A1 => lbl0_n_102, A2 => lbl0_next_position_0(6), B1 => lbl0_n_121, B2 => lbl0_next_position_1(6), ZN => lbl0_n_148);
  lbl0_g12328 : AOI22D0BWP7T port map(A1 => lbl0_n_98, A2 => lbl0_next_position_0(5), B1 => lbl0_n_95, B2 => lbl0_next_position_1(5), ZN => lbl0_n_147);
  lbl0_g12329 : MOAI22D0BWP7T port map(A1 => lbl0_n_119, A2 => position_1(9), B1 => lbl0_n_119, B2 => position_1(9), ZN => lbl0_n_146);
  lbl0_g12330 : MOAI22D0BWP7T port map(A1 => lbl0_n_101, A2 => position_1(0), B1 => lbl0_n_101, B2 => position_1(0), ZN => lbl0_n_145);
  lbl0_g12332 : MOAI22D0BWP7T port map(A1 => lbl0_n_97, A2 => lbl0_next_position_0(3), B1 => lbl0_n_97, B2 => lbl0_next_position_0(3), ZN => lbl0_n_144);
  lbl0_g12334 : MAOI22D0BWP7T port map(A1 => lbl0_n_392, A2 => direction_1(1), B1 => lbl0_n_392, B2 => direction_1(1), ZN => lbl0_n_169);
  lbl0_g12337 : MAOI22D0BWP7T port map(A1 => lbl0_n_396, A2 => direction_0(1), B1 => lbl0_n_396, B2 => direction_0(1), ZN => lbl0_n_166);
  lbl0_g12338 : NR2D0BWP7T port map(A1 => lbl0_state(1), A2 => lbl0_state(4), ZN => lbl0_n_4445_BAR);
  lbl0_g12339 : INR2D1BWP7T port map(A1 => lbl0_state(3), B1 => lbl0_n_89, ZN => lbl0_n_388);
  lbl0_g12340 : CKND2D1BWP7T port map(A1 => position_1(6), A2 => position_1(5), ZN => lbl0_n_143);
  lbl0_g12341 : NR2XD0BWP7T port map(A1 => lbl0_state(0), A2 => lbl0_state(3), ZN => lbl0_n_142);
  lbl0_g12342 : ND2D1BWP7T port map(A1 => lbl0_state(4), A2 => lbl0_state(0), ZN => lbl0_n_141);
  lbl0_g12343 : ND2D1BWP7T port map(A1 => lbl0_n_105, A2 => lbl0_n_123, ZN => lbl0_n_140);
  lbl0_g12344 : IND2D1BWP7T port map(A1 => lbl0_state(2), B1 => lbl0_n_109, ZN => lbl0_n_139);
  lbl0_g12345 : NR2D1BWP7T port map(A1 => position_0(0), A2 => position_0(1), ZN => lbl0_n_138);
  lbl0_g12346 : IND2D1BWP7T port map(A1 => lbl0_state(0), B1 => lbl0_state(3), ZN => lbl0_n_335);
  lbl0_g12347 : IND2D1BWP7T port map(A1 => lbl0_state(0), B1 => lbl0_state(4), ZN => lbl0_n_137);
  lbl0_g12348 : IND2D1BWP7T port map(A1 => lbl0_state(2), B1 => lbl0_state(1), ZN => lbl0_n_136);
  lbl0_g12350 : CKND2D1BWP7T port map(A1 => position_0(6), A2 => position_0(5), ZN => lbl0_n_135);
  lbl0_g12351 : IND2D1BWP7T port map(A1 => lbl0_state(2), B1 => lbl0_state(4), ZN => lbl0_n_134);
  lbl0_g12352 : ND2D1BWP7T port map(A1 => lbl0_n_124, A2 => lbl0_n_118, ZN => lbl0_n_133);
  lbl0_g12353 : NR2D1BWP7T port map(A1 => position_1(0), A2 => position_1(1), ZN => lbl0_n_132);
  lbl0_g12354 : IND2D1BWP7T port map(A1 => lbl0_state(3), B1 => lbl0_state(0), ZN => lbl0_n_131);
  lbl0_g12355 : ND2D1BWP7T port map(A1 => lbl0_n_109, A2 => lbl0_state(2), ZN => lbl0_n_336);
  lbl0_g12356 : CKND2D1BWP7T port map(A1 => lbl0_state(3), A2 => lbl0_state(0), ZN => lbl0_n_130);
  lbl0_g12357 : ND2D1BWP7T port map(A1 => position_1(0), A2 => position_1(1), ZN => lbl0_n_129);
  lbl0_g12358 : AN2D1BWP7T port map(A1 => position_0(0), A2 => position_0(1), Z => lbl0_n_128);
  lbl0_g12359 : ND2D1BWP7T port map(A1 => lbl0_state(1), A2 => lbl0_state(2), ZN => lbl0_n_127);
  lbl0_g12360 : ND2D1BWP7T port map(A1 => lbl0_n_89, A2 => lbl0_state(2), ZN => lbl0_n_126);
  lbl0_g12361 : INVD0BWP7T port map(I => player_state_1(0), ZN => lbl0_n_125);
  lbl0_g12362 : INVD0BWP7T port map(I => position_1(6), ZN => lbl0_n_124);
  lbl0_g12363 : INVD0BWP7T port map(I => position_0(5), ZN => lbl0_n_123);
  lbl0_g12365 : CKND1BWP7T port map(I => lbl0_next_position_0(6), ZN => lbl0_n_121);
  lbl0_g12366 : CKND1BWP7T port map(I => lbl0_next_position_0(2), ZN => lbl0_n_120);
  lbl0_g12368 : INVD0BWP7T port map(I => lbl0_next_position_0(9), ZN => lbl0_n_119);
  lbl0_g12369 : INVD0BWP7T port map(I => position_1(5), ZN => lbl0_n_118);
  lbl0_g12370 : INVD1BWP7T port map(I => position_0(2), ZN => lbl0_n_117);
  lbl0_g12371 : INVD0BWP7T port map(I => lbl0_next_position_1(8), ZN => lbl0_n_116);
  lbl0_g12372 : INVD0BWP7T port map(I => lbl0_next_position_1(2), ZN => lbl0_n_115);
  lbl0_g12373 : INVD0BWP7T port map(I => lbl0_next_position_0(1), ZN => lbl0_n_114);
  lbl0_g12375 : INVD1BWP7T port map(I => position_1(8), ZN => lbl0_n_113);
  lbl0_g12376 : INVD1BWP7T port map(I => position_1(3), ZN => lbl0_n_112);
  lbl0_g12377 : INVD1BWP7T port map(I => lbl0_n_396, ZN => lbl0_n_111);
  lbl0_g12378 : INVD1BWP7T port map(I => lbl0_n_392, ZN => lbl0_n_110);
  lbl0_g12380 : INVD0BWP7T port map(I => player_state_0(0), ZN => lbl0_n_108);
  lbl0_g12381 : CKND1BWP7T port map(I => memory_ready, ZN => lbl0_n_3);
  lbl0_g12382 : INVD0BWP7T port map(I => position_1(4), ZN => lbl0_n_106);
  lbl0_g12383 : INVD0BWP7T port map(I => position_0(6), ZN => lbl0_n_105);
  lbl0_g12384 : INVD1BWP7T port map(I => position_0(4), ZN => lbl0_n_104);
  lbl0_g12385 : INVD1BWP7T port map(I => lbl0_next_position_1(1), ZN => lbl0_n_103);
  lbl0_g12386 : INVD0BWP7T port map(I => lbl0_next_position_1(6), ZN => lbl0_n_102);
  lbl0_g12387 : INVD0BWP7T port map(I => lbl0_next_position_0(0), ZN => lbl0_n_101);
  lbl0_g12389 : INVD1BWP7T port map(I => lbl0_next_position_1(0), ZN => lbl0_n_100);
  lbl0_g12391 : INVD0BWP7T port map(I => lbl0_next_position_1(5), ZN => lbl0_n_98);
  lbl0_g12393 : INVD0BWP7T port map(I => lbl0_next_position_1(3), ZN => lbl0_n_97);
  lbl0_g12394 : INVD1BWP7T port map(I => lbl0_next_position_1(9), ZN => lbl0_n_96);
  lbl0_g12395 : INVD0BWP7T port map(I => lbl0_next_position_0(5), ZN => lbl0_n_95);
  lbl0_g12396 : INVD1BWP7T port map(I => position_0(8), ZN => lbl0_n_94);
  lbl0_g12397 : INVD1BWP7T port map(I => position_0(7), ZN => lbl0_n_93);
  lbl0_g12398 : INVD1BWP7T port map(I => position_1(7), ZN => lbl0_n_92);
  lbl0_g12399 : INVD1BWP7T port map(I => position_0(3), ZN => lbl0_n_91);
  lbl0_g12400 : INVD1BWP7T port map(I => position_1(2), ZN => lbl0_n_90);
  lbl0_g2 : INR3D0BWP7T port map(A1 => lbl0_n_254, B1 => lbl0_n_221, B2 => position_1(8), ZN => lbl0_n_88);
  lbl0_g12402 : INR3D0BWP7T port map(A1 => lbl0_n_253, B1 => lbl0_n_220, B2 => position_0(8), ZN => lbl0_n_87);
  lbl0_g12403 : MUX2D0BWP7T port map(I0 => lbl0_n_225, I1 => lbl0_n_231, S => position_1(0), Z => lbl0_d_next_position_1(0));
  lbl0_g12404 : IND2D1BWP7T port map(A1 => lbl0_n_127, B1 => lbl0_state(3), ZN => lbl0_n_86);
  lbl0_g12405 : XNR2D1BWP7T port map(A1 => lbl0_next_position_1(7), A2 => lbl0_next_position_0(7), ZN => lbl0_n_85);
  lbl0_g12406 : XNR2D1BWP7T port map(A1 => lbl0_next_position_1(4), A2 => lbl0_next_position_0(4), ZN => lbl0_n_84);
  lbl0_counter_busy_counter_state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl0_n_6, D => lbl0_n_45, Q => lbl0_counter_busy_counter_state(0));
  lbl0_counter_unsigned_busy_count_reg_0 : DFXQD1BWP7T port map(CP => clk, DA => lbl0_n_36, DB => lbl0_n_24, SA => lbl0_unsigned_busy_count(0), Q => lbl0_unsigned_busy_count(0));
  lbl0_counter_unsigned_busy_count_reg_1 : DFQD1BWP7T port map(CP => clk, D => lbl0_n_49, Q => lbl0_unsigned_busy_count(1));
  lbl0_counter_unsigned_busy_count_reg_2 : DFQD1BWP7T port map(CP => clk, D => lbl0_n_62, Q => lbl0_unsigned_busy_count(2));
  lbl0_counter_unsigned_busy_count_reg_3 : DFQD1BWP7T port map(CP => clk, D => lbl0_n_72, Q => lbl0_unsigned_busy_count(3));
  lbl0_state_reg_0 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl0_n_2, D => lbl0_n_404, Q => lbl0_state(0));
  lbl0_state_reg_2 : DFQD1BWP7T port map(CP => clk, D => lbl0_n_82, Q => lbl0_state(2));
  lbl0_state_reg_3 : DFQD1BWP7T port map(CP => clk, D => lbl0_n_73, Q => lbl0_state(3));
  lbl0_g7734 : ND4D0BWP7T port map(A1 => lbl0_n_39, A2 => lbl0_n_11, A3 => lbl0_n_9, A4 => lbl0_n_80, ZN => lbl0_n_82);
  lbl0_g7736 : ND4D0BWP7T port map(A1 => lbl0_n_21, A2 => lbl0_n_20, A3 => lbl0_n_79, A4 => lbl0_n_74, ZN => lbl0_n_81);
  lbl0_g7739 : AN4D0BWP7T port map(A1 => lbl0_n_69, A2 => lbl0_n_55, A3 => lbl0_n_74, A4 => lbl0_n_67, Z => lbl0_n_80);
  lbl0_g7743 : NR2XD0BWP7T port map(A1 => lbl0_n_59, A2 => lbl0_n_75, ZN => lbl0_n_79);
  lbl0_g7744 : MOAI22D0BWP7T port map(A1 => lbl0_n_70, A2 => lbl0_n_25, B1 => lbl0_unsigned_busy_count(4), B2 => lbl0_n_64, ZN => lbl0_n_78);
  lbl0_g7745 : OAI211D1BWP7T port map(A1 => rst, A2 => lbl0_n_35, B => lbl0_n_65, C => lbl0_n_67, ZN => lbl0_n_77);
  lbl0_g7746 : IND4D0BWP7T port map(A1 => lbl0_n_58, B1 => lbl0_n_57, B2 => lbl0_n_13, B3 => lbl0_n_56, ZN => lbl0_n_76);
  lbl0_g7747 : OAI211D1BWP7T port map(A1 => lbl0_n_8, A2 => lbl0_n_39, B => lbl0_n_66, C => lbl0_n_52, ZN => lbl0_n_75);
  lbl0_g7748 : IND3D1BWP7T port map(A1 => lbl0_n_63, B1 => lbl0_n_53, B2 => lbl0_n_69, ZN => lbl0_n_73);
  lbl0_g7749 : OAI31D0BWP7T port map(A1 => lbl0_n_25, A2 => lbl0_unsigned_busy_count(3), A3 => lbl0_n_46, B => lbl0_n_71, ZN => lbl0_n_72);
  lbl0_g7750 : AOI21D0BWP7T port map(A1 => lbl0_n_405, A2 => lbl0_n_388, B => lbl0_n_68, ZN => lbl0_n_74);
  lbl0_g7751 : ND2D0BWP7T port map(A1 => lbl0_unsigned_busy_count(3), A2 => lbl0_n_64, ZN => lbl0_n_71);
  lbl0_g7752 : CKMUX2D1BWP7T port map(I0 => lbl0_n_60, I1 => lbl0_unsigned_busy_count(3), S => lbl0_unsigned_busy_count(4), Z => lbl0_n_70);
  lbl0_g7755 : AOI21D0BWP7T port map(A1 => lbl0_n_405, A2 => lbl0_n_375, B => lbl0_n_32, ZN => lbl0_n_69);
  lbl0_g7756 : MOAI22D0BWP7T port map(A1 => lbl0_n_13, A2 => lbl0_n_37, B1 => lbl0_n_405, B2 => lbl0_n_373, ZN => lbl0_n_68);
  lbl0_g7757 : MAOI22D0BWP7T port map(A1 => lbl0_n_405, A2 => lbl0_n_372, B1 => lbl0_n_13, B2 => lbl0_n_33, ZN => lbl0_n_67);
  lbl0_g7758 : OAI21D0BWP7T port map(A1 => lbl0_n_375, A2 => lbl0_n_379, B => lbl0_n_405, ZN => lbl0_n_66);
  lbl0_g7759 : OAI21D0BWP7T port map(A1 => lbl0_n_377, A2 => lbl0_n_379, B => lbl0_n_405, ZN => lbl0_n_65);
  lbl0_g7760 : OAI222D0BWP7T port map(A1 => lbl0_n_11, A2 => lbl0_n_33, B1 => lbl0_n_37, B2 => lbl0_n_9, C1 => rst, C2 => lbl0_n_54, ZN => lbl0_n_63);
  lbl0_g7761 : MOAI22D0BWP7T port map(A1 => lbl0_n_50, A2 => lbl0_n_25, B1 => lbl0_unsigned_busy_count(2), B2 => lbl0_n_36, ZN => lbl0_n_62);
  lbl0_g7762 : AO21D0BWP7T port map(A1 => lbl0_n_46, A2 => lbl0_n_24, B => lbl0_n_36, Z => lbl0_n_64);
  lbl0_g7763 : IND2D1BWP7T port map(A1 => lbl0_n_46, B1 => lbl0_unsigned_busy_count(3), ZN => lbl0_n_60);
  lbl0_g7765 : AOI21D0BWP7T port map(A1 => lbl0_n_56, A2 => lbl0_n_48, B => memory_ready, ZN => lbl0_n_59);
  lbl0_g7766 : OAI211D1BWP7T port map(A1 => lbl0_n_12, A2 => lbl0_n_43, B => lbl0_n_51, C => lbl0_n_53, ZN => lbl0_n_58);
  lbl0_g7769 : AOI211XD0BWP7T port map(A1 => lbl0_n_374, A2 => lbl0_n_2, B => lbl0_n_41, C => lbl0_n_44, ZN => lbl0_n_57);
  lbl0_g7771 : AO21D0BWP7T port map(A1 => lbl0_n_34, A2 => lbl0_n_23, B => rst, Z => lbl0_n_55);
  lbl0_g7772 : NR4D0BWP7T port map(A1 => lbl0_n_22, A2 => lbl0_n_327, A3 => lbl0_n_384, A4 => lbl0_n_389, ZN => lbl0_n_54);
  lbl0_g7773 : IND4D0BWP7T port map(A1 => lbl0_n_391, B1 => lbl0_n_2, B2 => lbl0_n_325, B3 => lbl0_n_26, ZN => lbl0_n_56);
  lbl0_g7775 : AOI22D0BWP7T port map(A1 => lbl0_n_391, A2 => lbl0_n_33, B1 => memory_ready, B2 => lbl0_n_327, ZN => lbl0_n_52);
  lbl0_g7776 : AO21D0BWP7T port map(A1 => lbl0_n_34, A2 => lbl0_n_21, B => rst, Z => lbl0_n_51);
  lbl0_g7777 : MAOI22D0BWP7T port map(A1 => lbl0_n_7, A2 => lbl0_unsigned_busy_count(2), B1 => lbl0_n_7, B2 => lbl0_unsigned_busy_count(2), ZN => lbl0_n_50);
  lbl0_g7778 : MOAI22D0BWP7T port map(A1 => lbl0_n_19, A2 => lbl0_n_25, B1 => lbl0_unsigned_busy_count(1), B2 => lbl0_n_36, ZN => lbl0_n_49);
  lbl0_g7779 : AOI21D0BWP7T port map(A1 => lbl0_n_382, A2 => lbl0_n_2, B => lbl0_n_47, ZN => lbl0_n_53);
  lbl0_g7781 : ND2D1BWP7T port map(A1 => busy, A2 => lbl0_n_36, ZN => lbl0_n_45);
  lbl0_g7782 : INR2D1BWP7T port map(A1 => lbl0_n_33, B1 => lbl0_n_11, ZN => lbl0_n_44);
  lbl0_g7784 : IND2D1BWP7T port map(A1 => lbl0_n_7, B1 => lbl0_unsigned_busy_count(2), ZN => lbl0_n_46);
  lbl0_g7785 : IOA21D1BWP7T port map(A1 => busy, A2 => lbl0_n_28, B => lbl0_n_30, ZN => lbl0_n_42);
  lbl0_g7786 : INR2D1BWP7T port map(A1 => lbl0_n_37, B1 => lbl0_n_9, ZN => lbl0_n_41);
  lbl0_g7787 : MOAI22D0BWP7T port map(A1 => lbl0_n_26, A2 => lbl0_n_29, B1 => lbl0_n_26, B2 => lbl0_n_29, ZN => lbl0_n_40);
  lbl0_g7788 : AOI21D0BWP7T port map(A1 => lbl0_n_27, A2 => lbl0_n_8, B => lbl0_n_38, ZN => lbl0_n_43);
  lbl0_g7789 : INVD0BWP7T port map(I => lbl0_n_39, ZN => lbl0_n_38);
  lbl0_g7790 : INR2XD0BWP7T port map(A1 => lbl0_n_20, B1 => lbl0_n_326, ZN => lbl0_n_35);
  lbl0_g7791 : ND2D1BWP7T port map(A1 => lbl0_n_27, A2 => lbl0_n_12, ZN => lbl0_n_39);
  lbl0_g7792 : CKND2D1BWP7T port map(A1 => lbl0_n_17, A2 => lbl0_n_16, ZN => lbl0_n_37);
  lbl0_g7793 : IND2D1BWP7T port map(A1 => lbl0_n_28, B1 => lbl0_n_30, ZN => lbl0_n_36);
  lbl0_g7794 : INR3D0BWP7T port map(A1 => lbl0_n_27, B1 => lbl0_n_8, B2 => lbl0_n_12, ZN => lbl0_n_32);
  lbl0_g7796 : NR3D0BWP7T port map(A1 => lbl0_n_22, A2 => lbl0_n_385, A3 => lbl0_n_386, ZN => lbl0_n_34);
  lbl0_g7797 : ND2D1BWP7T port map(A1 => lbl0_n_18, A2 => lbl0_n_15, ZN => lbl0_n_33);
  lbl0_g7798 : INVD1BWP7T port map(I => lbl0_n_25, ZN => lbl0_n_24);
  lbl0_g7799 : AOI21D0BWP7T port map(A1 => lbl0_n_389, A2 => lbl0_n_4, B => lbl0_n_387, ZN => lbl0_n_23);
  lbl0_g7800 : IND3D1BWP7T port map(A1 => lbl0_counter_busy_counter_state(0), B1 => lbl0_n_6, B2 => lbl0_counter_busy_counter_state(1), ZN => lbl0_n_30);
  lbl0_g7801 : OR2D1BWP7T port map(A1 => lbl0_n_376, A2 => lbl0_n_14, Z => lbl0_n_29);
  lbl0_g7802 : AN3D0BWP7T port map(A1 => lbl0_n_5, A2 => lbl0_counter_busy_counter_state(0), A3 => lbl0_n_6, Z => lbl0_n_28);
  lbl0_g7803 : AN2D1BWP7T port map(A1 => lbl0_n_14, A2 => lbl0_n_2, Z => lbl0_n_27);
  lbl0_g7804 : NR3D0BWP7T port map(A1 => lbl0_n_323, A2 => lbl0_n_383, A3 => lbl0_n_381, ZN => lbl0_n_26);
  lbl0_g7805 : ND3D0BWP7T port map(A1 => lbl0_counter_busy_counter_state(0), A2 => lbl0_counter_busy_counter_state(1), A3 => lbl0_n_6, ZN => lbl0_n_25);
  lbl0_g7806 : XNR2D1BWP7T port map(A1 => lbl0_unsigned_busy_count(0), A2 => lbl0_unsigned_busy_count(1), ZN => lbl0_n_19);
  lbl0_g7807 : XNR2D1BWP7T port map(A1 => direction_1(0), A2 => direction_between(2), ZN => lbl0_n_18);
  lbl0_g7808 : XNR2D1BWP7T port map(A1 => direction_0(1), A2 => direction_between(1), ZN => lbl0_n_17);
  lbl0_g7809 : XNR2D1BWP7T port map(A1 => direction_0(0), A2 => direction_between(0), ZN => lbl0_n_16);
  lbl0_g7810 : XNR2D1BWP7T port map(A1 => direction_1(1), A2 => direction_between(3), ZN => lbl0_n_15);
  lbl0_g7811 : AO21D0BWP7T port map(A1 => memory_ready, A2 => lbl0_n_378, B => lbl0_n_380, Z => lbl0_n_22);
  lbl0_g7812 : AOI22D0BWP7T port map(A1 => lbl0_n_4451_BAR, A2 => lbl0_n_4445_BAR, B1 => memory_ready, B2 => lbl0_n_326, ZN => lbl0_n_21);
  lbl0_g7813 : AOI22D0BWP7T port map(A1 => lbl0_n_3, A2 => lbl0_n_378, B1 => lbl0_n_389, B2 => lbl0_unsigned_busy_count(4), ZN => lbl0_n_20);
  lbl0_g7815 : NR2XD0BWP7T port map(A1 => lbl0_n_336, A2 => lbl0_n_335, ZN => lbl0_n_14);
  lbl0_g7816 : ND2D1BWP7T port map(A1 => lbl0_n_328, A2 => lbl0_n_2, ZN => lbl0_n_13);
  lbl0_g7817 : ND2D1BWP7T port map(A1 => player_state_0(0), A2 => player_state_0(1), ZN => lbl0_n_12);
  lbl0_g7818 : ND2D1BWP7T port map(A1 => lbl0_n_391, A2 => lbl0_n_2, ZN => lbl0_n_11);
  lbl0_g7819 : ND2D1BWP7T port map(A1 => lbl0_n_390, A2 => lbl0_n_2, ZN => lbl0_n_9);
  lbl0_g7820 : CKND2D1BWP7T port map(A1 => player_state_1(1), A2 => player_state_1(0), ZN => lbl0_n_8);
  lbl0_g7821 : ND2D1BWP7T port map(A1 => lbl0_unsigned_busy_count(1), A2 => lbl0_unsigned_busy_count(0), ZN => lbl0_n_7);
  lbl0_g7822 : NR2D1BWP7T port map(A1 => rst, A2 => lbl0_busy_counter_reset, ZN => lbl0_n_6);
  lbl0_drc_bufs7828 : INVD0BWP7T port map(I => rst, ZN => lbl0_n_2);
  lbl0_g12407 : IIND4D0BWP7T port map(A1 => lbl0_n_77, A2 => lbl0_n_68, B1 => lbl0_n_57, B2 => lbl0_n_43, ZN => lbl0_n_0);
  lbl0_g12408 : INVD0BWP7T port map(I => lbl0_n_131, ZN => lbl0_n_4451_BAR);
  lbl0_g12409 : INVD0BWP7T port map(I => lbl0_n_48, ZN => lbl0_n_47);
  lbl0_g12410 : XNR2D1BWP7T port map(A1 => lbl0_n_393, A2 => direction_1(0), ZN => lbl0_n_402);
  lbl0_g12411 : XNR2D1BWP7T port map(A1 => lbl0_n_397, A2 => direction_0(0), ZN => lbl0_n_403);
  lbl0_g12412 : NR3D0BWP7T port map(A1 => lbl0_n_382, A2 => lbl0_n_380, A3 => lbl0_n_81, ZN => lbl0_n_404);
  lbl0_g12413 : NR3D0BWP7T port map(A1 => lbl0_n_40, A2 => lbl0_n_325, A3 => rst, ZN => lbl0_n_405);
  lbl0_g12414 : ND2D1BWP7T port map(A1 => lbl0_n_381, A2 => lbl0_n_2, ZN => lbl0_n_48);
  lbl0_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl0_n_76, Q => lbl0_state(1), QN => lbl0_n_109);
  lbl0_state_reg_4 : DFD1BWP7T port map(CP => clk, D => lbl0_n_0, Q => lbl0_state(4), QN => lbl0_n_89);
  lbl0_counter_busy_counter_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl0_n_42, Q => lbl0_counter_busy_counter_state(1), QN => lbl0_n_5);
  lbl0_counter_unsigned_busy_count_reg_4 : DFD1BWP7T port map(CP => clk, D => lbl0_n_78, Q => lbl0_unsigned_busy_count(4), QN => lbl0_n_4);
  lbl0_reg_pos0_q_reg_7 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(7), E => lbl0_n_365, Q => position_0(7));
  lbl0_reg_pos0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(1), E => lbl0_n_365, Q => position_0(1));
  lbl0_reg_pos0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(0), E => lbl0_n_365, Q => position_0(0));
  lbl0_reg_pos0_q_reg_8 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(8), E => lbl0_n_365, Q => position_0(8));
  lbl0_reg_pos0_q_reg_9 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(9), E => lbl0_n_365, Q => position_0(9));
  lbl0_reg_pos0_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(2), E => lbl0_n_365, Q => position_0(2));
  lbl0_reg_pos0_q_reg_10 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(10), E => lbl0_n_365, Q => position_0(10));
  lbl0_reg_pos0_q_reg_3 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(3), E => lbl0_n_365, Q => position_0(3));
  lbl0_reg_pos0_q_reg_4 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(4), E => lbl0_n_365, Q => position_0(4));
  lbl0_reg_pos0_q_reg_5 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(5), E => lbl0_n_365, Q => position_0(5));
  lbl0_reg_pos0_q_reg_6 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos0_n_1, D => lbl0_d_position_0(6), E => lbl0_n_365, Q => position_0(6));
  lbl0_reg_pos0_g38 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_pos0_n_1);
  lbl0_reg_pos1_q_reg_7 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(7), E => lbl0_n_364, Q => position_1(7));
  lbl0_reg_pos1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(1), E => lbl0_n_364, Q => position_1(1));
  lbl0_reg_pos1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(0), E => lbl0_n_364, Q => position_1(0));
  lbl0_reg_pos1_q_reg_8 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(8), E => lbl0_n_364, Q => position_1(8));
  lbl0_reg_pos1_q_reg_9 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(9), E => lbl0_n_364, Q => position_1(9));
  lbl0_reg_pos1_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(2), E => lbl0_n_364, Q => position_1(2));
  lbl0_reg_pos1_q_reg_10 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(10), E => lbl0_n_364, Q => position_1(10));
  lbl0_reg_pos1_q_reg_3 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(3), E => lbl0_n_364, Q => position_1(3));
  lbl0_reg_pos1_q_reg_4 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(4), E => lbl0_n_364, Q => position_1(4));
  lbl0_reg_pos1_q_reg_5 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(5), E => lbl0_n_364, Q => position_1(5));
  lbl0_reg_pos1_q_reg_6 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_pos1_n_1, D => lbl0_d_position_1(6), E => lbl0_n_364, Q => position_1(6));
  lbl0_reg_pos1_g38 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_pos1_n_1);
  lbl0_reg_dir_0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_dir_0_n_0, D => lbl0_d_direction_0(0), E => lbl0_n_329, Q => direction_0(0));
  lbl0_reg_dir_0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_dir_0_n_0, D => lbl0_d_direction_0(1), E => lbl0_n_329, Q => direction_0(1));
  lbl0_reg_dir_0_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_dir_0_n_0);
  lbl0_reg_dir_1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_dir_1_n_0, D => lbl0_d_direction_1(0), E => lbl0_n_329, Q => direction_1(0));
  lbl0_reg_dir_1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_dir_1_n_0, D => lbl0_d_direction_1(1), E => lbl0_n_329, Q => direction_1(1));
  lbl0_reg_dir_1_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_dir_1_n_0);
  lbl0_reg_p_state_0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_p_state_0_n_0, D => lbl0_n_322, E => lbl0_n_361, Q => player_state_0(0));
  lbl0_reg_p_state_0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_p_state_0_n_0, D => lbl0_n_325, E => lbl0_n_361, Q => player_state_0(1));
  lbl0_reg_p_state_0_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_p_state_0_n_0);
  lbl0_reg_wall_0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_0_n_1, D => lbl0_d_wallshape_0_0_4141, E => lbl0_n_363, Q => lbl0_wallshape_0(0));
  lbl0_reg_wall_0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_0_n_1, D => lbl0_d_wallshape_0_1_4142, E => lbl0_n_363, Q => lbl0_wallshape_0(1));
  lbl0_reg_wall_0_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_0_n_1, D => lbl0_d_wallshape_0_2_4143, E => lbl0_n_363, Q => lbl0_wallshape_0(2));
  lbl0_reg_wall_0_g14 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_wall_0_n_1);
  lbl0_reg_next_pos0_q_reg_7 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(7), E => lbl0_n_386, Q => lbl0_next_position_0(7));
  lbl0_reg_next_pos0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(1), E => lbl0_n_386, Q => lbl0_next_position_0(1));
  lbl0_reg_next_pos0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(0), E => lbl0_n_386, Q => lbl0_next_position_0(0));
  lbl0_reg_next_pos0_q_reg_8 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(8), E => lbl0_n_386, Q => lbl0_next_position_0(8));
  lbl0_reg_next_pos0_q_reg_9 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(9), E => lbl0_n_386, Q => lbl0_next_position_0(9));
  lbl0_reg_next_pos0_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(2), E => lbl0_n_386, Q => lbl0_next_position_0(2));
  lbl0_reg_next_pos0_q_reg_10 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(10), E => lbl0_n_386, Q => lbl0_next_position_0(10));
  lbl0_reg_next_pos0_q_reg_3 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(3), E => lbl0_n_386, Q => lbl0_next_position_0(3));
  lbl0_reg_next_pos0_q_reg_4 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(4), E => lbl0_n_386, Q => lbl0_next_position_0(4));
  lbl0_reg_next_pos0_q_reg_5 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(5), E => lbl0_n_386, Q => lbl0_next_position_0(5));
  lbl0_reg_next_pos0_q_reg_6 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos0_n_1, D => lbl0_d_next_position_0(6), E => lbl0_n_386, Q => lbl0_next_position_0(6));
  lbl0_reg_next_pos0_g38 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_next_pos0_n_1);
  lbl0_reg_p_state_1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_p_state_1_n_0, D => lbl0_n_321, E => lbl0_n_360, Q => player_state_1(0));
  lbl0_reg_p_state_1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_p_state_1_n_0, D => lbl0_n_324, E => lbl0_n_360, Q => player_state_1(1));
  lbl0_reg_p_state_1_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_p_state_1_n_0);
  lbl0_reg_wall_1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_1_n_1, D => lbl0_d_wallshape_1_0_4144, E => lbl0_n_362, Q => lbl0_wallshape_1(0));
  lbl0_reg_wall_1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_1_n_1, D => lbl0_d_wallshape_1_1_4145, E => lbl0_n_362, Q => lbl0_wallshape_1(1));
  lbl0_reg_wall_1_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_wall_1_n_1, D => lbl0_d_wallshape_1_2_4146, E => lbl0_n_362, Q => lbl0_wallshape_1(2));
  lbl0_reg_wall_1_g14 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_wall_1_n_1);
  lbl0_reg_next_pos1_q_reg_7 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(7), E => lbl0_n_386, Q => lbl0_next_position_1(7));
  lbl0_reg_next_pos1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(1), E => lbl0_n_386, Q => lbl0_next_position_1(1));
  lbl0_reg_next_pos1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(0), E => lbl0_n_386, Q => lbl0_next_position_1(0));
  lbl0_reg_next_pos1_q_reg_8 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(8), E => lbl0_n_386, Q => lbl0_next_position_1(8));
  lbl0_reg_next_pos1_q_reg_9 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(9), E => lbl0_n_386, Q => lbl0_next_position_1(9));
  lbl0_reg_next_pos1_q_reg_2 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(2), E => lbl0_n_386, Q => lbl0_next_position_1(2));
  lbl0_reg_next_pos1_q_reg_10 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(10), E => lbl0_n_386, Q => lbl0_next_position_1(10));
  lbl0_reg_next_pos1_q_reg_3 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(3), E => lbl0_n_386, Q => lbl0_next_position_1(3));
  lbl0_reg_next_pos1_q_reg_4 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(4), E => lbl0_n_386, Q => lbl0_next_position_1(4));
  lbl0_reg_next_pos1_q_reg_5 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(5), E => lbl0_n_386, Q => lbl0_next_position_1(5));
  lbl0_reg_next_pos1_q_reg_6 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_next_pos1_n_1, D => lbl0_d_next_position_1(6), E => lbl0_n_386, Q => lbl0_next_position_1(6));
  lbl0_reg_next_pos1_g38 : INVD1BWP7T port map(I => rst, ZN => lbl0_reg_next_pos1_n_1);
  lbl0_reg_n_dir_0_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_n_dir_0_n_0, D => lbl0_d_next_direction_0(0), E => lbl0_n_387, Q => lbl0_n_397);
  lbl0_reg_n_dir_0_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_n_dir_0_n_0, D => lbl0_d_next_direction_0(1), E => lbl0_n_387, Q => lbl0_n_396);
  lbl0_reg_n_dir_0_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_n_dir_0_n_0);
  lbl0_reg_n_dir_1_q_reg_0 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_n_dir_1_n_0, D => lbl0_d_next_direction_1(0), E => lbl0_n_387, Q => lbl0_n_393);
  lbl0_reg_n_dir_1_q_reg_1 : EDFKCNQD1BWP7T port map(CP => clk, CN => lbl0_reg_n_dir_1_n_0, D => lbl0_d_next_direction_1(1), E => lbl0_n_387, Q => lbl0_n_392);
  lbl0_reg_n_dir_1_g11 : INVD0BWP7T port map(I => rst, ZN => lbl0_reg_n_dir_1_n_0);
  lbl1_g14 : INVD1BWP7T port map(I => memory_ready, ZN => lbl1_n_1);
  lbl1_g19 : AN2D1BWP7T port map(A1 => lbl1_ready_rw, A2 => lbl1_ready_clr, Z => memory_ready);
  lbl1_g23 : OR3D1BWP7T port map(A1 => lbl1_x_incr3, A2 => lbl1_x_incr2, A3 => lbl1_x_incr1, Z => x_increment_out);
  lbl1_g24 : OR3D1BWP7T port map(A1 => lbl1_y_incr3, A2 => lbl1_y_incr2, A3 => lbl1_y_incr1, Z => y_increment_out);
  lbl1_g25 : AN2D4BWP7T port map(A1 => lbl1_we_clr, A2 => lbl1_we_rw, Z => write_enable_out);
  lbl1_g13 : OR2D4BWP7T port map(A1 => lbl1_me_rw, A2 => lbl1_me_clr, Z => memory_enable_out);
  lbl1_g27 : OR4D4BWP7T port map(A1 => rst, A2 => lbl1_clr_rst, A3 => lbl1_rw_rst, A4 => reset_vga_mem, Z => memory_reset_out);
  lbl1_cy_count_reg_4 : DFCNQD1BWP7T port map(CDN => lbl1_cy_n_1, CP => y_increment_out, D => lbl1_cy_n_8, Q => lbl1_cur_y(4));
  lbl1_cy_g82 : MOAI22D0BWP7T port map(A1 => lbl1_cy_n_6, A2 => lbl1_cur_y(4), B1 => lbl1_cy_n_6, B2 => lbl1_cur_y(4), ZN => lbl1_cy_n_8);
  lbl1_cy_count_reg_3 : DFCNQD1BWP7T port map(CDN => lbl1_cy_n_1, CP => y_increment_out, D => lbl1_cy_n_7, Q => lbl1_cur_y(3));
  lbl1_cy_g84 : MOAI22D0BWP7T port map(A1 => lbl1_cy_n_4, A2 => lbl1_cur_y(3), B1 => lbl1_cy_n_4, B2 => lbl1_cur_y(3), ZN => lbl1_cy_n_7);
  lbl1_cy_count_reg_2 : DFCNQD1BWP7T port map(CDN => lbl1_cy_n_1, CP => y_increment_out, D => lbl1_cy_n_5, Q => lbl1_cur_y(2));
  lbl1_cy_g86 : IND2D0BWP7T port map(A1 => lbl1_cy_n_4, B1 => lbl1_cur_y(3), ZN => lbl1_cy_n_6);
  lbl1_cy_g87 : MOAI22D0BWP7T port map(A1 => lbl1_cy_n_3, A2 => lbl1_cur_y(2), B1 => lbl1_cy_n_3, B2 => lbl1_cur_y(2), ZN => lbl1_cy_n_5);
  lbl1_cy_g89 : IND2D0BWP7T port map(A1 => lbl1_cy_n_3, B1 => lbl1_cur_y(2), ZN => lbl1_cy_n_4);
  lbl1_cy_g91 : ND2D0BWP7T port map(A1 => lbl1_cur_y(0), A2 => lbl1_cur_y(1), ZN => lbl1_cy_n_3);
  lbl1_cy_g93 : INVD0BWP7T port map(I => memory_reset_out, ZN => lbl1_cy_n_1);
  lbl1_cy_count_reg_1 : EDFCND1BWP7T port map(CDN => lbl1_cy_n_1, CP => y_increment_out, D => lbl1_cy_n_2, E => lbl1_cur_y(0), Q => lbl1_cur_y(1), QN => lbl1_cy_n_2);
  lbl1_cy_count_reg_0 : DFCND1BWP7T port map(CDN => lbl1_cy_n_1, CP => y_increment_out, D => lbl1_cy_n_0, Q => lbl1_cur_y(0), QN => lbl1_cy_n_0);
  lbl1_cm_g542 : AO221D0BWP7T port map(A1 => lbl1_cm_n_36, A2 => lbl1_cm_n_27, B1 => lbl1_cm_n_28, B2 => lbl1_cm_state(3), C => lbl1_x_incr3, Z => lbl1_we_clr);
  lbl1_cm_g543 : AO31D1BWP7T port map(A1 => lbl1_cm_n_27, A2 => lbl1_cm_n_26, A3 => lbl1_cm_state(0), B => lbl1_cm_state(4), Z => lbl1_clr_rst);
  lbl1_cm_g544 : INR4D0BWP7T port map(A1 => lbl1_cm_n_27, B1 => lbl1_cm_state(1), B2 => lbl1_cm_state(0), B3 => lbl1_cm_state(4), ZN => lbl1_ready_clr);
  lbl1_cm_g545 : AN2D0BWP7T port map(A1 => lbl1_x_incr3, A2 => lbl1_cm_state(1), Z => lbl1_y_incr3);
  lbl1_cm_g546 : CKND1BWP7T port map(I => lbl1_cm_n_36, ZN => lbl1_cm_n_28);
  lbl1_cm_g547 : NR2XD0BWP7T port map(A1 => lbl1_cm_n_26, A2 => lbl1_cm_state(2), ZN => lbl1_me_clr);
  lbl1_cm_g548 : ND2D1BWP7T port map(A1 => lbl1_cm_state(0), A2 => lbl1_cm_state(1), ZN => lbl1_cm_n_36);
  lbl1_cm_g549 : IND2D1BWP7T port map(A1 => lbl1_cm_state(3), B1 => lbl1_cm_state(0), ZN => lbl1_cm_n_31);
  lbl1_cm_g550 : CKAN2D1BWP7T port map(A1 => lbl1_cm_state(2), A2 => lbl1_cm_state(3), Z => lbl1_x_incr3);
  lbl1_cm_g551 : NR2XD0BWP7T port map(A1 => lbl1_cm_state(2), A2 => lbl1_cm_state(3), ZN => lbl1_cm_n_27);
  lbl1_cm_state_reg_2 : DFQD1BWP7T port map(CP => clk, D => lbl1_cm_n_24, Q => lbl1_cm_state(2));
  lbl1_cm_state_reg_3 : DFQD1BWP7T port map(CP => clk, D => lbl1_cm_n_25, Q => lbl1_cm_state(3));
  lbl1_cm_g907 : OAI211D1BWP7T port map(A1 => lbl1_cm_n_36, A2 => lbl1_cm_n_16, B => lbl1_cm_n_22, C => lbl1_cm_n_18, ZN => lbl1_cm_n_25);
  lbl1_cm_g908 : ND2D1BWP7T port map(A1 => lbl1_cm_n_23, A2 => lbl1_cm_n_18, ZN => lbl1_cm_n_24);
  lbl1_cm_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => lbl1_cm_n_21, Q => lbl1_cm_state(0));
  lbl1_cm_g910 : AOI21D0BWP7T port map(A1 => lbl1_cm_n_14, A2 => lbl1_cm_state(2), B => lbl1_cm_n_20, ZN => lbl1_cm_n_23);
  lbl1_cm_g911 : OAI21D0BWP7T port map(A1 => lbl1_cm_n_14, A2 => lbl1_cm_n_17, B => lbl1_cm_state(3), ZN => lbl1_cm_n_22);
  lbl1_cm_g913 : OAI22D0BWP7T port map(A1 => lbl1_cm_n_15, A2 => lbl1_cm_state(4), B1 => lbl1_cm_n_6, B2 => rst, ZN => lbl1_cm_n_21);
  lbl1_cm_g914 : OAI32D1BWP7T port map(A1 => lbl1_cm_state(2), A2 => lbl1_cm_n_36, A3 => lbl1_cm_n_11, B1 => lbl1_cm_state(1), B2 => lbl1_cm_n_16, ZN => lbl1_cm_n_20);
  lbl1_cm_state_reg_4 : DFKCNQD1BWP7T port map(CP => clk, CN => lbl1_cm_n_12, D => lbl1_cm_n_9, Q => lbl1_cm_state(4));
  lbl1_cm_g916 : OAI22D0BWP7T port map(A1 => lbl1_cm_n_13, A2 => lbl1_cm_n_8, B1 => lbl1_cm_n_11, B2 => lbl1_cm_n_4, ZN => lbl1_cm_n_19);
  lbl1_cm_g917 : NR2D0BWP7T port map(A1 => lbl1_cm_n_11, A2 => lbl1_cm_state(2), ZN => lbl1_cm_n_17);
  lbl1_cm_g918 : IND2D1BWP7T port map(A1 => lbl1_cm_n_12, B1 => lbl1_cm_n_9, ZN => lbl1_cm_n_18);
  lbl1_cm_g919 : INVD0BWP7T port map(I => lbl1_cm_n_14, ZN => lbl1_cm_n_15);
  lbl1_cm_g920 : IND3D1BWP7T port map(A1 => lbl1_cm_state(3), B1 => lbl1_cm_state(2), B2 => lbl1_cm_n_10, ZN => lbl1_cm_n_16);
  lbl1_cm_g921 : NR2D1BWP7T port map(A1 => lbl1_cm_n_11, A2 => lbl1_cm_state(0), ZN => lbl1_cm_n_14);
  lbl1_cm_g922 : ND2D0BWP7T port map(A1 => lbl1_cm_n_9, A2 => lbl1_cm_n_7, ZN => lbl1_cm_n_13);
  lbl1_cm_g923 : INVD1BWP7T port map(I => lbl1_cm_n_10, ZN => lbl1_cm_n_11);
  lbl1_cm_g924 : NR2D0BWP7T port map(A1 => lbl1_cm_n_7, A2 => lbl1_cm_n_8, ZN => lbl1_cm_n_12);
  lbl1_cm_g925 : NR3D0BWP7T port map(A1 => lbl1_ready_clr, A2 => lbl1_cm_n_5, A3 => rst, ZN => lbl1_cm_n_10);
  lbl1_cm_g926 : INR2XD0BWP7T port map(A1 => lbl1_cm_n_5, B1 => rst, ZN => lbl1_cm_n_9);
  lbl1_cm_g927 : IND4D0BWP7T port map(A1 => lbl1_cm_n_3, B1 => lbl1_cur_x(0), B2 => lbl1_cur_x(3), B3 => lbl1_cur_x(4), ZN => lbl1_cm_n_8);
  lbl1_cm_g928 : IND4D0BWP7T port map(A1 => lbl1_cm_n_2, B1 => lbl1_cur_y(0), B2 => lbl1_cur_y(3), B3 => lbl1_cur_y(4), ZN => lbl1_cm_n_7);
  lbl1_cm_g929 : IND3D1BWP7T port map(A1 => lbl1_n_1, B1 => lbl1_ready_clr, B2 => clear_memory, ZN => lbl1_cm_n_6);
  lbl1_cm_g930 : MUX2ND0BWP7T port map(I0 => lbl1_cm_state(0), I1 => lbl1_cm_n_31, S => lbl1_cm_state(1), ZN => lbl1_cm_n_4);
  lbl1_cm_g931 : INR3D0BWP7T port map(A1 => lbl1_cm_state(3), B1 => lbl1_cm_state(2), B2 => lbl1_cm_n_36, ZN => lbl1_cm_n_5);
  lbl1_cm_g932 : ND2D0BWP7T port map(A1 => lbl1_cur_x(1), A2 => lbl1_cur_x(2), ZN => lbl1_cm_n_3);
  lbl1_cm_g933 : ND2D0BWP7T port map(A1 => lbl1_cur_y(1), A2 => lbl1_cur_y(2), ZN => lbl1_cm_n_2);
  lbl1_cm_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl1_cm_n_19, Q => lbl1_cm_state(1), QN => lbl1_cm_n_26);
  lbl1_cex_g177 : OR2D1BWP7T port map(A1 => lbl1_cex_n_9, A2 => lbl1_cex_n_8, Z => lbl1_x_incr2);
  lbl1_cex_g178 : INR2D1BWP7T port map(A1 => lbl1_cex_state(1), B1 => lbl1_cex_state(0), ZN => lbl1_cex_n_8);
  lbl1_cex_g179 : INR2D1BWP7T port map(A1 => lbl1_cex_state(0), B1 => lbl1_cex_state(1), ZN => lbl1_cex_n_9);
  lbl1_cex_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => lbl1_cex_n_7, Q => lbl1_cex_state(0));
  lbl1_cex_g169 : NR2XD0BWP7T port map(A1 => lbl1_cex_n_6, A2 => rst, ZN => lbl1_cex_n_7);
  lbl1_cex_g171 : AOI21D0BWP7T port map(A1 => x_increment, A2 => lbl1_cex_n_4, B => lbl1_cex_n_8, ZN => lbl1_cex_n_6);
  lbl1_cex_g172 : NR2XD0BWP7T port map(A1 => lbl1_cex_n_3, A2 => rst, ZN => lbl1_cex_n_5);
  lbl1_cex_g173 : AOI21D0BWP7T port map(A1 => lbl1_n_1, A2 => lbl1_cex_n_2, B => lbl1_cex_n_9, ZN => lbl1_cex_n_4);
  lbl1_cex_g174 : AOI21D0BWP7T port map(A1 => x_increment, A2 => lbl1_cex_state(0), B => lbl1_x_incr2, ZN => lbl1_cex_n_3);
  lbl1_cex_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl1_cex_n_5, Q => lbl1_cex_state(1), QN => lbl1_cex_n_2);
  lbl1_rw_g1269 : AN2D1BWP7T port map(A1 => lbl1_rw_n_76, A2 => lbl1_rw_n_84, Z => lbl1_ready_rw);
  lbl1_rw_g1270 : CKAN2D1BWP7T port map(A1 => lbl1_rw_n_76, A2 => lbl1_rw_state(0), Z => lbl1_rw_rst);
  lbl1_rw_g1271 : OAI21D0BWP7T port map(A1 => lbl1_rw_n_75, A2 => lbl1_rw_n_94, B => lbl1_rw_n_81, ZN => lbl1_me_rw);
  lbl1_rw_g1272 : OAI221D0BWP7T port map(A1 => lbl1_rw_n_77, A2 => lbl1_rw_n_71, B1 => lbl1_rw_n_82, B2 => lbl1_rw_n_78, C => lbl1_rw_n_74, ZN => lbl1_y_incr1);
  lbl1_rw_g1273 : NR4D0BWP7T port map(A1 => lbl1_rw_n_71, A2 => lbl1_rw_state(4), A3 => lbl1_rw_state(5), A4 => lbl1_rw_state(3), ZN => lbl1_rw_n_76);
  lbl1_rw_g1274 : OAI221D0BWP7T port map(A1 => lbl1_rw_n_93, A2 => lbl1_rw_state(4), B1 => lbl1_rw_state(1), B2 => lbl1_rw_n_77, C => lbl1_rw_n_74, ZN => lbl1_x_incr1);
  lbl1_rw_g1275 : MOAI22D0BWP7T port map(A1 => lbl1_rw_n_73, A2 => lbl1_rw_n_84, B1 => lbl1_rw_n_94, B2 => lbl1_rw_n_81, ZN => lbl1_we_rw);
  lbl1_rw_g1276 : OAI21D0BWP7T port map(A1 => lbl1_rw_n_77, A2 => lbl1_rw_n_72, B => lbl1_rw_n_74, ZN => w_increment_out);
  lbl1_rw_g1277 : IAO21D0BWP7T port map(A1 => lbl1_rw_n_93, A2 => lbl1_rw_n_84, B => lbl1_rw_n_91, ZN => lbl1_rw_n_75);
  lbl1_rw_g1278 : NR2XD0BWP7T port map(A1 => lbl1_rw_n_80, A2 => lbl1_rw_n_82, ZN => lbl1_rw_n_91);
  lbl1_rw_g1279 : AN2D0BWP7T port map(A1 => lbl1_rw_n_93, A2 => lbl1_rw_n_81, Z => lbl1_rw_n_73);
  lbl1_rw_g1280 : IND2D1BWP7T port map(A1 => lbl1_rw_n_79, B1 => lbl1_rw_n_72, ZN => lbl1_rw_n_74);
  lbl1_rw_g1281 : INVD0BWP7T port map(I => lbl1_rw_n_72, ZN => lbl1_rw_n_71);
  lbl1_rw_g1282 : NR2XD0BWP7T port map(A1 => lbl1_rw_state(2), A2 => lbl1_rw_state(1), ZN => lbl1_rw_n_72);
  lbl1_rw_g1283 : IND2D1BWP7T port map(A1 => lbl1_rw_state(4), B1 => lbl1_rw_state(3), ZN => lbl1_rw_n_77);
  lbl1_rw_g1284 : ND2D1BWP7T port map(A1 => lbl1_rw_n_82, A2 => lbl1_rw_state(2), ZN => lbl1_rw_n_93);
  lbl1_rw_g1285 : ND2D1BWP7T port map(A1 => lbl1_rw_n_84, A2 => lbl1_rw_state(2), ZN => lbl1_rw_n_80);
  lbl1_rw_g1286 : IND2D1BWP7T port map(A1 => lbl1_rw_state(4), B1 => lbl1_rw_state(2), ZN => lbl1_rw_n_78);
  lbl1_rw_g1287 : CKND2D1BWP7T port map(A1 => lbl1_rw_n_83, A2 => lbl1_rw_state(4), ZN => lbl1_rw_n_79);
  lbl1_rw_g1288 : ND2D1BWP7T port map(A1 => lbl1_rw_state(4), A2 => lbl1_rw_state(3), ZN => lbl1_rw_n_94);
  lbl1_rw_state_reg_2 : DFQD1BWP7T port map(CP => clk, D => lbl1_rw_n_69, Q => lbl1_rw_state(2));
  lbl1_rw_state_reg_4 : DFQD1BWP7T port map(CP => clk, D => lbl1_rw_n_66, Q => lbl1_rw_state(4));
  lbl1_rw_g2167 : ND2D1BWP7T port map(A1 => lbl1_rw_n_67, A2 => lbl1_rw_n_52, ZN => lbl1_rw_n_70);
  lbl1_rw_g2169 : OR4D1BWP7T port map(A1 => lbl1_rw_n_56, A2 => lbl1_rw_n_62, A3 => lbl1_rw_n_57, A4 => lbl1_rw_n_59, Z => lbl1_rw_n_69);
  lbl1_rw_g2170 : ND3D0BWP7T port map(A1 => lbl1_rw_n_64, A2 => lbl1_rw_n_53, A3 => lbl1_rw_n_42, ZN => lbl1_rw_n_68);
  lbl1_rw_g2172 : AOI211XD0BWP7T port map(A1 => lbl1_rw_n_56, A2 => lbl1_rw_n_33, B => lbl1_rw_n_60, C => lbl1_rw_n_54, ZN => lbl1_rw_n_67);
  lbl1_rw_g2173 : IND4D0BWP7T port map(A1 => lbl1_rw_n_61, B1 => lbl1_rw_n_63, B2 => lbl1_rw_n_37, B3 => lbl1_rw_n_49, ZN => lbl1_rw_n_66);
  lbl1_rw_g2174 : OAI221D0BWP7T port map(A1 => lbl1_rw_n_40, A2 => lbl1_rw_n_3, B1 => rst, B2 => lbl1_rw_n_17, C => lbl1_rw_n_63, ZN => lbl1_rw_n_65);
  lbl1_rw_g2175 : OA31D1BWP7T port map(A1 => lbl1_rw_state(1), A2 => lbl1_rw_state(5), A3 => lbl1_rw_n_44, B => lbl1_rw_n_58, Z => lbl1_rw_n_64);
  lbl1_rw_g2176 : OAI221D0BWP7T port map(A1 => lbl1_rw_n_42, A2 => lbl1_rw_n_29, B1 => lbl1_rw_n_28, B2 => lbl1_rw_n_41, C => lbl1_rw_n_39, ZN => lbl1_rw_n_62);
  lbl1_rw_g2177 : IAO21D0BWP7T port map(A1 => lbl1_rw_n_42, A2 => lbl1_rw_n_28, B => lbl1_rw_n_57, ZN => lbl1_rw_n_63);
  lbl1_rw_g2179 : OAI22D0BWP7T port map(A1 => lbl1_rw_n_51, A2 => lbl1_rw_n_32, B1 => lbl1_rw_n_46, B2 => lbl1_rw_n_94, ZN => lbl1_rw_n_61);
  lbl1_rw_g2180 : OAI22D0BWP7T port map(A1 => lbl1_rw_n_51, A2 => lbl1_rw_n_33, B1 => lbl1_rw_n_50, B2 => lbl1_rw_n_94, ZN => lbl1_rw_n_60);
  lbl1_rw_g2181 : OAI32D1BWP7T port map(A1 => lbl1_rw_state(2), A2 => lbl1_rw_n_2, A3 => lbl1_rw_n_46, B1 => lbl1_rw_n_78, B2 => lbl1_rw_n_40, ZN => lbl1_rw_n_59);
  lbl1_rw_g2182 : MAOI22D0BWP7T port map(A1 => lbl1_rw_n_45, A2 => lbl1_rw_n_2, B1 => lbl1_rw_n_52, B2 => lbl1_rw_n_32, ZN => lbl1_rw_n_58);
  lbl1_rw_g2183 : NR2D1BWP7T port map(A1 => lbl1_rw_n_52, A2 => lbl1_rw_n_33, ZN => lbl1_rw_n_57);
  lbl1_rw_g2184 : IOA21D1BWP7T port map(A1 => lbl1_rw_n_47, A2 => lbl1_rw_n_29, B => lbl1_rw_n_53, ZN => lbl1_rw_n_56);
  lbl1_rw_g2185 : OAI21D0BWP7T port map(A1 => lbl1_rw_n_40, A2 => lbl1_rw_n_81, B => lbl1_rw_n_38, ZN => lbl1_rw_n_55);
  lbl1_rw_g2186 : OAI22D0BWP7T port map(A1 => lbl1_rw_n_41, A2 => lbl1_rw_n_29, B1 => lbl1_rw_n_40, B2 => lbl1_rw_n_77, ZN => lbl1_rw_n_54);
  lbl1_rw_g2187 : ND2D1BWP7T port map(A1 => lbl1_rw_n_48, A2 => lbl1_rw_n_28, ZN => lbl1_rw_n_53);
  lbl1_rw_g2188 : ND2D1BWP7T port map(A1 => lbl1_rw_n_48, A2 => lbl1_rw_n_29, ZN => lbl1_rw_n_52);
  lbl1_rw_g2189 : AOI21D0BWP7T port map(A1 => lbl1_rw_n_36, A2 => lbl1_rw_n_93, B => lbl1_rw_n_43, ZN => lbl1_rw_n_50);
  lbl1_rw_g2190 : AO21D0BWP7T port map(A1 => lbl1_rw_n_78, A2 => lbl1_rw_n_83, B => lbl1_rw_n_44, Z => lbl1_rw_n_49);
  lbl1_rw_g2191 : ND2D1BWP7T port map(A1 => lbl1_rw_n_47, A2 => lbl1_rw_n_28, ZN => lbl1_rw_n_51);
  lbl1_rw_g2192 : INVD1BWP7T port map(I => lbl1_rw_n_45, ZN => lbl1_rw_n_46);
  lbl1_rw_g2193 : INVD0BWP7T port map(I => lbl1_rw_n_43, ZN => lbl1_rw_n_44);
  lbl1_rw_g2194 : NR2D1BWP7T port map(A1 => lbl1_rw_n_35, A2 => lbl1_rw_n_31, ZN => lbl1_rw_n_48);
  lbl1_rw_g2195 : NR2D1BWP7T port map(A1 => lbl1_rw_n_35, A2 => lbl1_rw_n_30, ZN => lbl1_rw_n_47);
  lbl1_rw_g2196 : INR2XD0BWP7T port map(A1 => lbl1_rw_n_36, B1 => lbl1_rw_n_82, ZN => lbl1_rw_n_45);
  lbl1_rw_g2197 : INR2D1BWP7T port map(A1 => lbl1_rw_n_36, B1 => lbl1_rw_n_84, ZN => lbl1_rw_n_43);
  lbl1_rw_g2198 : ND2D1BWP7T port map(A1 => lbl1_rw_n_34, A2 => lbl1_rw_n_30, ZN => lbl1_rw_n_42);
  lbl1_rw_g2199 : OAI21D0BWP7T port map(A1 => lbl1_rw_n_23, A2 => lbl1_rw_n_91, B => lbl1_rw_n_36, ZN => lbl1_rw_n_39);
  lbl1_rw_g2200 : ND3D0BWP7T port map(A1 => lbl1_rw_n_36, A2 => lbl1_rw_n_3, A3 => lbl1_rw_n_84, ZN => lbl1_rw_n_38);
  lbl1_rw_g2201 : OAI21D0BWP7T port map(A1 => lbl1_rw_n_20, A2 => lbl1_rw_n_22, B => lbl1_rw_n_36, ZN => lbl1_rw_n_37);
  lbl1_rw_g2202 : CKND2D1BWP7T port map(A1 => lbl1_rw_n_34, A2 => lbl1_rw_n_31, ZN => lbl1_rw_n_41);
  lbl1_rw_g2203 : IND2D1BWP7T port map(A1 => lbl1_rw_state(0), B1 => lbl1_rw_n_36, ZN => lbl1_rw_n_40);
  lbl1_rw_g2204 : NR3D0BWP7T port map(A1 => lbl1_ready_rw, A2 => lbl1_rw_n_27, A3 => rst, ZN => lbl1_rw_n_36);
  lbl1_rw_g2205 : IND3D1BWP7T port map(A1 => rst, B1 => write_enable, B2 => lbl1_rw_n_27, ZN => lbl1_rw_n_35);
  lbl1_rw_g2206 : INR3D0BWP7T port map(A1 => lbl1_rw_n_27, B1 => rst, B2 => write_enable, ZN => lbl1_rw_n_34);
  lbl1_rw_g2207 : CKND1BWP7T port map(I => lbl1_rw_n_33, ZN => lbl1_rw_n_32);
  lbl1_rw_g2208 : ND4D0BWP7T port map(A1 => lbl1_rw_n_24, A2 => lbl1_rw_n_19, A3 => lbl1_rw_n_18, A4 => lbl1_rw_n_13, ZN => lbl1_rw_n_33);
  lbl1_rw_g2209 : INVD0BWP7T port map(I => lbl1_rw_n_31, ZN => lbl1_rw_n_30);
  lbl1_rw_g2210 : INVD1BWP7T port map(I => lbl1_rw_n_29, ZN => lbl1_rw_n_28);
  lbl1_rw_g2211 : ND4D0BWP7T port map(A1 => lbl1_rw_n_26, A2 => lbl1_rw_n_12, A3 => lbl1_rw_n_9, A4 => lbl1_rw_n_8, ZN => lbl1_rw_n_31);
  lbl1_rw_g2212 : NR4D0BWP7T port map(A1 => lbl1_rw_n_25, A2 => lbl1_rw_n_14, A3 => lbl1_rw_n_15, A4 => lbl1_rw_n_16, ZN => lbl1_rw_n_29);
  lbl1_rw_g2213 : NR4D0BWP7T port map(A1 => lbl1_rw_n_4, A2 => lbl1_rw_n_84, A3 => lbl1_rw_state(2), A4 => lbl1_rw_state(4), ZN => lbl1_rw_n_27);
  lbl1_rw_g2214 : NR2XD0BWP7T port map(A1 => lbl1_rw_n_10, A2 => lbl1_rw_n_11, ZN => lbl1_rw_n_26);
  lbl1_rw_g2215 : ND2D1BWP7T port map(A1 => lbl1_rw_n_21, A2 => lbl1_rw_n_5, ZN => lbl1_rw_n_25);
  lbl1_rw_g2216 : NR2XD0BWP7T port map(A1 => lbl1_rw_n_7, A2 => lbl1_rw_n_6, ZN => lbl1_rw_n_24);
  lbl1_rw_g2217 : AOI21D0BWP7T port map(A1 => lbl1_rw_n_79, A2 => lbl1_rw_n_2, B => lbl1_rw_n_93, ZN => lbl1_rw_n_23);
  lbl1_rw_g2218 : AOI21D0BWP7T port map(A1 => lbl1_rw_n_94, A2 => lbl1_rw_n_2, B => lbl1_rw_state(2), ZN => lbl1_rw_n_22);
  lbl1_rw_g2219 : XNR2D1BWP7T port map(A1 => address(9), A2 => lbl1_cur_y(4), ZN => lbl1_rw_n_21);
  lbl1_rw_g2220 : AOI21D0BWP7T port map(A1 => lbl1_rw_n_80, A2 => lbl1_rw_state(1), B => lbl1_rw_n_79, ZN => lbl1_rw_n_20);
  lbl1_rw_g2221 : NR4D0BWP7T port map(A1 => lbl1_cur_w(7), A2 => lbl1_cur_w(6), A3 => lbl1_cur_w(5), A4 => lbl1_cur_w(4), ZN => lbl1_rw_n_19);
  lbl1_rw_g2222 : XNR2D1BWP7T port map(A1 => write_memory(0), A2 => lbl1_cur_w(0), ZN => lbl1_rw_n_18);
  lbl1_rw_g2223 : IND3D1BWP7T port map(A1 => lbl1_n_1, B1 => lbl1_ready_rw, B2 => go_to, ZN => lbl1_rw_n_17);
  lbl1_rw_g2224 : CKXOR2D1BWP7T port map(A1 => address(6), A2 => lbl1_cur_y(1), Z => lbl1_rw_n_16);
  lbl1_rw_g2225 : CKXOR2D1BWP7T port map(A1 => address(5), A2 => lbl1_cur_y(0), Z => lbl1_rw_n_15);
  lbl1_rw_g2226 : CKXOR2D1BWP7T port map(A1 => address(8), A2 => lbl1_cur_y(3), Z => lbl1_rw_n_14);
  lbl1_rw_g2227 : XNR2D1BWP7T port map(A1 => write_memory(2), A2 => lbl1_cur_w(2), ZN => lbl1_rw_n_13);
  lbl1_rw_g2228 : XNR2D1BWP7T port map(A1 => address(2), A2 => lbl1_cur_x(2), ZN => lbl1_rw_n_12);
  lbl1_rw_g2229 : CKXOR2D1BWP7T port map(A1 => address(1), A2 => lbl1_cur_x(1), Z => lbl1_rw_n_11);
  lbl1_rw_g2230 : CKXOR2D1BWP7T port map(A1 => address(0), A2 => lbl1_cur_x(0), Z => lbl1_rw_n_10);
  lbl1_rw_g2231 : XNR2D1BWP7T port map(A1 => address(4), A2 => lbl1_cur_x(4), ZN => lbl1_rw_n_9);
  lbl1_rw_g2232 : XNR2D1BWP7T port map(A1 => address(3), A2 => lbl1_cur_x(3), ZN => lbl1_rw_n_8);
  lbl1_rw_g2233 : CKXOR2D1BWP7T port map(A1 => write_memory(3), A2 => lbl1_cur_w(3), Z => lbl1_rw_n_7);
  lbl1_rw_g2234 : CKXOR2D1BWP7T port map(A1 => write_memory(1), A2 => lbl1_cur_w(1), Z => lbl1_rw_n_6);
  lbl1_rw_g2235 : XNR2D1BWP7T port map(A1 => address(7), A2 => lbl1_cur_y(2), ZN => lbl1_rw_n_5);
  lbl1_rw_g2236 : OR2D1BWP7T port map(A1 => lbl1_rw_n_82, A2 => lbl1_rw_state(3), Z => lbl1_rw_n_4);
  lbl1_rw_g2237 : NR2XD0BWP7T port map(A1 => lbl1_rw_n_94, A2 => lbl1_rw_n_93, ZN => lbl1_rw_n_3);
  lbl1_rw_g2238 : CKND2D1BWP7T port map(A1 => lbl1_rw_state(0), A2 => lbl1_rw_state(4), ZN => lbl1_rw_n_2);
  lbl1_rw_state_reg_3 : DFD1BWP7T port map(CP => clk, D => lbl1_rw_n_70, Q => lbl1_rw_state(3), QN => lbl1_rw_n_83);
  lbl1_rw_state_reg_5 : DFD1BWP7T port map(CP => clk, D => lbl1_rw_n_55, Q => lbl1_rw_state(5), QN => lbl1_rw_n_81);
  lbl1_rw_state_reg_0 : DFD1BWP7T port map(CP => clk, D => lbl1_rw_n_65, Q => lbl1_rw_state(0), QN => lbl1_rw_n_84);
  lbl1_rw_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl1_rw_n_68, Q => lbl1_rw_state(1), QN => lbl1_rw_n_82);
  lbl1_cey_g177 : OR2D1BWP7T port map(A1 => lbl1_cey_n_9, A2 => lbl1_cey_n_8, Z => lbl1_y_incr2);
  lbl1_cey_g178 : INR2D1BWP7T port map(A1 => lbl1_cey_state(1), B1 => lbl1_cey_state(0), ZN => lbl1_cey_n_8);
  lbl1_cey_g179 : INR2D1BWP7T port map(A1 => lbl1_cey_state(0), B1 => lbl1_cey_state(1), ZN => lbl1_cey_n_9);
  lbl1_cey_state_reg_0 : DFQD1BWP7T port map(CP => clk, D => lbl1_cey_n_7, Q => lbl1_cey_state(0));
  lbl1_cey_g169 : NR2XD0BWP7T port map(A1 => lbl1_cey_n_6, A2 => rst, ZN => lbl1_cey_n_7);
  lbl1_cey_g171 : AOI21D0BWP7T port map(A1 => y_increment, A2 => lbl1_cey_n_4, B => lbl1_cey_n_8, ZN => lbl1_cey_n_6);
  lbl1_cey_g172 : NR2XD0BWP7T port map(A1 => lbl1_cey_n_3, A2 => rst, ZN => lbl1_cey_n_5);
  lbl1_cey_g173 : AOI21D0BWP7T port map(A1 => lbl1_n_1, A2 => lbl1_cey_n_2, B => lbl1_cey_n_9, ZN => lbl1_cey_n_4);
  lbl1_cey_g174 : AOI21D0BWP7T port map(A1 => y_increment, A2 => lbl1_cey_state(0), B => lbl1_y_incr2, ZN => lbl1_cey_n_3);
  lbl1_cey_state_reg_1 : DFD1BWP7T port map(CP => clk, D => lbl1_cey_n_5, Q => lbl1_cey_state(1), QN => lbl1_cey_n_2);
  lbl1_cw_count_reg_7 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_14, Q => lbl1_cur_w(7));
  lbl1_cw_g134 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_12, A2 => lbl1_cur_w(7), B1 => lbl1_cw_n_12, B2 => lbl1_cur_w(7), ZN => lbl1_cw_n_14);
  lbl1_cw_count_reg_6 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_13, Q => lbl1_cur_w(6));
  lbl1_cw_g136 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_10, A2 => lbl1_cur_w(6), B1 => lbl1_cw_n_10, B2 => lbl1_cur_w(6), ZN => lbl1_cw_n_13);
  lbl1_cw_count_reg_5 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_11, Q => lbl1_cur_w(5));
  lbl1_cw_g138 : IND2D0BWP7T port map(A1 => lbl1_cw_n_10, B1 => lbl1_cur_w(6), ZN => lbl1_cw_n_12);
  lbl1_cw_g139 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_8, A2 => lbl1_cur_w(5), B1 => lbl1_cw_n_8, B2 => lbl1_cur_w(5), ZN => lbl1_cw_n_11);
  lbl1_cw_count_reg_4 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_9, Q => lbl1_cur_w(4));
  lbl1_cw_g141 : IND2D0BWP7T port map(A1 => lbl1_cw_n_8, B1 => lbl1_cur_w(5), ZN => lbl1_cw_n_10);
  lbl1_cw_g142 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_6, A2 => lbl1_cur_w(4), B1 => lbl1_cw_n_6, B2 => lbl1_cur_w(4), ZN => lbl1_cw_n_9);
  lbl1_cw_count_reg_3 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_7, Q => lbl1_cur_w(3));
  lbl1_cw_g144 : IND2D0BWP7T port map(A1 => lbl1_cw_n_6, B1 => lbl1_cur_w(4), ZN => lbl1_cw_n_8);
  lbl1_cw_g145 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_4, A2 => lbl1_cur_w(3), B1 => lbl1_cw_n_4, B2 => lbl1_cur_w(3), ZN => lbl1_cw_n_7);
  lbl1_cw_count_reg_2 : DFCNQD1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_5, Q => lbl1_cur_w(2));
  lbl1_cw_g147 : IND2D0BWP7T port map(A1 => lbl1_cw_n_4, B1 => lbl1_cur_w(3), ZN => lbl1_cw_n_6);
  lbl1_cw_g148 : MOAI22D0BWP7T port map(A1 => lbl1_cw_n_3, A2 => lbl1_cur_w(2), B1 => lbl1_cw_n_3, B2 => lbl1_cur_w(2), ZN => lbl1_cw_n_5);
  lbl1_cw_g150 : IND2D0BWP7T port map(A1 => lbl1_cw_n_3, B1 => lbl1_cur_w(2), ZN => lbl1_cw_n_4);
  lbl1_cw_g152 : ND2D0BWP7T port map(A1 => lbl1_cur_w(0), A2 => lbl1_cur_w(1), ZN => lbl1_cw_n_3);
  lbl1_cw_g154 : INVD0BWP7T port map(I => memory_reset_out, ZN => lbl1_cw_n_1);
  lbl1_cw_count_reg_0 : DFCND1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_2, Q => lbl1_cur_w(0), QN => lbl1_cw_n_2);
  lbl1_cw_count_reg_1 : EDFCND1BWP7T port map(CDN => lbl1_cw_n_1, CP => w_increment_out, D => lbl1_cw_n_0, E => lbl1_cur_w(0), Q => lbl1_cur_w(1), QN => lbl1_cw_n_0);
  lbl1_cx_count_reg_4 : DFCNQD1BWP7T port map(CDN => lbl1_cx_n_1, CP => x_increment_out, D => lbl1_cx_n_8, Q => lbl1_cur_x(4));
  lbl1_cx_g82 : MOAI22D0BWP7T port map(A1 => lbl1_cx_n_6, A2 => lbl1_cur_x(4), B1 => lbl1_cx_n_6, B2 => lbl1_cur_x(4), ZN => lbl1_cx_n_8);
  lbl1_cx_count_reg_3 : DFCNQD1BWP7T port map(CDN => lbl1_cx_n_1, CP => x_increment_out, D => lbl1_cx_n_7, Q => lbl1_cur_x(3));
  lbl1_cx_g84 : MOAI22D0BWP7T port map(A1 => lbl1_cx_n_4, A2 => lbl1_cur_x(3), B1 => lbl1_cx_n_4, B2 => lbl1_cur_x(3), ZN => lbl1_cx_n_7);
  lbl1_cx_count_reg_2 : DFCNQD1BWP7T port map(CDN => lbl1_cx_n_1, CP => x_increment_out, D => lbl1_cx_n_5, Q => lbl1_cur_x(2));
  lbl1_cx_g86 : IND2D0BWP7T port map(A1 => lbl1_cx_n_4, B1 => lbl1_cur_x(3), ZN => lbl1_cx_n_6);
  lbl1_cx_g87 : MOAI22D0BWP7T port map(A1 => lbl1_cx_n_3, A2 => lbl1_cur_x(2), B1 => lbl1_cx_n_3, B2 => lbl1_cur_x(2), ZN => lbl1_cx_n_5);
  lbl1_cx_g89 : IND2D0BWP7T port map(A1 => lbl1_cx_n_3, B1 => lbl1_cur_x(2), ZN => lbl1_cx_n_4);
  lbl1_cx_g91 : ND2D0BWP7T port map(A1 => lbl1_cur_x(0), A2 => lbl1_cur_x(1), ZN => lbl1_cx_n_3);
  lbl1_cx_g93 : INVD0BWP7T port map(I => memory_reset_out, ZN => lbl1_cx_n_1);
  lbl1_cx_count_reg_1 : EDFCND1BWP7T port map(CDN => lbl1_cx_n_1, CP => x_increment_out, D => lbl1_cx_n_2, E => lbl1_cur_x(0), Q => lbl1_cur_x(1), QN => lbl1_cx_n_2);
  lbl1_cx_count_reg_0 : DFCND1BWP7T port map(CDN => lbl1_cx_n_1, CP => x_increment_out, D => lbl1_cx_n_0, Q => lbl1_cur_x(0), QN => lbl1_cx_n_0);

end synthesised;
