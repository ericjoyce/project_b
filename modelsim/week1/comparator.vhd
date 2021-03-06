
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparator is
  port(
	i_CLK: in std_logic; 
	i_rs: in std_logic_vector(31 downto 0);
	i_rt: in std_logic_vector(31 downto 0);
	o_r : out std_logic);
end comparator;

architecture mixed of comparator is 

begin

process(i_rs, i_rt, i_CLK)
begin
	if i_rs = i_rt then
  		o_r <= '1';
	else
  		o_r <= '0';
	end if;
end process;

end mixed;