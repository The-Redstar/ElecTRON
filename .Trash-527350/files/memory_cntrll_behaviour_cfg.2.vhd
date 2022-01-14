configuration memory_cntrll_behaviour_cfg of memory_cntrll is
   for behaviour
      for all: readwrite use configuration work.readwrite_behaviour_cfg;
      end for;
      for all: counter5b use configuration work.counter5b_behaviour_cfg;
      end for;
      for all: counter8b use configuration work.counter8b_behaviour_cfg;
      end for;
      for all: countextend use configuration work.countextend_behaviour_cfg;
      end for;
      for all: memclear use configuration work.memclear_behaviour_cfg;
      end for;
   end for;
end memory_cntrll_behaviour_cfg;
