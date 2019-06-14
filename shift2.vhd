
-- We can use shift_left function from ieee.numeric_std.

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all;
entity shift2 is
	port(
		x: in std_logic_vector(bussize*2-1 downto 0);  
		z: out std_logic_vector(bussize-1 downto 0));
end entity;
architecture shift2_rtl of shift2 is
    function shift (x: std_logic_vector) return std_logic_vector is
    begin
       return (x(bussize*2 -1-2 downto bussize-2));
    end shift;
    begin
        z <= shift(x) ;
    end shift2_rtl;