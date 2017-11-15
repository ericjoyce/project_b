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
-- CREATED		"Wed Nov 15 12:13:50 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FU_ALU IS 
	PORT
	(
		ALU_OP :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		ex_rs_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ex_rt_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		i_A_sel :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		i_B_sel :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		mem_rs_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mem_rt_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		shamt :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		wb_rs_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		wb_rt_data :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		zero :  OUT  STD_LOGIC;
		ALU_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END FU_ALU;

ARCHITECTURE bdf_type OF FU_ALU IS 

COMPONENT alu
	PORT(ALU_OP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 shamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 zero : OUT STD_LOGIC;
		 ALU_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux31_32bit
	PORT(ex_rx_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 mem_rx_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 wb_rx_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_inst : alu
PORT MAP(ALU_OP => ALU_OP,
		 i_A => SYNTHESIZED_WIRE_0,
		 i_B => SYNTHESIZED_WIRE_1,
		 shamt => shamt,
		 zero => zero,
		 ALU_out => ALU_out);


b2v_inst3 : mux31_32bit
PORT MAP(ex_rx_data => ex_rs_data,
		 i_sel => i_A_sel,
		 mem_rx_data => mem_rs_data,
		 wb_rx_data => wb_rs_data,
		 o_mux => SYNTHESIZED_WIRE_0);


b2v_inst4 : mux31_32bit
PORT MAP(ex_rx_data => ex_rt_data,
		 i_sel => i_B_sel,
		 mem_rx_data => mem_rt_data,
		 wb_rx_data => wb_rt_data,
		 o_mux => SYNTHESIZED_WIRE_1);


END bdf_type;