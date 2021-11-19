configuration wall_decoder_tb_behaviour_cfg of wall_decoder_tb is
   for behaviour
      for all: wall_decoder use configuration work.wall_decoder_behaviour_cfg;
      end for;
   end for;
end wall_decoder_tb_behaviour_cfg;
