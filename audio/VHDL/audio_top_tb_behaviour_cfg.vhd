configuration audio_top_tb_behaviour_cfg of audio_top_tb is
   for behaviour
      for all: audio_top use configuration work.audio_top_behaviour_cfg;
      end for;
   end for;
end audio_top_tb_behaviour_cfg;
