--definition of the package of the project
library ieee;
use ieee.std_logic_1164.all;
package packagefpga is 
    --declaration of subprograms , contants, components, types, 
    --subtypes, signals, variables shared here
    constant bussize: integer; --declaracao do generic
    procedure ffd (clk: in std_logic; clr:in std_logic; D: in std_logic_vector;  signal Q: out std_logic_vector);
    
    component adder
        port(a, b, ve  : in std_logic;
            s, vs     : out std_logic); 
    end component;
      
    component n_adder
        port(
            x, y: in std_logic_vector(bussize-1 downto 0);
            s: out std_logic_vector(bussize-1 downto 0);
            cin: in std_logic;
            cout: out std_logic
        );
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
            start : in bit        
        );
    end component;

    component multiplier
        port(
            x,y : in std_logic_vector(bussize-1 downto 0); 
            p : out std_logic_vector(bussize*2-1 downto 0)
        );
    end component;

end packagefpga; 

package body packagefpga is
    constant bussize :integer :=16; --deferred constant(changing its value only need to recompile body of package)
    --body of subprograms  and procedures here
    procedure ffd (clk: in std_logic; clr:in std_logic; D: in std_logic_vector(bussize-1 downto 0);  signal Q: out std_logic_vector(bussize-1 downto 0)) is
        --declaracao de tipo, constante, variavel
        begin--codigo sequencial
        if clr'event and clr ='1' then 
            Q <= "0";    
        elsif clk'event and clk ='1' then 
            Q <= D;
        end if;
    end ffd;

    --use must be inside a process:
    -- abc:process(clk,clr)
    -- begin
    --    ffd(clk,clr,D,Q);
    -- end process;
end packagefpga ;