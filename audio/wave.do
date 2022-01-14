onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /audio_top_tb/clk
add wave -noupdate /audio_top_tb/reset
add wave -noupdate -radix binary /audio_top_tb/game_state
add wave -noupdate /audio_top_tb/beep_clk
add wave -noupdate /audio_top_tb/button
add wave -noupdate -radix binary /audio_top_tb/player0_dir
add wave -noupdate -radix binary /audio_top_tb/player1_dir
add wave -noupdate /audio_top_tb/player0_boost
add wave -noupdate /audio_top_tb/player1_boost
add wave -noupdate -expand /audio_top_tb/wave
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {425477623570 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 149
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {883131350612 ps}
