configuration ge_register_structural_cfg of ge_register is
   for structural
      for all: reg_10 use configuration work.reg_10_behaviour_cfg;
      end for;
      for all: reg_1 use configuration work.reg_1_behaviour_cfg;
      end for;
      for all: reg_2 use configuration work.reg_2_behaviour_cfg;
      end for;
      for all: reg_8 use configuration work.reg_8_behaviour_cfg;
      end for;
   end for;
end ge_register_structural_cfg;
