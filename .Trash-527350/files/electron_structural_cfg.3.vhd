configuration electron_structural_cfg of electron is
   for structural
      for all: game_engine use configuration work.game_engine_behaviour_cfg;
      end for;
      for all: memory_cntrll use configuration work.memory_cntrll_behaviour_cfg;
      end for;
      for all: graphics_top use configuration work.graphics_top_behaviour_cfg;
      end for;
      for all: input_buffer use configuration work.input_buffer_behaviour_cfg;
      end for;
      for all: grid_top use configuration work.grid_top_behaviour_cfg;
      end for;
      for all: audio_top use configuration work.audio_top_behaviour_cfg;
      end for;
   end for;
end electron_structural_cfg;
