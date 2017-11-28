library IEEE;
use IEEE.std_logic_1164.all;

entity jump_address is
  port( 
	i_pc4	: in std_logic_vector(31 downto 0);
	i_inst	: in std_logic_vector(31 downto 0);
	o_JA 	: out std_logic_vector(31 downto 0)
  );
end jump_address;

architecture mixed of jump_address is 

begin

o_JA(27 downto 0) <= i_inst(27 downto 0);
o_JA(31 downto 28) <= i_pc4(31 downto 28);

end mixed;