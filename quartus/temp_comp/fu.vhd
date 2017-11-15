library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fu is
  port( i_CLK : in std_logic;
	i_wb_reg_write  : in std_logic; --good
	i_ex_reg_write 	: in std_logic; --good
	i_ex_rs_sel : in std_logic_vector(4 downto 0); --good
  	i_ex_rt_sel : in std_logic_vector(4 downto 0); --good
	i_wb_write_reg_sel : in std_logic_vector(4 downto 0); --good
	i_ex_write_reg_sel : in std_logic_vector(4 downto 0); --good
	o_forward_a : out std_logic_vector(1 downto 0); --good
	o_forward_b : out std_logic_vector(1 downto 0) --good
	);
 end fu;