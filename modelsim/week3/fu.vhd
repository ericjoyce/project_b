library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fu is
  port( i_wb_reg_write  : in std_logic; --good
	i_ex_reg_write 	: in std_logic; --good
	i_ex_rs_sel : in std_logic_vector(4 downto 0); --good
  	i_ex_rt_sel : in std_logic_vector(4 downto 0); --good
	i_wb_write_reg_sel : in std_logic_vector(4 downto 0); --good
	i_ex_write_reg_sel : in std_logic_vector(4 downto 0); --good
	o_forward_a : out std_logic_vector(1 downto 0); --good
	o_forward_b : out std_logic_vector(1 downto 0) --good
	);
 end fu;

architecture mixed of main_control is 

-- todo add anything?

begin



process(i_wb_reg_write, i_ex_reg_write, i_ex_rs_sel, i_ex_rt_sel, i_wb_write_reg_sel, i_ex_write_reg_sel)

begin

-- pg 310 (336 actual)
if((i_ex_reg_write = '1') AND (i_ex_write_reg_sel /= "00000") AND (i_ex_write_reg_sel = i_ex_rs_sel) then

	

end process;

end mixed;
