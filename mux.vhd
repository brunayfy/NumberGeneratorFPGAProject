-- Mux - 2 inputs of n bits.
-- 'x0' and 'z' are the inputs, 'y' is the output. 'start' selects 'x0' or 'z'.

library ieee;
use ieee.std_logic_1164.all;
use work.logisticmap_pkg.all;
entity mux is
    generic(bussize	: integer := 20);
	port(
		start : in std_logic;
		z : in std_logic_vector(bussize-1 downto 0); 
        x0 : in std_logic_vector(bussize-1 downto 0);
		y : out std_logic_vector(bussize-1 downto 0)
		
	);
end entity;

architecture mux_rtl of mux is
    begin
        with start select
            y <= x0 when '1',
                 z when '0',
                 z when others;
        
    end mux_rtl;
