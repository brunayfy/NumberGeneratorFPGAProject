library ieee;
use ieee.std_logic_1164.all;

-- n bits subtractor using complement of 2.
-- 'x', 'y' are the inputs, 's' is the output. 'cin' is the carry in and 'cout' the carry out.
-- y <= x + (-y)


entity ex is
    generic(
		bussize: integer := 16
        );
        
    port(
        x, y: in std_logic_vector(bussize-1 downto 0);
        s: out std_logic_vector(bussize-1 downto 0);
        cin: in std_logic;
        cout: out std_logic
    );
end ex;

architecture structural of ex is

signal neg_y: std_logic_vector(bussize-1 downto 0);

component adder
    port(
        x, y: in std_logic_vector(bussize-1 downto 0);
        s: out std_logic_vector(bussize-1 downto 0);
        cin: in std_logic;
        cout: out std_logic
    );
end component;

begin
    
    neg_y <= (not y) xor "0000000000000001";
    sub: adder port map(x, neg_y, s, cin, cout);
    
end structural;