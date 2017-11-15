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
-- CREATED		"Wed Nov 15 12:48:46 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY instruction_control_pipe IS 
	PORT
	(
		i_CLK :  IN  STD_LOGIC;
		i_RST :  IN  STD_LOGIC;
		pc_mux_sel :  IN  STD_LOGIC;
		pc_reg_stall :  IN  STD_LOGIC;
		id_flush :  IN  STD_LOGIC;
		id_stall :  IN  STD_LOGIC;
		i_next_PC :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_jump :  OUT  STD_LOGIC;
		o_branch :  OUT  STD_LOGIC;
		o_mem_to_reg :  OUT  STD_LOGIC;
		o_mem_write :  OUT  STD_LOGIC;
		o_ALU_src :  OUT  STD_LOGIC;
		o_reg_write :  OUT  STD_LOGIC;
		o_reg_dest :  OUT  STD_LOGIC;
		immidiate :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_add_alu_result :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_ALU_op :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		o_instruction :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_jump_address :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_pc4 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_shamt :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rd_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rs_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rt_sel :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END instruction_control_pipe;

ARCHITECTURE bdf_type OF instruction_control_pipe IS 

COMPONENT adder_32
	PORT(i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_F : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT main_control
	PORT(i_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_reg_dest : OUT STD_LOGIC;
		 o_jump : OUT STD_LOGIC;
		 o_branch : OUT STD_LOGIC;
		 o_mem_to_reg : OUT STD_LOGIC;
		 o_mem_write : OUT STD_LOGIC;
		 o_ALU_src : OUT STD_LOGIC;
		 o_reg_write : OUT STD_LOGIC;
		 o_ALU_op : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instruction_pipe
	PORT(i_CLK : IN STD_LOGIC;
		 i_RST : IN STD_LOGIC;
		 pc_mux_sel : IN STD_LOGIC;
		 pc_reg_stall : IN STD_LOGIC;
		 id_flush : IN STD_LOGIC;
		 id_stall : IN STD_LOGIC;
		 i_next_PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_instruction_15_0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 o_instruction_15_11 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_instruction_20_16 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_instruction_25_21 : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 o_instruction_31_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_instruction_SE_15_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_pc4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sll_2
	PORT(i_to_shift : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_shifted : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	o_instruction_15_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
immidiate <= SYNTHESIZED_WIRE_3;
o_instruction <= SYNTHESIZED_WIRE_2;
o_pc4 <= SYNTHESIZED_WIRE_0;



b2v_inst : adder_32
PORT MAP(i_A => SYNTHESIZED_WIRE_0,
		 i_B => SYNTHESIZED_WIRE_1,
		 o_F => o_add_alu_result);


b2v_inst2 : main_control
PORT MAP(i_instruction => SYNTHESIZED_WIRE_2,
		 o_reg_dest => o_reg_dest,
		 o_jump => o_jump,
		 o_branch => o_branch,
		 o_mem_to_reg => o_mem_to_reg,
		 o_mem_write => o_mem_write,
		 o_ALU_src => o_ALU_src,
		 o_reg_write => o_reg_write,
		 o_ALU_op => o_ALU_op);


b2v_inst3 : instruction_pipe
PORT MAP(i_CLK => i_CLK,
		 i_RST => i_RST,
		 pc_mux_sel => pc_mux_sel,
		 pc_reg_stall => pc_reg_stall,
		 id_flush => id_flush,
		 id_stall => id_stall,
		 i_next_PC => i_next_PC,
		 o_instruction_15_0 => o_instruction_15_0,
		 o_instruction_15_11 => rd_sel,
		 o_instruction_20_16 => rt_sel,
		 o_instruction_25_21 => rs_sel,
		 o_instruction_31_0 => SYNTHESIZED_WIRE_2,
		 o_instruction_SE_15_0 => SYNTHESIZED_WIRE_3,
		 o_jump_address => o_jump_address,
		 o_pc4 => SYNTHESIZED_WIRE_0);


b2v_inst4 : sll_2
PORT MAP(i_to_shift => SYNTHESIZED_WIRE_3,
		 o_shifted => SYNTHESIZED_WIRE_1);

o_shamt(4 DOWNTO 0) <= o_instruction_15_0(10 DOWNTO 6);

END bdf_type;