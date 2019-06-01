-- n bits subtractor using complement of 2.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + (-y)

architecture subtractor_rtl of full_subtractor is

signal neg_y: std_logic_vector(bussize-1 downto 0);

begin
    
    neg_y <= (not y) xor "0000000000000001";
    sub: full_adder port map(x, neg_y, s, cin, cout);
    
end subtractor_rtl;