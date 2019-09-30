library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.logisticmap_pkg.all;

entity logisticmap is
	generic(
		bussize	: integer := 20
		);
	port(
		clk, clr	: in	std_logic;
		start		: in	std_logic;
		x0			: in	std_logic_vector(bussize-1 downto 0);
		xnout		: out	std_logic_vector(bussize-1 downto 0)
		);
end logisticmap;

architecture structural of logisticmap is
	signal	xn, xn2, xn2_xn, xnplusone, d	: std_logic_vector(bussize-1 downto 0);

--	Crie alias para as subrotinas	Altere conforme as subrotinas desenvolvidas
--	alias my_dff	is work.logisticmap_pkg.___ [____, ____, ____, ____ ];
--	alias my_sft	is work.logisticmap_pkg.___ [____ return ____ ];
alias my_sft	is work.logisticmap_pkg.sft [ std_logic_vector return std_logic_vector];
alias my_dff	is work.logisticmap_pkg.dff [std_logic, std_logic, std_logic_vector,std_logic_vector];


begin

--	Altere conforme a implementação dos componentes desenvolvidos

	--Multiplexador
	comp_mux: mux
		generic map (bussize)
		port map (start, xnplusone, x0, d);
	--FF Tipo-D (NÃO ALTERAR)
	proc_dff: my_dff(clk, clr, d, xn);
	--Multiplicador
	comp_mult: mult
		generic map (bussize)
		port map (xn, xn, xn2);
	--Subtrator
	comp_sub: sub_ab
		generic map(bussize)
		port map(xn, xn2, xn2_xn);
	--Shifter (NÃO ALTERAR)
	func_sft: xnplusone <= my_sft(xn2_xn);

	xnout <= xnplusone;
	
end structural;
