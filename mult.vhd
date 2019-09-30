library ieee;
use ieee.std_logic_1164.all;
use work.logisticmap_pkg.all;
entity mult is
    	generic( bussize: integer := 20);		
	port(
		x, y : in std_logic_vector(bussize-1 downto 0); 
		p : out std_logic_vector(bussize-1 downto 0)
		
	);
end entity;

ARCHITECTURE mult_rtl OF mult IS
    type vec is array (bussize -1 downto 0)  of std_logic_vector (bussize -1 downto 0);
    signal sum: vec ;
    signal cout :std_logic_vector (bussize -1 downto 0);
    signal andbitvector: vec;
    signal concatenated_y: vec;
    function andbit (ybit : std_logic; xvector: std_logic_vector(bussize-1 downto 0)) return std_logic_vector is
        begin
            if (ybit='1') then
                return xvector;
            else 
                return (xvector'length -1 downto 0 => '0');
            end if;
    end andbit;
BEGIN
    
    cout(0) <= '0';
    sum(0) <= andbit(y(0), x);
    p((bussize - 1) downto (0)) <= (cout(bussize-1) & sum(bussize-1)((bussize-1) downto 1));
   
    nbitadders: FOR i IN 0 TO bussize-2 GENERATE 
	andbitvector(i) <= andbit(y(i+1), x);
	concatenated_y(i) <= (cout(i) & sum(i)(bussize-1 downto 1));    
	--                   (x                      ,y                                        ,s       , cin,cout     )
        ci: n_adder generic map(bussize) PORT MAP (andbitvector(i), concatenated_y(i), sum(i+1), '0', cout(i+1));
    END GENERATE nbitadders; 
END mult_rtl;