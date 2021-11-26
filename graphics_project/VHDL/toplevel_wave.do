onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /graphics_top_tb/clk
add wave -noupdate /graphics_top_tb/reset
add wave -noupdate /graphics_top_tb/h_sync
add wave -noupdate /graphics_top_tb/v_sync
add wave -noupdate /graphics_top_tb/color
add wave -noupdate /graphics_top_tb/x_incr
add wave -noupdate /graphics_top_tb/y_incr
add wave -noupdate /graphics_top_tb/mem_rst
add wave -noupdate /graphics_top_tb/busy
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /graphics_top_tb/test/h_count
add wave -noupdate -radix unsigned /graphics_top_tb/test/v_count
add wave -noupdate -radix unsigned /graphics_top_tb/test/dx
add wave -noupdate -radix unsigned /graphics_top_tb/test/dy
add wave -noupdate -radix unsigned /graphics_top_tb/test/x
add wave -noupdate -radix unsigned /graphics_top_tb/test/y
add wave -noupdate -radix binary /graphics_top_tb/test/data_synced
add wave -noupdate -radix binary /graphics_top_tb/test/borders_synced
add wave -noupdate -radix binary /graphics_top_tb/test/jumps_synced
add wave -noupdate -divider {New Divider}
add wave -noupdate /graphics_top_tb/game_state
add wave -noupdate -radix binary /graphics_top_tb/data
add wave -noupdate -radix binary /graphics_top_tb/borders
add wave -noupdate -radix binary /graphics_top_tb/jumps
add wave -noupdate -radix unsigned /graphics_top_tb/player0_pos
add wave -noupdate -radix binary /graphics_top_tb/player0_dir
add wave -noupdate /graphics_top_tb/player0_state
add wave -noupdate -radix unsigned /graphics_top_tb/player1_pos
add wave -noupdate -radix binary /graphics_top_tb/player1_dir
add wave -noupdate /graphics_top_tb/player1_state
add wave -noupdate /graphics_top_tb/x
add wave -noupdate /graphics_top_tb/y
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {616147 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1759207 ps}
