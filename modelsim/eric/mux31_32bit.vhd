library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux31_32bit is
 port(
 
     ex_rx_data, wb_rx_data, mem_rx_data : in STD_LOGIC_VECTOR(31 downto 0);
     i_sel: in STD_LOGIC_VECTOR(1 downto 0);
     o_mux: out STD_LOGIC_VECTOR(31 downto 0)
  );
end mux31_32bit;
 
architecture bhv of mux31_32bit is
begin
process (ex_rx_data,wb_rx_data,mem_rx_data,i_sel) is
begin
  if (i_sel = "00") then
      o_mux <= ex_rx_data;
  elsif (i_sel = "01") then
      o_mux <= wb_rx_data;
  elsif (i_sel = "10") then
      o_mux <= mem_rx_data;
  else
      o_mux <= ex_rx_data;
  end if;
 
end process;
end bhv;