onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /project_b/i_CLK
add wave -noupdate /project_b/i_RST
add wave -noupdate /project_b/wb_reg_dest
add wave -noupdate /project_b/wb_instruction
add wave -noupdate /project_b/wb_pc_plus_4
add wave -noupdate /project_b/mem_alu_out
add wave -noupdate -group pc_reg /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst10/CLK
add wave -noupdate -group pc_reg /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst10/reset
add wave -noupdate -group pc_reg /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst10/stall
add wave -noupdate -group pc_reg /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst10/i_next_PC
add wave -noupdate -group pc_reg /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst10/o_PC
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/address
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/byteena
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/clock
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/data
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/wren
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/q
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/data_mask
add wave -noupdate -expand -group imem /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst2/write_data
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/CLK
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/id_flush
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/id_stall
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/ifid_reset
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/if_instruction
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/id_instruction
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/if_pc_plus_4
add wave -noupdate -group if_id /project_b/b2v_inst6/b2v_inst11/b2v_inst3/b2v_inst9/id_pc_plus_4
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_CLK
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_jump
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_branch
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_ex_rs_sel
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_ex_rt_sel
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_id_rs_sel
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_id_rt_sel
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_ex_write_reg_sel
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/i_ex_mem_write
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/o_if_id_flush
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/o_id_ex_flush
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/o_if_id_stall
add wave -noupdate -group hdu /project_b/b2v_inst6/b2v_inst12/o_pc_stall
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/CLK
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/rs_sel
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/rt_sel
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/w_data
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/w_sel
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/w_en
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/reset
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/rs_data
add wave -noupdate -expand -group REG /project_b/b2v_inst6/b2v_inst4/rt_data
add wave -noupdate -expand -group REG -expand /project_b/b2v_inst6/b2v_inst4/registers
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/CLK
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_flush
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_stall
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/idex_reset
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_instruction
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_instruction
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_pc_plus_4
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_pc_plus_4
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_reg_dest
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_branch
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_mem_to_reg
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_ALU_op
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_mem_write
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_ALU_src
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_reg_write
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_reg_dest
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_branch
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_mem_to_reg
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_ALU_op
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_mem_write
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_ALU_src
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_reg_write
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_rs_data
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_rt_data
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_rs_data
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_rt_data
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_rs_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_rt_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_rd_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_rs_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_rt_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_rd_sel
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/id_extended_immediate
add wave -noupdate -group id_ex /project_b/b2v_inst6/b2v_id_ex_inst/ex_extended_immediate
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/i_sel
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/ALU_OP
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/ex_rs_data
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/ex_rt_data
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/i_A_sel
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/i_B_sel
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/imm
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/mem_alu_out_a
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/mem_alu_out_b
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/shamt
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/wb_rs_data
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/wb_rt_data
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/zero
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/ALU_out
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/SYNTHESIZED_WIRE_0
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/SYNTHESIZED_WIRE_1
add wave -noupdate -expand -group alu /project_b/b2v_inst6/b2v_inst5/SYNTHESIZED_WIRE_2
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_CLK
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_wb_reg_write
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_ex_reg_write
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_ex_rs_sel
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_ex_rt_sel
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_wb_write_reg_sel
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/i_ex_write_reg_sel
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/o_forward_a
add wave -noupdate -expand -group fu /project_b/b2v_inst6/b2v_inst6/o_forward_b
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/CLK
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_flush
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_stall
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/exmem_reset
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_instruction
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_instruction
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_pc_plus_4
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_pc_plus_4
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_reg_dest
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_mem_to_reg
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_mem_write
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_reg_write
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_reg_dest
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_mem_to_reg
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_mem_write
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_reg_write
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_ALU_out
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_ALU_out
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_rt_data
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_rt_data
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/ex_write_reg_sel
add wave -noupdate -group ex_mem /project_b/b2v_inst6/b2v_inst14/mem_write_reg_sel
add wave -noupdate -group dmem /project_b/b2v_inst/address
add wave -noupdate -group dmem /project_b/b2v_inst/byteena
add wave -noupdate -group dmem /project_b/b2v_inst/clock
add wave -noupdate -group dmem /project_b/b2v_inst/data
add wave -noupdate -group dmem /project_b/b2v_inst/wren
add wave -noupdate -group dmem /project_b/b2v_inst/q
add wave -noupdate -group dmem /project_b/b2v_inst/data_mask
add wave -noupdate -group dmem /project_b/b2v_inst/write_data
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1116 ns} 0}
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
WaveRestoreZoom {910 ns} {1637 ns}
