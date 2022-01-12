configuration input_buffer_tb_behaviour_cfg of input_buffer_tb is
   for behaviour
      for all: input_buffer use configuration work.input_buffer_behaviour_cfg;
      end for;
   end for;
end input_buffer_tb_behaviour_cfg;
