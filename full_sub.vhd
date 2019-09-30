library ieee;
use ieee.std_logic_1164.all;
use work.logisticmap_pkg.all;

entity full_sub is
    generic(
        bussize	: integer:=20
        );
    port(
        x, y	: in	std_logic_vector(bussize-1 downto 0);
        s		: out	std_logic_vector(bussize-1 downto 0);
        cin : in std_logic;
        cout : out std_logic

        );
end entity;
architecture subtractor_rtl of full_sub is
signal neg_y: std_logic_vector(bussize-1 downto 0);
signal not_y: std_logic_vector(bussize-1 downto 0);
begin
    not_y <= not y;
    complement_of_2: n_adder generic map (bussize) port map(not_y,(0=>'1', bussize-1 downto 1=> '0') , neg_y, '0', open);
    sub: n_adder generic map(bussize) port map(x, neg_y, s, cin, cout);
    
end subtractor_rtl;