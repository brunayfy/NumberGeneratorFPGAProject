library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all;
entity logisticmap is
	port(
		clk, clr	: in	std_logic;
		start		: in	std_logic;
		x0		   : in	std_logic_vector(bussize-1 downto 0);
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
use work.packagefpga.bussize;
use work.packagefpga.n_adder;
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
		start : in std_logic
		
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

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all;
entity ffd is
	port(clk: in std_logic;
	clr:in std_logic; 
	D: in std_logic_vector(bussize-1 downto 0);  
	Q: out std_logic_vector(bussize-1 downto 0));
end entity;

library ieee;
use ieee.std_logic_1164.all;
use work.packagefpga.all;
entity shift2 is
	port(
		x: in std_logic_vector(bussize*2-1 downto 0);  
		z: out std_logic_vector(bussize-1 downto 0));
end entity;

architecture lmap of logisticmap is
	signal z: std_logic_vector(bussize -1 downto 0);
	signal D:std_logic_vector(bussize -1 downto 0);
	signal Q:std_logic_vector(bussize -1 downto 0);
	signal Qsq:std_logic_vector(bussize*2 -1 downto 0);
	signal sub_out:std_logic_vector(bussize*2 -1 downto 0);
	signal c:std_logic;

begin

	multiplex: multiplexer port map(x0, z, D, start);
	flipflopd: ffd port map(clk,clr,D,Q);
	mult: multiplier port map(Q,Q,Qsq);
	sub1: n_subtractor port map(Qsq(bussize*2-1 downto bussize), Q, sub_out(bussize*2-1 downto bussize),'0',c);
	sub2: n_subtractor port map(Qsq(bussize-1 downto 0),(others =>'0'), sub_out(bussize-1 downto 0), c, open);
	shift: shift2 port map(sub_out,z);

	xnout <=z;
end lmap;