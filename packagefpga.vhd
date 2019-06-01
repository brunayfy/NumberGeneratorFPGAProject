--definition of the package of the project
library ieee;
use ieee.std_logic_1164.all;
package packagefpga is 
    --declaration of subprograms , contants, components, types, 
    --subtypes, signals, variables shared here
    constant bussize: integer; --declaracao do generic
    component adder
        port(
            x, y: in std_logic_vector(bussize-1 downto 0);
            s: out std_logic_vector(bussize-1 downto 0);
            cin: in std_logic;
            cout: out std_logic
        );
    end component;

    component subtractor
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
    component ffd is
        port(
            D: in std_logic_vector(bussize-1 downto 0);
            Q: out std_logic_vector(bussize-1 downto 0);
            clk: in std_logic;
            clr: in std_logic
        );
    end component;
    --constant exemplo:bit_vector;
    --signal exemplo:bit;
end packagefpga; 

package body packagefpga is
    constant bussize :integer :=16; --valor do generic definido
    --constant exemplo:bit_vector(2 downto 0):="101";
    --body of subprograms here
end packagefpga ;