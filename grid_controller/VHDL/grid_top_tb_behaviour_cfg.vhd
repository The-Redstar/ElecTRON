configuration grid_top_tb_behaviour_cfg of grid_top_tb is
   for behaviour
      for all: grid_top use configuration work.grid_top_behaviour_cfg;
      end for;
   end for;
end grid_top_tb_behaviour_cfg;
