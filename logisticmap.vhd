library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity logisticmap is
	generic(
		bussize	: integer := 3
		);
	port(
		clk, clr	: in	std_logic;
		start		: in	std_logic;
		x0		: in	std_logic_vector(bussize-1 downto 0);
		xnout		: out	std_logic_vector(bussize-1 downto 0)
		);
end logisticmap;

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity n_adder is
	port(
		x, y: in std_logic_vector(bussize-1 downto 0);
		s: out std_logic_vector(bussize-1 downto 0);
		cin: in std_logic;
		cout: out std_logic
	);
end entity;


library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity n_subtractor is
	port(
		x, y: in std_logic_vector(bussize-1 downto 0);
		s: out std_logic_vector(bussize-1 downto 0);
		cin: in std_logic;
		cout: out std_logic
	);
end entity;

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity multiplexer is
	port(
		x0 : in std_logic_vector(bussize-1 downto 0);
		z : in std_logic_vector(bussize-1 downto 0); 
		y : out std_logic_vector(bussize-1 downto 0);
		start : in bit
		
	);
end entity;

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all; 
entity multiplier is
	port(
		x,y : in std_logic_vector(bussize-1 downto 0); 
		p : out std_logic_vector(bussize*2-1 downto 0)
		
	);
end entity;


architecture lmap of logisticmap is
begin
end lmap;