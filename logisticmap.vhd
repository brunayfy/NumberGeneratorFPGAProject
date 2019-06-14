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
	-- Used two subtractors of 16 bits connected to make the subtraction of x(i)-x(i)^2
	-- Since x(i)^2 has 32 bits, extended the x(i) to 32 bits filling it with zeros on the less significant part
	sub1: n_subtractor port map( Q,Qsq(bussize*2-1 downto bussize), sub_out(bussize*2-1 downto bussize),c, open);
	sub2: n_subtractor port map((others =>'0'),Qsq(bussize-1 downto 0), sub_out(bussize-1 downto 0), '0', c);
	-- leftshift <<2 takes the previous 32 bits subtraction and shift it then take the 16 most significant bits
	shift: shift2 port map(sub_out, z);

	xnout <=z;
end lmap;