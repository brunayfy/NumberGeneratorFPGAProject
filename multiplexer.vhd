library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 

-- Mux - 2 inputs of n bits.
-- 'x0' and 'z' are the inputs, 'y' is the output. 'start' selects 'x0' or 'z'.

architecture structural of multiplexer is
begin

    with start select
        y <= x0 when '1',
             z when '0';
    
end structural;