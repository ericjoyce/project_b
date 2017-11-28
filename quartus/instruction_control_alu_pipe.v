// Copyright (C) 2016  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Standard Edition"
// CREATED		"Mon Nov 27 23:07:20 2017"

module instruction_control_alu_pipe(
	i_CLK,
	i_RST,
	w_en,
	i_w_data,
	w_sel,
	mem_reg_dest,
	mem_mem_to_reg,
	mem_mem_write,
	mem_reg_write,
	alu_zero,
	ex_branch,
	mem_ALU_out,
	mem_instruction,
	mem_pc_plus_4,
	mem_rt_data,
	mem_write_reg_sel
);


input wire	i_CLK;
input wire	i_RST;
input wire	w_en;
input wire	[31:0] i_w_data;
input wire	[4:0] w_sel;
output wire	mem_reg_dest;
output wire	mem_mem_to_reg;
output wire	mem_mem_write;
output wire	mem_reg_write;
output wire	alu_zero;
output wire	ex_branch;
output wire	[31:0] mem_ALU_out;
output wire	[31:0] mem_instruction;
output wire	[31:0] mem_pc_plus_4;
output wire	[31:0] mem_rt_data;
output wire	[4:0] mem_write_reg_sel;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_80;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_81;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	[3:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_82;
wire	[4:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_83;
wire	[4:0] SYNTHESIZED_WIRE_84;
wire	[31:0] SYNTHESIZED_WIRE_85;
wire	[4:0] SYNTHESIZED_WIRE_86;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_87;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[31:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_88;
wire	SYNTHESIZED_WIRE_89;
wire	SYNTHESIZED_WIRE_90;
wire	[4:0] SYNTHESIZED_WIRE_91;
wire	[4:0] SYNTHESIZED_WIRE_92;
wire	[4:0] SYNTHESIZED_WIRE_93;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_94;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	[31:0] SYNTHESIZED_WIRE_44;
wire	[31:0] SYNTHESIZED_WIRE_45;
wire	[31:0] SYNTHESIZED_WIRE_46;
wire	[31:0] SYNTHESIZED_WIRE_95;
wire	[4:0] SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_56;
wire	[3:0] SYNTHESIZED_WIRE_57;
wire	[31:0] SYNTHESIZED_WIRE_58;
wire	[1:0] SYNTHESIZED_WIRE_60;
wire	[1:0] SYNTHESIZED_WIRE_61;
wire	[31:0] SYNTHESIZED_WIRE_62;
wire	[4:0] SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	[4:0] SYNTHESIZED_WIRE_71;
wire	[31:0] SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_76;
wire	[31:0] SYNTHESIZED_WIRE_78;
wire	[31:0] SYNTHESIZED_WIRE_79;

assign	mem_reg_write = SYNTHESIZED_WIRE_66;
assign	mem_ALU_out = SYNTHESIZED_WIRE_87;
assign	mem_write_reg_sel = SYNTHESIZED_WIRE_71;
assign	SYNTHESIZED_WIRE_80 = 0;




id_ex	b2v_id_ex_inst(
	.CLK(i_CLK),
	.ex_flush(SYNTHESIZED_WIRE_0),
	.ex_stall(SYNTHESIZED_WIRE_80),
	.idex_reset(i_RST),
	.id_reg_dest(SYNTHESIZED_WIRE_2),
	.id_branch(SYNTHESIZED_WIRE_81),
	.id_mem_to_reg(SYNTHESIZED_WIRE_4),
	.id_mem_write(SYNTHESIZED_WIRE_5),
	.id_ALU_src(SYNTHESIZED_WIRE_6),
	.id_reg_write(SYNTHESIZED_WIRE_7),
	.id_ALU_op(SYNTHESIZED_WIRE_8),
	.id_extended_immediate(SYNTHESIZED_WIRE_9),
	.id_instruction(SYNTHESIZED_WIRE_10),
	.id_pc_plus_4(SYNTHESIZED_WIRE_82),
	.id_rd_sel(SYNTHESIZED_WIRE_12),
	.id_rs_data(SYNTHESIZED_WIRE_83),
	.id_rs_sel(SYNTHESIZED_WIRE_84),
	.id_rt_data(SYNTHESIZED_WIRE_85),
	.id_rt_sel(SYNTHESIZED_WIRE_86),
	.ex_reg_dest(SYNTHESIZED_WIRE_94),
	.ex_branch(ex_branch),
	.ex_mem_to_reg(SYNTHESIZED_WIRE_90),
	.ex_mem_write(SYNTHESIZED_WIRE_42),
	.ex_ALU_src(SYNTHESIZED_WIRE_56),
	.ex_reg_write(SYNTHESIZED_WIRE_43),
	.ex_ALU_op(SYNTHESIZED_WIRE_57),
	.ex_extended_immediate(SYNTHESIZED_WIRE_62),
	.ex_instruction(SYNTHESIZED_WIRE_45),
	.ex_pc_plus_4(SYNTHESIZED_WIRE_46),
	.ex_rd_sel(SYNTHESIZED_WIRE_53),
	.ex_rs_data(SYNTHESIZED_WIRE_58),
	.ex_rs_sel(SYNTHESIZED_WIRE_91),
	.ex_rt_data(SYNTHESIZED_WIRE_95),
	.ex_rt_sel(SYNTHESIZED_WIRE_92));



comparator	b2v_inst1(
	.i_CLK(i_CLK),
	.i_rs(SYNTHESIZED_WIRE_17),
	.i_rt(SYNTHESIZED_WIRE_18),
	.o_r(SYNTHESIZED_WIRE_76));


mux21_32bit	b2v_inst10(
	.i_sel(SYNTHESIZED_WIRE_19),
	.i_0(SYNTHESIZED_WIRE_83),
	.i_1(SYNTHESIZED_WIRE_87),
	.o_mux(SYNTHESIZED_WIRE_17));


instruction_control_pipe	b2v_inst11(
	.i_CLK(i_CLK),
	.i_RST(i_RST),
	.pc_mux_sel(SYNTHESIZED_WIRE_22),
	.pc_reg_stall(SYNTHESIZED_WIRE_23),
	.id_flush(SYNTHESIZED_WIRE_24),
	.id_stall(SYNTHESIZED_WIRE_25),
	.i_next_PC(SYNTHESIZED_WIRE_26),
	.o_reg_dest(SYNTHESIZED_WIRE_2),
	.o_jump(SYNTHESIZED_WIRE_88),
	.o_branch(SYNTHESIZED_WIRE_81),
	.o_mem_to_reg(SYNTHESIZED_WIRE_4),
	.o_mem_write(SYNTHESIZED_WIRE_5),
	.o_ALU_src(SYNTHESIZED_WIRE_6),
	.o_reg_write(SYNTHESIZED_WIRE_7),
	.immidiate(SYNTHESIZED_WIRE_9),
	.o_add_alu_result(SYNTHESIZED_WIRE_74),
	.o_ALU_op(SYNTHESIZED_WIRE_8),
	.o_instruction(SYNTHESIZED_WIRE_10),
	.o_jump_address(SYNTHESIZED_WIRE_79),
	.o_pc4(SYNTHESIZED_WIRE_82),
	.o_shamt(SYNTHESIZED_WIRE_65),
	.rd_sel(SYNTHESIZED_WIRE_12),
	.rs_sel(SYNTHESIZED_WIRE_84),
	.rt_sel(SYNTHESIZED_WIRE_86));


hdu	b2v_inst12(
	.i_CLK(i_CLK),
	.i_jump(SYNTHESIZED_WIRE_88),
	.i_branch(SYNTHESIZED_WIRE_89),
	.i_ex_mem_write(SYNTHESIZED_WIRE_90),
	.i_ex_rs_sel(SYNTHESIZED_WIRE_91),
	.i_ex_rt_sel(SYNTHESIZED_WIRE_92),
	.i_ex_write_reg_sel(SYNTHESIZED_WIRE_93),
	.i_id_rs_sel(SYNTHESIZED_WIRE_84),
	.i_id_rt_sel(SYNTHESIZED_WIRE_86),
	.o_if_id_flush(SYNTHESIZED_WIRE_24),
	.o_id_ex_flush(SYNTHESIZED_WIRE_0),
	.o_if_id_stall(SYNTHESIZED_WIRE_25),
	.o_pc_stall(SYNTHESIZED_WIRE_23));


mux21_32bit	b2v_inst13(
	.i_sel(SYNTHESIZED_WIRE_35),
	.i_0(SYNTHESIZED_WIRE_85),
	.i_1(SYNTHESIZED_WIRE_87),
	.o_mux(SYNTHESIZED_WIRE_18));


ex_mem	b2v_inst14(
	.CLK(i_CLK),
	.mem_flush(SYNTHESIZED_WIRE_80),
	.mem_stall(SYNTHESIZED_WIRE_80),
	.exmem_reset(i_RST),
	.ex_reg_dest(SYNTHESIZED_WIRE_94),
	.ex_mem_to_reg(SYNTHESIZED_WIRE_90),
	.ex_mem_write(SYNTHESIZED_WIRE_42),
	.ex_reg_write(SYNTHESIZED_WIRE_43),
	.ex_ALU_out(SYNTHESIZED_WIRE_44),
	.ex_instruction(SYNTHESIZED_WIRE_45),
	.ex_pc_plus_4(SYNTHESIZED_WIRE_46),
	.ex_rt_data(SYNTHESIZED_WIRE_95),
	.ex_write_reg_sel(SYNTHESIZED_WIRE_93),
	.mem_reg_dest(mem_reg_dest),
	.mem_mem_to_reg(mem_mem_to_reg),
	.mem_mem_write(mem_mem_write),
	.mem_reg_write(SYNTHESIZED_WIRE_66),
	.mem_ALU_out(SYNTHESIZED_WIRE_87),
	.mem_instruction(mem_instruction),
	.mem_pc_plus_4(mem_pc_plus_4),
	.mem_rt_data(mem_rt_data),
	.mem_write_reg_sel(SYNTHESIZED_WIRE_71));

assign	SYNTHESIZED_WIRE_22 = SYNTHESIZED_WIRE_89 | SYNTHESIZED_WIRE_88;


mux21_5bit	b2v_inst2(
	.i_sel(SYNTHESIZED_WIRE_94),
	.i_0(SYNTHESIZED_WIRE_92),
	.i_1(SYNTHESIZED_WIRE_53),
	.o_mux(SYNTHESIZED_WIRE_93));


register_file	b2v_inst4(
	.CLK(i_CLK),
	.w_en(w_en),
	.reset(i_RST),
	.rs_sel(SYNTHESIZED_WIRE_84),
	.rt_sel(SYNTHESIZED_WIRE_86),
	.w_data(i_w_data),
	.w_sel(w_sel),
	.rs_data(SYNTHESIZED_WIRE_83),
	.rt_data(SYNTHESIZED_WIRE_85));


FU_ALU	b2v_inst5(
	.i_sel(SYNTHESIZED_WIRE_56),
	.ALU_OP(SYNTHESIZED_WIRE_57),
	.ex_rs_data(SYNTHESIZED_WIRE_58),
	.ex_rt_data(SYNTHESIZED_WIRE_95),
	.i_A_sel(SYNTHESIZED_WIRE_60),
	.i_B_sel(SYNTHESIZED_WIRE_61),
	.imm(SYNTHESIZED_WIRE_62),
	.mem_alu_out_a(SYNTHESIZED_WIRE_87),
	.mem_alu_out_b(SYNTHESIZED_WIRE_87),
	.shamt(SYNTHESIZED_WIRE_65),
	.wb_rs_data(i_w_data),
	.wb_rt_data(i_w_data),
	.zero(alu_zero),
	.ALU_out(SYNTHESIZED_WIRE_44));


fu	b2v_inst6(
	.i_CLK(i_CLK),
	.i_wb_reg_write(w_en),
	.i_mem_reg_write(SYNTHESIZED_WIRE_66),
	.i_ex_rs_sel(SYNTHESIZED_WIRE_91),
	.i_ex_rt_sel(SYNTHESIZED_WIRE_92),
	.i_id_rs_sel(SYNTHESIZED_WIRE_84),
	.i_id_rt_sel(SYNTHESIZED_WIRE_86),
	.i_mem_write_reg_sel(SYNTHESIZED_WIRE_71),
	.i_wb_write_reg_sel(w_sel),
	.o_forward_comp_rs(SYNTHESIZED_WIRE_19),
	.o_forward_comp_rt(SYNTHESIZED_WIRE_35),
	.o_forward_a(SYNTHESIZED_WIRE_60),
	.o_forward_b(SYNTHESIZED_WIRE_61));


mux21_32bit	b2v_inst7(
	.i_sel(SYNTHESIZED_WIRE_89),
	.i_0(SYNTHESIZED_WIRE_82),
	.i_1(SYNTHESIZED_WIRE_74),
	.o_mux(SYNTHESIZED_WIRE_78));

assign	SYNTHESIZED_WIRE_89 = SYNTHESIZED_WIRE_81 & SYNTHESIZED_WIRE_76;


mux21_32bit	b2v_inst9(
	.i_sel(SYNTHESIZED_WIRE_88),
	.i_0(SYNTHESIZED_WIRE_78),
	.i_1(SYNTHESIZED_WIRE_79),
	.o_mux(SYNTHESIZED_WIRE_26));


endmodule
