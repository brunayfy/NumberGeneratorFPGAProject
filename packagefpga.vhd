-- definition of the package of the project
library ieee;
use ieee.std_logic_1164.all;


package packagefpga is 
    -- declaration of subprograms, contants, components, types, 
    -- subtypes, signals, variables shared here
    constant bussize: integer := 16;
    component adder
        port(a, b, ve  : in std_logic;
            s, vs     : out std_logic); 
    end component;     
		
    component n_adder
        port(
            x, y: in std_logic_vector(bussize-1 downto 0);
            s: out std_logic_vector(bussize-1 downto 0);
            cin: in std_logic;
            cout: out std_logic);
    end component;
	 
    component n_subtractor
        port(
            x, y: in std_logic_vector(bussize-1 downto 0);
            s: out std_logic_vector(bussize-1 downto 0);
            cin: in std_logic;
            cout: out std_logic
        );
    end component;
	 
    component multiplexer
        port(
            x0 : in std_logic_vector(bussize-1 downto 0);
            z : in std_logic_vector(bussize-1 downto 0); 
            y : out std_logic_vector(bussize-1 downto 0);
            start : in std_logic        
        );
    end component;
	 
    component multiplier
        port(
            x,y : in std_logic_vector(bussize-1 downto 0); 
            p : out std_logic_vector(bussize*2-1 downto 0)
        );
    end component;
    component ffd
        port(clk: in std_logic;
            clr:in std_logic; 
            D: in std_logic_vector(bussize-1 downto 0);  
            Q: out std_logic_vector(bussize-1 downto 0));
    end component;
    component shift2
        port(
            x: in std_logic_vector(bussize*2-1 downto 0);  
            z: out std_logic_vector(bussize-1 downto 0));
    end component;
end packagefpga; 


package body packagefpga is
    --constant bussize :integer :=3; --deferred constant(changing its value only need to recompile body of package).
    --body of subprograms  and procedures here.
end packagefpga;