-- n bits full adder.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + y

architecture adder_rtl of n_adder is
signal c: std_logic_vector(bussize downto 0); -- Local carry.

begin
		
	c(0) <= cin;
	cout <= c(bussize);
	  
	sum_loop: for i in 0 to bussize-1 generate
		component_add : adder port map (x(i), y(i), c(i), s(i), c(i+1));
	end generate sum_loop;
        
end adder_rtl;