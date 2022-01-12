configuration game_engine_behaviour_cfg of game_engine is
   for behaviour
      for all: ge_register use configuration work.ge_register_structural_cfg;
      end for;
      for all: busy_counter use configuration work.busy_counter_behaviour_cfg;
      end for;
      for all: memory_communication use configuration work.memory_communication_behaviour_cfg;
      end for;
   end for;
end game_engine_behaviour_cfg;
