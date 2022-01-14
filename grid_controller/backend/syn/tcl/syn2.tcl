#*********************************************************
# synthesize script for cell: grid_top
# company: ontwerp_practicum
# designer: mhpadriaanse
#*********************************************************
set_db lib_search_path /data/designkit/tsmc-180nm/lib/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcb018gbwp7t_270a/
set_db init_hdl_search_path ../../../VHDL/
set_db library {tcb018gbwp7twc.lib}
set_db use_scan_seqs_for_non_dft false

#include backend/syn/tcl/read_hdl.tcl
read_hdl -vhdl {grid_top.vhd}
read_hdl -vhdl {grid_top-behaviour.vhd}
read_hdl -vhdl {grid_top_behaviour_cfg.vhd}
#endincl

elaborate grid_top_behaviour_cfg

#include backend/syn/in/grid_top.sdc
# but use 33 MHz as constraint to be more sure it works.
dc::set_driving_cell -cell INVD0BWP7T [dc::all_inputs]
dc::set_load 1 [dc::all_outputs]
#endincl

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


