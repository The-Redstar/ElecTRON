configuration input_buffer_behaviour_cfg of input_buffer is
   for behaviour
      for all: flip_flop use configuration work.flip_flop_behaviour_cfg;
      end for;
   end for;
end input_buffer_behaviour_cfg;
