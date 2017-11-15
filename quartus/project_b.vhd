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
-- CREATED		"Wed Nov 15 12:34:01 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY project_b IS 
	PORT
	(
		i_CLK :  IN  STD_LOGIC;
		i_RST :  IN  STD_LOGIC;
		wb_reg_dest :  OUT  STD_LOGIC;
		alu_zero :  OUT  STD_LOGIC;
		ex_branch :  OUT  STD_LOGIC;
		wb_instruction :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		wb_pc_plus_4 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END project_b;

ARCHITECTURE bdf_type OF project_b IS 

COMPONENT dmem
GENERIC (depth_exp_of_2 : INTEGER;
			mif_filename : STRING
			);
	PORT(clock : IN STD_LOGIC;
		 wren : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 byteena : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux21_32bit
	PORT(i_sel : IN STD_LOGIC;
		 i_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instruction_control_alu_pipe
	PORT(i_CLK : IN STD_LOGIC;
		 i_RST : IN STD_LOGIC;
		 w_en : IN STD_LOGIC;
		 i_w_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 w_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 mem_reg_dest : OUT STD_LOGIC;
		 mem_mem_to_reg : OUT STD_LOGIC;
		 mem_mem_write : OUT STD_LOGIC;
		 mem_reg_write : OUT STD_LOGIC;
		 alu_zero : OUT STD_LOGIC;
		 ex_branch : OUT STD_LOGIC;
		 mem_ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_pc_plus_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_rt_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_write_reg_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mem_wb
	PORT(CLK : IN STD_LOGIC;
		 wb_flush : IN STD_LOGIC;
		 wb_stall : IN STD_LOGIC;
		 memwb_reset : IN STD_LOGIC;
		 mem_reg_dest : IN STD_LOGIC;
		 mem_mem_to_reg : IN STD_LOGIC;
		 mem_reg_write : IN STD_LOGIC;
		 mem_ALU_out : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_dmem_out : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_pc_plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mem_write_reg_sel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 wb_reg_dest : OUT STD_LOGIC;
		 wb_mem_to_reg : OUT STD_LOGIC;
		 wb_reg_write : OUT STD_LOGIC;
		 wb_ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_dmem_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_pc_plus_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_write_reg_sel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	mem_alu_out :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_1 <= "1111";
SYNTHESIZED_WIRE_18 <= '0';



b2v_inst : dmem
GENERIC MAP(depth_exp_of_2 => 10,
			mif_filename => "dmem.mif"
			)
PORT MAP(clock => i_CLK,
		 wren => SYNTHESIZED_WIRE_0,
		 address => mem_alu_out(11 DOWNTO 2),
		 byteena => SYNTHESIZED_WIRE_1,
		 data => SYNTHESIZED_WIRE_2,
		 q => SYNTHESIZED_WIRE_14);


b2v_inst1 : mux21_32bit
PORT MAP(i_sel => SYNTHESIZED_WIRE_3,
		 i_0 => SYNTHESIZED_WIRE_4,
		 i_1 => SYNTHESIZED_WIRE_5,
		 o_mux => SYNTHESIZED_WIRE_7);



b2v_inst6 : instruction_control_alu_pipe
PORT MAP(i_CLK => i_CLK,
		 i_RST => i_RST,
		 w_en => SYNTHESIZED_WIRE_6,
		 i_w_data => SYNTHESIZED_WIRE_7,
		 w_sel => SYNTHESIZED_WIRE_8,
		 mem_reg_dest => SYNTHESIZED_WIRE_11,
		 mem_mem_to_reg => SYNTHESIZED_WIRE_12,
		 mem_mem_write => SYNTHESIZED_WIRE_0,
		 mem_reg_write => SYNTHESIZED_WIRE_13,
		 alu_zero => alu_zero,
		 ex_branch => ex_branch,
		 mem_ALU_out => mem_alu_out,
		 mem_instruction => SYNTHESIZED_WIRE_15,
		 mem_pc_plus_4 => SYNTHESIZED_WIRE_16,
		 mem_rt_data => SYNTHESIZED_WIRE_2,
		 mem_write_reg_sel => SYNTHESIZED_WIRE_17);


b2v_inst7 : mem_wb
PORT MAP(CLK => i_CLK,
		 wb_flush => SYNTHESIZED_WIRE_18,
		 wb_stall => SYNTHESIZED_WIRE_18,
		 memwb_reset => i_RST,
		 mem_reg_dest => SYNTHESIZED_WIRE_11,
		 mem_mem_to_reg => SYNTHESIZED_WIRE_12,
		 mem_reg_write => SYNTHESIZED_WIRE_13,
		 mem_ALU_out => mem_alu_out,
		 mem_dmem_out => SYNTHESIZED_WIRE_14,
		 mem_instruction => SYNTHESIZED_WIRE_15,
		 mem_pc_plus_4 => SYNTHESIZED_WIRE_16,
		 mem_write_reg_sel => SYNTHESIZED_WIRE_17,
		 wb_reg_dest => wb_reg_dest,
		 wb_mem_to_reg => SYNTHESIZED_WIRE_3,
		 wb_reg_write => SYNTHESIZED_WIRE_6,
		 wb_ALU_out => SYNTHESIZED_WIRE_4,
		 wb_dmem_out => SYNTHESIZED_WIRE_5,
		 wb_instruction => wb_instruction,
		 wb_pc_plus_4 => wb_pc_plus_4,
		 wb_write_reg_sel => SYNTHESIZED_WIRE_8);



END bdf_type;