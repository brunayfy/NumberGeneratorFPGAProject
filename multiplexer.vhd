-- Mux - 2 inputs of n bits.
-- 'x0' and 'z' are the inputs, 'y' is the output. 'start' selects 'x0' or 'z'.
architecture multiplexer_rtl of multiplexer is
<<<<<<< HEAD
    begin
        with start select
            y <= x0 when '1',
                 z when '0',
                     x0 when others;
        
    end multiplexer_rtl;
=======
begin
    with start select
        y <= x0 when '1',
             z when '0',
				 x0 when others;
    
end multiplexer_rtl;
>>>>>>> daadddf0716e18838834345fcb817ba51a1703c2
