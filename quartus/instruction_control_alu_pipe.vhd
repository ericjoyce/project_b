-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.1.0 Build 196 10/24/2016 SJ Standard Edition"
-- CREATED		"Wed Nov 15 14:22:59 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY instruction_control_alu_pipe IS 
	PORT
	(
		i_CLK :  IN  STD_LOGIC;
		i_RST :  IN  STD_LOGIC;
		w_en :  IN  STD_LOGIC;
		i_w_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		w_sel :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		mem_reg_dest :  OUT  STD_LOGIC;
		mem_mem_to_reg :  OUT  STD_LOGIC;
		mem_mem_write :  OUT  STD_LOGIC;
		mem_reg_write :  OUT  STD_LOGIC;
		alu_zero :  OUT  STD_LOGIC;
		ex_branch :  OUT  STD_LOGIC;
		mem_ALU_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mem_instruction :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mem_pc_plus_4 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mem_rt_data :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mem_write_reg_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END instruction_control_alu_pipe;

ARCHITECTURE bdf_type OF instruction_control_alu_pipe IS 

COMPONENT id_ex
	PORT(CLK : IN STD_LOGIC;
		 ex_flush : IN STD_LOGIC;
		 ex_stall : IN STD_LOGIC;
		 idex_reset : IN STD_LOGIC;
		 id_reg_dest : IN STD_LOGIC;
		 id_branch : IN STD_LOGIC;
		 id_mem_to_reg : IN STD_LOGIC;
		 id_mem_write : IN STD_LOGIC;
		 id_ALU_src : IN STD_LOGIC;
		 id_reg_write : IN STD_LOGIC;
		 id_ALU_op : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 id_extended_immediate : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_pc_plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_rd_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 id_rs_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 id_rt_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ex_reg_dest : OUT STD_LOGIC;
		 ex_branch : OUT STD_LOGIC;
		 ex_mem_to_reg : OUT STD_LOGIC;
		 ex_mem_write : OUT STD_LOGIC;
		 ex_ALU_src : OUT STD_LOGIC;
		 ex_reg_write : OUT STD_LOGIC;
		 ex_ALU_op : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ex_extended_immediate : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_pc_plus_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_rd_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ex_rs_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_rs_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ex_rt_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_rt_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT comparator
	PORT(i_CLK : IN STD_LOGIC;
		 i_rs : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_rt : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_r : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT instruction_control_pipe
	PORT(i_CLK : IN STD_LOGIC;
		 i_RST : IN STD_LOGIC;
		 pc_mux_sel : IN STD_LOGIC;
		 pc_reg_stall : IN STD_LOGIC;
		 id_flush : IN STD_LOGIC;
		 id_stall : IN STD_LOGIC;
		 i_next_PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_reg_dest : OUT STD_LOGIC;
		 o_jump : OUT STD_LOGIC;
		 o_branch : OUT STD_LOGIC;
		 o_mem_to_reg : OUT STD_LOGIC;
		 o_mem_write : OUT STD_LOGIC;
		 o_ALU_src : OUT STD_LOGIC;
		 o_reg_write : OUT STD_LOGIC;
		 immidiate : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_add_alu_result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_ALU_op : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		 o_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_pc4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_shamt : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rd_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rs_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rt_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT hdu
	PORT(i_CLK : IN STD_LOGIC;
		 i_jump : IN STD_LOGIC;
		 i_branch : IN STD_LOGIC;
		 i_ex_mem_write : IN STD_LOGIC;
		 i_ex_rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_ex_rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_ex_write_reg_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_id_rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_id_rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_if_id_flush : OUT STD_LOGIC;
		 o_id_ex_flush : OUT STD_LOGIC;
		 o_if_id_stall : OUT STD_LOGIC;
		 o_pc_stall : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ex_mem
	PORT(CLK : IN STD_LOGIC;
		 mem_flush : IN STD_LOGIC;
		 mem_stall : IN STD_LOGIC;
		 exmem_reset : IN STD_LOGIC;
		 ex_reg_dest : IN STD_LOGIC;
		 ex_mem_to_reg : IN STD_LOGIC;
		 ex_mem_write : IN STD_LOGIC;
		 ex_reg_write : IN STD_LOGIC;
		 ex_ALU_out : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_pc_plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_rt_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_write_reg_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 mem_reg_dest : OUT STD_LOGIC;
		 mem_mem_to_reg : OUT STD_LOGIC;
		 mem_mem_write : OUT STD_LOGIC;
		 mem_reg_write : OUT STD_LOGIC;
		 mem_ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_pc_plus_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_rt_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_write_reg_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux21_5bit
	PORT(i_sel : IN STD_LOGIC;
		 i_0 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_file
	PORT(CLK : IN STD_LOGIC;
		 w_en : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 w_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 w_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rs_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 rt_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fu_alu
	PORT(i_sel : IN STD_LOGIC;
		 ALU_OP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ex_rs_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 ex_rt_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_A_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 i_B_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 imm : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_alu_out_a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_alu_out_b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 shamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 wb_rs_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_rt_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 zero : OUT STD_LOGIC;
		 ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT fu
	PORT(i_CLK : IN STD_LOGIC;
		 i_wb_reg_write : IN STD_LOGIC;
		 i_ex_reg_write : IN STD_LOGIC;
		 i_ex_rs_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_ex_rt_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_ex_write_reg_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 i_wb_write_reg_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_forward_a : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 o_forward_b : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux21_32bit
	PORT(i_sel : IN STD_LOGIC;
		 i_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_73 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_75 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_77 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_79 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_80 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_81 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_82 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_83 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_84 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_85 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_86 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_87 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_51 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_88 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_71 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
mem_ALU_out <= SYNTHESIZED_WIRE_88;
SYNTHESIZED_WIRE_72 <= '0';



b2v_id_ex_inst : id_ex
PORT MAP(CLK => i_CLK,
		 ex_flush => SYNTHESIZED_WIRE_0,
		 ex_stall => SYNTHESIZED_WIRE_72,
		 idex_reset => i_RST,
		 id_reg_dest => SYNTHESIZED_WIRE_2,
		 id_branch => SYNTHESIZED_WIRE_73,
		 id_mem_to_reg => SYNTHESIZED_WIRE_4,
		 id_mem_write => SYNTHESIZED_WIRE_5,
		 id_ALU_src => SYNTHESIZED_WIRE_6,
		 id_reg_write => SYNTHESIZED_WIRE_7,
		 id_ALU_op => SYNTHESIZED_WIRE_8,
		 id_extended_immediate => SYNTHESIZED_WIRE_9,
		 id_instruction => SYNTHESIZED_WIRE_10,
		 id_pc_plus_4 => SYNTHESIZED_WIRE_74,
		 id_rd_sel => SYNTHESIZED_WIRE_12,
		 id_rs_data => SYNTHESIZED_WIRE_75,
		 id_rs_sel => SYNTHESIZED_WIRE_76,
		 id_rt_data => SYNTHESIZED_WIRE_77,
		 id_rt_sel => SYNTHESIZED_WIRE_78,
		 ex_reg_dest => SYNTHESIZED_WIRE_85,
		 ex_branch => ex_branch,
		 ex_mem_to_reg => SYNTHESIZED_WIRE_81,
		 ex_mem_write => SYNTHESIZED_WIRE_36,
		 ex_ALU_src => SYNTHESIZED_WIRE_50,
		 ex_reg_write => SYNTHESIZED_WIRE_86,
		 ex_ALU_op => SYNTHESIZED_WIRE_51,
		 ex_extended_immediate => SYNTHESIZED_WIRE_56,
		 ex_instruction => SYNTHESIZED_WIRE_39,
		 ex_pc_plus_4 => SYNTHESIZED_WIRE_40,
		 ex_rd_sel => SYNTHESIZED_WIRE_47,
		 ex_rs_data => SYNTHESIZED_WIRE_52,
		 ex_rs_sel => SYNTHESIZED_WIRE_82,
		 ex_rt_data => SYNTHESIZED_WIRE_87,
		 ex_rt_sel => SYNTHESIZED_WIRE_83);



b2v_inst1 : comparator
PORT MAP(i_CLK => i_CLK,
		 i_rs => SYNTHESIZED_WIRE_75,
		 i_rt => SYNTHESIZED_WIRE_77,
		 o_r => SYNTHESIZED_WIRE_68);


b2v_inst11 : instruction_control_pipe
PORT MAP(i_CLK => i_CLK,
		 i_RST => i_RST,
		 pc_mux_sel => SYNTHESIZED_WIRE_19,
		 pc_reg_stall => SYNTHESIZED_WIRE_20,
		 id_flush => SYNTHESIZED_WIRE_21,
		 id_stall => SYNTHESIZED_WIRE_22,
		 i_next_PC => SYNTHESIZED_WIRE_23,
		 o_reg_dest => SYNTHESIZED_WIRE_2,
		 o_jump => SYNTHESIZED_WIRE_79,
		 o_branch => SYNTHESIZED_WIRE_73,
		 o_mem_to_reg => SYNTHESIZED_WIRE_4,
		 o_mem_write => SYNTHESIZED_WIRE_5,
		 o_ALU_src => SYNTHESIZED_WIRE_6,
		 o_reg_write => SYNTHESIZED_WIRE_7,
		 immidiate => SYNTHESIZED_WIRE_9,
		 o_add_alu_result => SYNTHESIZED_WIRE_66,
		 o_ALU_op => SYNTHESIZED_WIRE_8,
		 o_instruction => SYNTHESIZED_WIRE_10,
		 o_jump_address => SYNTHESIZED_WIRE_71,
		 o_pc4 => SYNTHESIZED_WIRE_74,
		 o_shamt => SYNTHESIZED_WIRE_59,
		 rd_sel => SYNTHESIZED_WIRE_12,
		 rs_sel => SYNTHESIZED_WIRE_76,
		 rt_sel => SYNTHESIZED_WIRE_78);


b2v_inst12 : hdu
PORT MAP(i_CLK => i_CLK,
		 i_jump => SYNTHESIZED_WIRE_79,
		 i_branch => SYNTHESIZED_WIRE_80,
		 i_ex_mem_write => SYNTHESIZED_WIRE_81,
		 i_ex_rs_sel => SYNTHESIZED_WIRE_82,
		 i_ex_rt_sel => SYNTHESIZED_WIRE_83,
		 i_ex_write_reg_sel => SYNTHESIZED_WIRE_84,
		 i_id_rs_sel => SYNTHESIZED_WIRE_76,
		 i_id_rt_sel => SYNTHESIZED_WIRE_78,
		 o_if_id_flush => SYNTHESIZED_WIRE_21,
		 o_id_ex_flush => SYNTHESIZED_WIRE_0,
		 o_if_id_stall => SYNTHESIZED_WIRE_22,
		 o_pc_stall => SYNTHESIZED_WIRE_20);


b2v_inst14 : ex_mem
PORT MAP(CLK => i_CLK,
		 mem_flush => SYNTHESIZED_WIRE_72,
		 mem_stall => SYNTHESIZED_WIRE_72,
		 exmem_reset => i_RST,
		 ex_reg_dest => SYNTHESIZED_WIRE_85,
		 ex_mem_to_reg => SYNTHESIZED_WIRE_81,
		 ex_mem_write => SYNTHESIZED_WIRE_36,
		 ex_reg_write => SYNTHESIZED_WIRE_86,
		 ex_ALU_out => SYNTHESIZED_WIRE_38,
		 ex_instruction => SYNTHESIZED_WIRE_39,
		 ex_pc_plus_4 => SYNTHESIZED_WIRE_40,
		 ex_rt_data => SYNTHESIZED_WIRE_87,
		 ex_write_reg_sel => SYNTHESIZED_WIRE_84,
		 mem_reg_dest => mem_reg_dest,
		 mem_mem_to_reg => mem_mem_to_reg,
		 mem_mem_write => mem_mem_write,
		 mem_reg_write => mem_reg_write,
		 mem_ALU_out => SYNTHESIZED_WIRE_88,
		 mem_instruction => mem_instruction,
		 mem_pc_plus_4 => mem_pc_plus_4,
		 mem_rt_data => mem_rt_data,
		 mem_write_reg_sel => mem_write_reg_sel);


SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_80 OR SYNTHESIZED_WIRE_79;


b2v_inst2 : mux21_5bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_85,
		 i_0 => SYNTHESIZED_WIRE_83,
		 i_1 => SYNTHESIZED_WIRE_47,
		 o_mux => SYNTHESIZED_WIRE_84);


b2v_inst4 : register_file
PORT MAP(CLK => i_CLK,
		 w_en => w_en,
		 reset => i_RST,
		 rs_sel => SYNTHESIZED_WIRE_76,
		 rt_sel => SYNTHESIZED_WIRE_78,
		 w_data => i_w_data,
		 w_sel => w_sel,
		 rs_data => SYNTHESIZED_WIRE_75,
		 rt_data => SYNTHESIZED_WIRE_77);


b2v_inst5 : fu_alu
PORT MAP(i_sel => SYNTHESIZED_WIRE_50,
		 ALU_OP => SYNTHESIZED_WIRE_51,
		 ex_rs_data => SYNTHESIZED_WIRE_52,
		 ex_rt_data => SYNTHESIZED_WIRE_87,
		 i_A_sel => SYNTHESIZED_WIRE_54,
		 i_B_sel => SYNTHESIZED_WIRE_55,
		 imm => SYNTHESIZED_WIRE_56,
		 mem_alu_out_a => SYNTHESIZED_WIRE_88,
		 mem_alu_out_b => SYNTHESIZED_WIRE_88,
		 shamt => SYNTHESIZED_WIRE_59,
		 wb_rs_data => i_w_data,
		 wb_rt_data => i_w_data,
		 zero => alu_zero,
		 ALU_out => SYNTHESIZED_WIRE_38);


b2v_inst6 : fu
PORT MAP(i_CLK => i_CLK,
		 i_wb_reg_write => w_en,
		 i_ex_reg_write => SYNTHESIZED_WIRE_86,
		 i_ex_rs_sel => SYNTHESIZED_WIRE_82,
		 i_ex_rt_sel => SYNTHESIZED_WIRE_83,
		 i_ex_write_reg_sel => SYNTHESIZED_WIRE_84,
		 i_wb_write_reg_sel => w_sel,
		 o_forward_a => SYNTHESIZED_WIRE_54,
		 o_forward_b => SYNTHESIZED_WIRE_55);


b2v_inst7 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_80,
		 i_0 => SYNTHESIZED_WIRE_74,
		 i_1 => SYNTHESIZED_WIRE_66,
		 o_mux => SYNTHESIZED_WIRE_70);


SYNTHESIZED_WIRE_80 <= SYNTHESIZED_WIRE_73 AND SYNTHESIZED_WIRE_68;


b2v_inst9 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_79,
		 i_0 => SYNTHESIZED_WIRE_70,
		 i_1 => SYNTHESIZED_WIRE_71,
		 o_mux => SYNTHESIZED_WIRE_23);


END bdf_type;