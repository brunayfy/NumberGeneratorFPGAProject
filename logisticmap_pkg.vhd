library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package logisticmap_pkg is

	component mux is	--Altere conforme o seu multiplexador
		generic(
			bussize	: integer
			);
		port(
			start 	: in	std_logic;
			z, x0	: in	std_logic_vector(bussize-1 downto 0);
			y		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;
	component adder
		port(a, b, ve  : in std_logic;
			s, vs     : out std_logic); 
	end component;     
		
	component n_adder
	generic(
		bussize	: integer
		);
		port(
			x, y: in std_logic_vector(bussize-1 downto 0);
			s: out std_logic_vector(bussize-1 downto 0);
			cin: in std_logic;
			cout: out std_logic);
	end component;
 
	component full_sub
	generic(
		bussize	: integer
		);	
	port(
			x, y: in std_logic_vector(bussize-1 downto 0);
			s: out std_logic_vector(bussize-1 downto 0);
			cin: in std_logic;
			cout: out std_logic
		);
	end component;
	
	component sub_ab is	--Altere conforme o seu Subtrator
		generic(
			bussize	: integer
			);
		port(
			a, b	: in	std_logic_vector(bussize-1 downto 0);
			a_b		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;
	
	component mult is	--Altere conforme o seu Multiplicador
		generic(
			bussize	: integer
			);
		port(
			x, y	: in	std_logic_vector(bussize-1 downto 0);
			p		: out	std_logic_vector(bussize-1 downto 0)
			);
	end component;
	
	-- Acrescente demais componentes que julgar necessario
	
	procedure dff(signal clk : in std_logic; clr : in std_logic; signal d : in std_logic_vector; signal q : out std_logic_vector);
	
	function sft(signal x : in std_logic_vector) return std_logic_vector;
	
end logisticmap_pkg;

package body logisticmap_pkg is
	
	--Inclua sua implementacao do PROCEDURE do FF Tipo-D
	procedure dff(signal clk : in std_logic; clr : in std_logic; signal d : in std_logic_vector; signal q : out std_logic_vector) is
	begin		
		if (clr ='1') then 
			q <=(d'length-1 downto 0 => '0');    
		elsif (clk'event and clk ='1') then 
			q <= d;
		end if;
	end dff;
	
	--Inclua sua implementacao da FUNCTION do Deslocador para a esquerda (<<2)
	function sft (signal x : in std_logic_vector) return std_logic_vector is
	begin
		return (x( x'length -3 downto 0 ) & "00");
	end function sft;

end logisticmap_pkg;

	

