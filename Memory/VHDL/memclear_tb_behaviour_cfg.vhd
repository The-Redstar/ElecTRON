configuration memclear_tb_behaviour_cfg of memclear_tb is
   for behaviour
      for all: memclear use configuration work.memclear_behaviour_cfg;
      end for;
   end for;
end memclear_tb_behaviour_cfg;
