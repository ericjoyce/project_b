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

architecture mixed of fu is 

-- todo add anything?

begin



process(i_wb_reg_write, i_ex_reg_write, i_ex_rs_sel, i_ex_rt_sel, i_wb_write_reg_sel, i_ex_write_reg_sel, i_CLK)

begin

-- pg 310 (336 actual)
if((i_ex_reg_write = '1') AND (i_ex_write_reg_sel /= "00000") AND (i_ex_write_reg_sel = i_ex_rs_sel)) then

	o_forward_a <= "10";

else if((i_ex_reg_write = '1') AND (i_ex_write_reg_sel /= "00000") AND (i_ex_write_reg_sel = i_ex_rt_sel)) then

	o_forward_b <= "10";

else if((i_wb_reg_write = '1') AND (i_wb_write_reg_sel /= "00000") AND (i_wb_write_reg_sel = i_ex_rs_sel)) then

	o_forward_a <= "01";

else if((i_wb_reg_write = '1') AND (i_wb_write_reg_sel /= "00000") AND (i_wb_write_reg_sel = i_ex_rt_sel)) then

	o_forward_b <= "01";

else

	o_forward_a <= "00";
	o_forward_b <= "00";

end if;

end process;

end mixed;
