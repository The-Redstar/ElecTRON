configuration audio_top_behaviour_cfg of audio_top is
   for behaviour
      for all: engine_oscil use configuration work.engine_oscil_behaviour_cfg;
      end for;
      for all: rng use configuration work.rng_behaviour_cfg;
      end for;
   end for;
end audio_top_behaviour_cfg;
