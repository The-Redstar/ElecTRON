configuration graphics_top_behaviour_cfg of graphics_top is
   for behaviour
      for all: wall_decoder use configuration work.wall_decoder_behaviour_cfg;
      end for;
      for all: pixelator use configuration work.pixelator_behaviour_cfg;
      end for;
	  for all: sidebar use configuration work.sidebar_behaviour_cfg;
      end for;
	  for all: homescreen use configuration work.homescreen_behaviour_cfg;
      end for;
   end for;
end graphics_top_behaviour_cfg;
