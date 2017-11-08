onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /project_b/i_CLK
add wave -noupdate /project_b/i_RST
add wave -noupdate /project_b/wb_reg_dest
add wave -noupdate /project_b/ex_rt_sel
add wave -noupdate /project_b/wb_instruction
add wave -noupdate /project_b/wb_pc_plus_4
add wave -noupdate /project_b/mem_alu_out
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_0
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_1
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_2
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_3
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_4
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_5
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_6
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_16
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_11
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_12
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_13
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_14
add wave -noupdate -group synth /project_b/SYNTHESIZED_WIRE_15
add wave -noupdate -expand -group dmem /project_b/b2v_inst/address
add wave -noupdate -expand -group dmem /project_b/b2v_inst/byteena
add wave -noupdate -expand -group dmem /project_b/b2v_inst/clock
add wave -noupdate -expand -group dmem /project_b/b2v_inst/data
add wave -noupdate -expand -group dmem /project_b/b2v_inst/wren
add wave -noupdate -expand -group dmem /project_b/b2v_inst/q
add wave -noupdate -expand -group dmem /project_b/b2v_inst/data_mask
add wave -noupdate -expand -group dmem /project_b/b2v_inst/write_data
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(10)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(9)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(8)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(7)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(6)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(5)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(4)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(3)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(2)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(1)
add wave -noupdate -group dmem_data /project_b/b2v_inst/mem(0)
add wave -noupdate -group mem_wb /project_b/b2v_inst7/CLK
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_flush
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_stall
add wave -noupdate -group mem_wb /project_b/b2v_inst7/memwb_reset
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_instruction
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_instruction
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_pc_plus_4
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_pc_plus_4
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_reg_dest
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_mem_to_reg
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_reg_write
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_reg_dest
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_mem_to_reg
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_reg_write
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_ALU_out
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_ALU_out
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_dmem_out
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_dmem_out
add wave -noupdate -group mem_wb /project_b/b2v_inst7/mem_write_reg_sel
add wave -noupdate -group mem_wb /project_b/b2v_inst7/wb_write_reg_sel
add wave -noupdate -group important /project_b/b2v_inst/address
add wave -noupdate -group important /project_b/b2v_inst/data
add wave -noupdate -group important /project_b/b2v_inst/write_data
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/CLK
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/rs_sel
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/rt_sel
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/w_data
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/w_sel
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/w_en
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/reset
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/rs_data
add wave -noupdate -expand -group reg /project_b/b2v_inst2/b2v_inst4/rt_data
add wave -noupdate -expand -group reg -expand /project_b/b2v_inst2/b2v_inst4/registers
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/ALU_OP
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/shamt
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/i_A
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/i_B
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/zero
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/ALU_out
add wave -noupdate -group alu /project_b/b2v_inst2/b2v_inst3/s_temp
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/address
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/byteena
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/clock
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/data
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/wren
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/q
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/data_mask
add wave -noupdate -group imem /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst2/write_data
add wave -noupdate -group pc /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst10/CLK
add wave -noupdate -group pc /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst10/reset
add wave -noupdate -group pc /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst10/stall
add wave -noupdate -group pc /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst10/i_next_PC
add wave -noupdate -group pc /project_b/b2v_inst2/b2v_inst13/b2v_inst1/b2v_inst10/o_PC
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2122 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 380
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {1850 ns} {2577 ns}
