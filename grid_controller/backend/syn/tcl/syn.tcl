set_db lib_search_path /data/designkit/tsmc-180nm/lib/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/
set_db init_hdl_search_path ../../../VHDL/
set_db library {tcb018gbwp7twc.lib}
set_db use_scan_seqs_for_non_dft false

include ../tcl/read_hdl.tcl

elaborate grid_top_behaviour_cfg

include ../in/grid_top.sdc

synthesize -to_mapped
#set_db syn_generic_effort medium
#syn_generic
#syn_map

ungroup -all -flat
insert_tiehilo_cells
write_hdl -mapped > ../out/grid_top.v
write_sdf > ../out/grid_top.sdf
write_sdc > ../out/grid_top.sdc

report timing
report gates

gui_show
