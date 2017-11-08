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
-- CREATED		"Wed Nov 08 13:53:36 2017"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY instruction_pipe IS 
	PORT
	(
		i_CLK :  IN  STD_LOGIC;
		i_RST :  IN  STD_LOGIC;
		pc_mux_sel :  IN  STD_LOGIC;
		i_next_PC :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_instruction_15_0 :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0);
		o_instruction_15_11 :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		o_instruction_20_16 :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		o_instruction_25_21 :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		o_instruction_31_0 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_instruction_SE_15_0 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_jump_address :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		o_pc4 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END instruction_pipe;

ARCHITECTURE bdf_type OF instruction_pipe IS 

COMPONENT mux21_32bit
	PORT(i_sel : IN STD_LOGIC;
		 i_0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_mux : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT adder_32
	PORT(i_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_F : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pc_reg
	PORT(CLK : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 stall : IN STD_LOGIC;
		 i_next_PC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_PC : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT imem
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

COMPONENT const_4
	PORT(		 o_F : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sll_2
	PORT(i_to_shift : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_shifted : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT jump_address
	PORT(i_inst : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 i_pc4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 o_JA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sign_extender_16_32
	PORT(i_to_extend : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 o_extended : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT if_id
	PORT(CLK : IN STD_LOGIC;
		 id_flush : IN STD_LOGIC;
		 id_stall : IN STD_LOGIC;
		 ifid_reset : IN STD_LOGIC;
		 if_instruction : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 if_pc_plus_4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 id_pc_plus_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	pc :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	q :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(0 TO 3);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(0 TO 31);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 
o_pc4 <= SYNTHESIZED_WIRE_8;
SYNTHESIZED_WIRE_14 <= '0';
SYNTHESIZED_WIRE_5 <= "1111";
SYNTHESIZED_WIRE_6 <= "00000000000000000000000000000000";



b2v_inst : mux21_32bit
PORT MAP(i_sel => pc_mux_sel,
		 i_0 => SYNTHESIZED_WIRE_13,
		 i_1 => i_next_PC,
		 o_mux => SYNTHESIZED_WIRE_3);


b2v_inst1 : adder_32
PORT MAP(i_A => SYNTHESIZED_WIRE_1,
		 i_B => pc,
		 o_F => SYNTHESIZED_WIRE_13);


b2v_inst10 : pc_reg
PORT MAP(CLK => i_CLK,
		 reset => i_RST,
		 stall => SYNTHESIZED_WIRE_14,
		 i_next_PC => SYNTHESIZED_WIRE_3,
		 o_PC => pc);



b2v_inst2 : imem
GENERIC MAP(depth_exp_of_2 => 10,
			mif_filename => "imem.mif"
			)
PORT MAP(clock => i_CLK,
		 wren => SYNTHESIZED_WIRE_14,
		 address => pc(11 DOWNTO 2),
		 byteena => SYNTHESIZED_WIRE_5,
		 data => SYNTHESIZED_WIRE_6,
		 q => SYNTHESIZED_WIRE_11);


b2v_inst3 : const_4
PORT MAP(		 o_F => SYNTHESIZED_WIRE_1);


b2v_inst4 : sll_2
PORT MAP(i_to_shift => q,
		 o_shifted => SYNTHESIZED_WIRE_7);




b2v_inst7 : jump_address
PORT MAP(i_inst => SYNTHESIZED_WIRE_7,
		 i_pc4 => SYNTHESIZED_WIRE_8,
		 o_JA => o_jump_address);


b2v_inst8 : sign_extender_16_32
PORT MAP(i_to_extend => q(15 DOWNTO 0),
		 o_extended => o_instruction_SE_15_0);


b2v_inst9 : if_id
PORT MAP(CLK => i_CLK,
		 id_flush => SYNTHESIZED_WIRE_14,
		 id_stall => SYNTHESIZED_WIRE_14,
		 ifid_reset => i_RST,
		 if_instruction => SYNTHESIZED_WIRE_11,
		 if_pc_plus_4 => SYNTHESIZED_WIRE_13,
		 id_instruction => q,
		 id_pc_plus_4 => SYNTHESIZED_WIRE_8);

o_instruction_15_0(15 DOWNTO 0) <= q(15 DOWNTO 0);
o_instruction_15_11(4 DOWNTO 0) <= q(15 DOWNTO 11);
o_instruction_20_16(4 DOWNTO 0) <= q(20 DOWNTO 16);
o_instruction_25_21(4 DOWNTO 0) <= q(25 DOWNTO 21);
o_instruction_31_0 <= q;

END bdf_type;