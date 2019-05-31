library ieee;
use ieee.std_logic_1164.all;

-- Mux - 2 inputs of n bits.
-- 'x0' and 'z' are the inputs, 'y' is the output. 'start' selects 'x0' or 'z'.

entity mux is
    generic(
		bussize: integer := 16
        );
        
    port(
        x0 : in std_logic_vector(bussize-1 downto 0);
        z : in std_logic_vector(bussize-1 downto 0); 
        y : out std_logic_vector(bussize-1 downto 0);
        start : in bit
        
    );
end mux;

architecture structural of mux is
begin

    with start select
        y <= x0 when '1',
             z when '0';
    
end structural;