library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity hdu is
  port( i_CLK : in std_logic;
	i_jump_branch  : in std_logic;
	i_ex_rs_sel : in std_logic_vector(4 downto 0);
  	i_ex_rt_sel : in std_logic_vector(4 downto 0);
	i_id_rs_sel : in std_logic_vector(4 downto 0);
	i_id_rt_sel : in std_logic_vector(4 downto 0);
	o_if_id_flush : in std_logic;
	o_id_ex_flush : in std_logic;
	o_if_id_stall : in std_logic
	o_pc_stall : in std_logic
	);
 end fu;

architecture mixed of fu is 

-- todo add anything?

begin



process(i_id_rt_sel, i_id_rs_sel, i_ex_rt_sel, i_ex_rs_sel, i_jump_branch, i_CLK)

begin

end process;

end mixed;