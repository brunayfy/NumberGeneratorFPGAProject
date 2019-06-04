-- n bits subtractor using complement of 2.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + (-y)


architecture subtractor_rtl of n_subtractor is
signal neg_y: std_logic_vector(bussize-1 downto 0);
signal one :std_logic_vector(y'range) := (0=>'1', others=> '0'); 
begin
  
    complement_of_2: n_adder port map(not y, one, neg_y, '0', open);
    sub: n_adder port map(x, neg_y, s, cin, cout);
    
end subtractor_rtl;