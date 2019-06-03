
--we can use shift_left function from ieee.numeric_std
architecture shift2_rtl of shift2 is
    begin
        z<=(x(bussize*2 -1-2 downto bussize -2));
    end shift2_rtl;