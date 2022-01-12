configuration electron_structural_cfg of electron is
   for structural
      for all: game_engine use configuration work.game_engine_behaviour_cfg;
      end for;
      for all: memory_cntrll use configuration work.memory_cntrll_behaviour_cfg;
      end for;
      for all: graphics_top use configuration work.graphics_top_behaviour_cfg;
      end for;
   end for;
end electron_structural_cfg;
