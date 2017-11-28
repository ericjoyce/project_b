library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fu is
  port( i_CLK : in std_logic;
	i_wb_reg_write  : in std_logic; --good
	i_mem_reg_write 	: in std_logic; --good
	i_id_rs_sel : in std_logic_vector(4 downto 0); --good
	i_id_rt_sel : in std_logic_vector(4 downto 0); --good
	i_ex_rs_sel : in std_logic_vector(4 downto 0); --good
  	i_ex_rt_sel : in std_logic_vector(4 downto 0); --good
	i_wb_write_reg_sel : in std_logic_vector(4 downto 0); --good
	i_mem_write_reg_sel : in std_logic_vector(4 downto 0); --good
	o_forward_a : out std_logic_vector(1 downto 0); --good
	o_forward_b : out std_logic_vector(1 downto 0); --good
	o_forward_comp_rs : out std_logic; --good
	o_forward_comp_rt : out std_logic --good
	);
 end fu;

architecture mixed of fu is 

begin



process(i_wb_reg_write, i_mem_reg_write, i_ex_rs_sel, i_ex_rt_sel, i_wb_write_reg_sel, i_mem_write_reg_sel, i_id_rt_sel,  i_id_rs_sel, i_CLK)

begin

	o_forward_a <= "00";
	o_forward_b <= "00";
	o_forward_comp_rs <= '0';
	o_forward_comp_rt <= '0';

	-- pg 310 (336 actual)

	if((i_wb_reg_write = '1') AND (i_wb_write_reg_sel /= "00000") AND (i_wb_write_reg_sel = i_ex_rs_sel)) then

		o_forward_a <= "01";

	end if;

	if((i_wb_reg_write = '1') AND (i_wb_write_reg_sel /= "00000") AND (i_wb_write_reg_sel = i_ex_rt_sel)) then

		o_forward_b <= "01";

	end if;

	if((i_mem_reg_write = '1') AND (i_mem_write_reg_sel /= "00000") AND (i_mem_write_reg_sel = i_ex_rs_sel)) then

		o_forward_a <= "10";

	end if;

	if((i_mem_reg_write = '1') AND (i_mem_write_reg_sel /= "00000") AND (i_mem_write_reg_sel = i_ex_rt_sel)) then

		o_forward_b <= "10";

	end if;


	--Comparator Forwarding
	if((i_mem_reg_write = '1') AND (i_mem_write_reg_sel /= "00000") AND (i_mem_write_reg_sel = i_id_rs_sel)) then

		o_forward_comp_rs <= '1';

	end if;

	if((i_mem_reg_write = '1') AND (i_mem_write_reg_sel /= "00000") AND (i_mem_write_reg_sel = i_id_rt_sel)) then

		o_forward_comp_rt <= '1';

	end if;

end process;

end mixed;