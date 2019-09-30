library ieee;
use ieee.std_logic_1164.all;

entity adder is
	port(a, b, ve  : in std_logic;
		  s, vs     : out std_logic); 
end entity;

architecture adder_rtl of adder is

begin

  s  <=  a XOR b  XOR ve;                      -- Add.
  vs <= (a AND b) OR (a AND ve) OR (b AND ve); -- Carry.
  
end adder_rtl;