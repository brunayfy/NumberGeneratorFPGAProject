-- Mux - 2 inputs of n bits.
-- 'x0' and 'z' are the inputs, 'y' is the output. 'start' selects 'x0' or 'z'.
architecture multiplexer_rtl of multiplexer is
begin
    with start select
        y <= x0 when '1',
             z when '0';
    
end multiplexer_rtl;