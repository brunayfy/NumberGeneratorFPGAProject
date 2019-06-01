library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 

entity ffd is
port(
    D: in std_logic_vector(bussize-1 downto 0);
    Q: out std_logic_vector(bussize-1 downto 0);
    clk: in std_logic;
    clr: in std_logic
);
end entity;
architecture ffd of ffd is

    procedure flipd (clk: in std_logic; clr:in std_logic; D: in std_logic_vector;  signal Q: out std_logic_vector) is
        --declaracao de tipo, constante, variavel
        begin--codigo sequencial
        if clr'event and clr ='1' then 
            Q <= "0";    
        elsif clk'event and clk ='1' then 
            Q <= D;
        end if;
    end flipd;
begin
    abc:process(clk,clr)
	 begin
        flipd(clk,clr,D,Q);
    end process;
end ffd;