library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 

-- n bits full adder.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + y
entity adder is
port(
    x, y: in std_logic_vector(bussize-1 downto 0);
    s: out std_logic_vector(bussize-1 downto 0);
    cin: in std_logic;
    cout: out std_logic
);
end entity;

architecture structural of adder is
signal c: std_logic_vector(bussize downto 0); -- Local carry.
begin

	c(0) <= cin;
	cout <= c(bussize);
	
    sum_loop: for i in 0 to bussize-1 generate
        s(i) <= x(i) xor y(i) xor c(i);
		c(i+1) <= (x(i) and y(i)) or (x(i) and c(i)) or (y(i) and c(i));
    end generate sum_loop;
    
end structural;