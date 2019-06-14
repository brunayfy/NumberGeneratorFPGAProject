-- n bits subtractor using complement of 2.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + (-y)

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.bussize;
use work.packagefpga.n_adder;
entity n_subtractor is
	port(
		x, y: in std_logic_vector(bussize-1 downto 0);
		s: out std_logic_vector(bussize-1 downto 0);
		cin: in std_logic;
		cout: out std_logic
	);
end entity;

architecture subtractor_rtl of n_subtractor is
signal neg_y: std_logic_vector(bussize-1 downto 0);
signal not_y: std_logic_vector(bussize-1 downto 0);
begin
    not_y <= not y;
    complement_of_2: n_adder port map(not_y,(0=>'1', others=> '0') , neg_y, '0', open);
    sub: n_adder port map(x, neg_y, s, cin, cout);
    
end subtractor_rtl;