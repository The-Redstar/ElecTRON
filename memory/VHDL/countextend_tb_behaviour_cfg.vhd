configuration countextend_tb_behaviour_cfg of countextend_tb is
   for behaviour
      for all: countextend use configuration work.countextend_behaviour_cfg;
      end for;
   end for;
end countextend_tb_behaviour_cfg;
