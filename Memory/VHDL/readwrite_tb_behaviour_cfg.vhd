configuration readwrite_tb_behaviour_cfg of readwrite_tb is
   for behaviour
      for all: readwrite use configuration work.readwrite_behaviour_cfg;
      end for;
   end for;
end readwrite_tb_behaviour_cfg;
