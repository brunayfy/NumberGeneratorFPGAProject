library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all;
entity multiplier is
	port(
		x,y : in std_logic_vector(bussize-1 downto 0); 
		p : out std_logic_vector(bussize*2-1 downto 0)
		
	);
end entity;

ARCHITECTURE multiplier_rtl OF multiplier IS
    type vec is array (bussize -1 downto 0)  of std_logic_vector (bussize -1 downto 0);
    signal sum: vec ;
    signal cout :std_logic_vector (bussize -1 downto 0);
    signal andbitvector: vec; --not needed on vhdl-2008 -> right not globally static expression inside portmap!
    signal concatenated_y:vec; --not needed on vhdl-2008
    function andbit (ybit : std_logic; xvector: std_logic_vector(bussize-1 downto 0)) return std_logic_vector is
        variable zeros :std_logic_vector(xvector'range) := (others=> '0'); 
        begin
            if (ybit='1') then
                return xvector;
            else 
                return zeros;
            end if;
    end andbit;
BEGIN
    
    cout(0) <= '0';
    sum(0) <= andbit(y(0), x);
    p((bussize*2 - 1) downto (bussize-1)) <= (cout(bussize-1) & sum(bussize-1)((bussize -1) downto 0));
    nbitadders: FOR i IN 0 TO bussize-2 GENERATE 
	andbitvector(i) <= andbit(y(i+1),x);
	concatenated_y(i) <= (cout(i) & sum(i)(bussize-1 downto 1));    
	--                   (x                      ,y                                        ,s       , cin,cout     )
        ci: n_adder PORT MAP (andbitvector(i),concatenated_y(i) ,sum(i+1) , '0', cout(i+1));
        p(i) <= sum(i)(0);
    END GENERATE nbitadders; 
END multiplier_rtl;