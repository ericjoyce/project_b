library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity const_4 is
  port( o_F : out std_logic_vector(31 downto 0));
end const_4;

architecture mixed of const_4 is 

begin

o_F <= x"00000004";

end mixed;