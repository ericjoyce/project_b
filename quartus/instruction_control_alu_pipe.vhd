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
-- CREATED		"Wed Nov 08 14:54:38 2017"

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
		ex_rs_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ex_rt_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
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

COMPONENT alu
	PORT(ALU_OP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 shamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 zero : OUT STD_LOGIC;
		 ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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

COMPONENT mux21_32bit
	PORT(i_sel : IN STD_LOGIC;
		 i_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_55 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_57 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_59 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_61 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_45 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_48 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_53 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
ex_rt_sel <= SYNTHESIZED_WIRE_35;
SYNTHESIZED_WIRE_54 <= '0';



b2v_id_ex_inst : id_ex
PORT MAP(CLK => i_CLK,
		 ex_flush => SYNTHESIZED_WIRE_54,
		 ex_stall => SYNTHESIZED_WIRE_54,
		 idex_reset => i_RST,
		 id_reg_dest => SYNTHESIZED_WIRE_2,
		 id_branch => SYNTHESIZED_WIRE_55,
		 id_mem_to_reg => SYNTHESIZED_WIRE_4,
		 id_mem_write => SYNTHESIZED_WIRE_5,
		 id_ALU_src => SYNTHESIZED_WIRE_6,
		 id_reg_write => SYNTHESIZED_WIRE_7,
		 id_ALU_op => SYNTHESIZED_WIRE_8,
		 id_extended_immediate => SYNTHESIZED_WIRE_9,
		 id_instruction => SYNTHESIZED_WIRE_10,
		 id_pc_plus_4 => SYNTHESIZED_WIRE_56,
		 id_rd_sel => SYNTHESIZED_WIRE_12,
		 id_rs_data => SYNTHESIZED_WIRE_57,
		 id_rs_sel => SYNTHESIZED_WIRE_58,
		 id_rt_data => SYNTHESIZED_WIRE_59,
		 id_rt_sel => SYNTHESIZED_WIRE_60,
		 ex_reg_dest => SYNTHESIZED_WIRE_61,
		 ex_branch => ex_branch,
		 ex_mem_to_reg => SYNTHESIZED_WIRE_24,
		 ex_mem_write => SYNTHESIZED_WIRE_25,
		 ex_ALU_src => SYNTHESIZED_WIRE_43,
		 ex_reg_write => SYNTHESIZED_WIRE_26,
		 ex_ALU_op => SYNTHESIZED_WIRE_37,
		 ex_extended_immediate => SYNTHESIZED_WIRE_45,
		 ex_instruction => SYNTHESIZED_WIRE_28,
		 ex_pc_plus_4 => SYNTHESIZED_WIRE_29,
		 ex_rd_sel => SYNTHESIZED_WIRE_36,
		 ex_rs_data => SYNTHESIZED_WIRE_38,
		 ex_rs_sel => ex_rs_sel,
		 ex_rt_data => SYNTHESIZED_WIRE_62,
		 ex_rt_sel => SYNTHESIZED_WIRE_35);



b2v_inst1 : comparator
PORT MAP(i_CLK => i_CLK,
		 i_rs => SYNTHESIZED_WIRE_57,
		 i_rt => SYNTHESIZED_WIRE_59,
		 o_r => SYNTHESIZED_WIRE_50);


b2v_inst13 : instruction_control_pipe
PORT MAP(i_CLK => i_CLK,
		 i_RST => i_RST,
		 pc_mux_sel => SYNTHESIZED_WIRE_19,
		 i_next_PC => SYNTHESIZED_WIRE_20,
		 o_reg_dest => SYNTHESIZED_WIRE_2,
		 o_jump => SYNTHESIZED_WIRE_64,
		 o_branch => SYNTHESIZED_WIRE_55,
		 o_mem_to_reg => SYNTHESIZED_WIRE_4,
		 o_mem_write => SYNTHESIZED_WIRE_5,
		 o_ALU_src => SYNTHESIZED_WIRE_6,
		 o_reg_write => SYNTHESIZED_WIRE_7,
		 immidiate => SYNTHESIZED_WIRE_9,
		 o_add_alu_result => SYNTHESIZED_WIRE_48,
		 o_ALU_op => SYNTHESIZED_WIRE_8,
		 o_instruction => SYNTHESIZED_WIRE_10,
		 o_jump_address => SYNTHESIZED_WIRE_53,
		 o_pc4 => SYNTHESIZED_WIRE_56,
		 o_shamt => SYNTHESIZED_WIRE_40,
		 rd_sel => SYNTHESIZED_WIRE_12,
		 rs_sel => SYNTHESIZED_WIRE_58,
		 rt_sel => SYNTHESIZED_WIRE_60);


b2v_inst14 : ex_mem
PORT MAP(CLK => i_CLK,
		 mem_flush => SYNTHESIZED_WIRE_54,
		 mem_stall => SYNTHESIZED_WIRE_54,
		 exmem_reset => i_RST,
		 ex_reg_dest => SYNTHESIZED_WIRE_61,
		 ex_mem_to_reg => SYNTHESIZED_WIRE_24,
		 ex_mem_write => SYNTHESIZED_WIRE_25,
		 ex_reg_write => SYNTHESIZED_WIRE_26,
		 ex_ALU_out => SYNTHESIZED_WIRE_27,
		 ex_instruction => SYNTHESIZED_WIRE_28,
		 ex_pc_plus_4 => SYNTHESIZED_WIRE_29,
		 ex_rt_data => SYNTHESIZED_WIRE_62,
		 ex_write_reg_sel => SYNTHESIZED_WIRE_31,
		 mem_reg_dest => mem_reg_dest,
		 mem_mem_to_reg => mem_mem_to_reg,
		 mem_mem_write => mem_mem_write,
		 mem_reg_write => mem_reg_write,
		 mem_ALU_out => mem_ALU_out,
		 mem_instruction => mem_instruction,
		 mem_pc_plus_4 => mem_pc_plus_4,
		 mem_rt_data => mem_rt_data,
		 mem_write_reg_sel => mem_write_reg_sel);


SYNTHESIZED_WIRE_19 <= SYNTHESIZED_WIRE_63 OR SYNTHESIZED_WIRE_64;


b2v_inst2 : mux21_5bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_61,
		 i_0 => SYNTHESIZED_WIRE_35,
		 i_1 => SYNTHESIZED_WIRE_36,
		 o_mux => SYNTHESIZED_WIRE_31);


b2v_inst3 : alu
PORT MAP(ALU_OP => SYNTHESIZED_WIRE_37,
		 i_A => SYNTHESIZED_WIRE_38,
		 i_B => SYNTHESIZED_WIRE_39,
		 shamt => SYNTHESIZED_WIRE_40,
		 zero => alu_zero,
		 ALU_out => SYNTHESIZED_WIRE_27);


b2v_inst4 : register_file
PORT MAP(CLK => i_CLK,
		 w_en => w_en,
		 reset => i_RST,
		 rs_sel => SYNTHESIZED_WIRE_58,
		 rt_sel => SYNTHESIZED_WIRE_60,
		 w_data => i_w_data,
		 w_sel => w_sel,
		 rs_data => SYNTHESIZED_WIRE_57,
		 rt_data => SYNTHESIZED_WIRE_59);


b2v_inst5 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_43,
		 i_0 => SYNTHESIZED_WIRE_62,
		 i_1 => SYNTHESIZED_WIRE_45,
		 o_mux => SYNTHESIZED_WIRE_39);


b2v_inst7 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_63,
		 i_0 => SYNTHESIZED_WIRE_56,
		 i_1 => SYNTHESIZED_WIRE_48,
		 o_mux => SYNTHESIZED_WIRE_52);


SYNTHESIZED_WIRE_63 <= SYNTHESIZED_WIRE_55 AND SYNTHESIZED_WIRE_50;


b2v_inst9 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_64,
		 i_0 => SYNTHESIZED_WIRE_52,
		 i_1 => SYNTHESIZED_WIRE_53,
		 o_mux => SYNTHESIZED_WIRE_20);


END bdf_type;