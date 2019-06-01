library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity adder is
port(a, b, ve  : in std_logic;
	s, vs     : out std_logic); 
end entity;
ARCHITECTURE teste OF adder IS
BEGIN
  s  <=  a XOR b  XOR ve;                      -- soma
  vs <= (a AND b) OR (a AND ve) OR (b AND ve); -- vai um
END teste;