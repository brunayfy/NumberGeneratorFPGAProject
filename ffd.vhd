architecture ffd_rtl of ffd is
    procedure ffdp (signal clk: in std_logic; 
						  signal clr:in std_logic; 
						  signal D: in std_logic_vector(bussize-1 downto 0);  
						  signal Q: out std_logic_vector(bussize-1 downto 0)) is
    begin
		if (clr ='1') then 
			 Q <= (others => '0');    
		elsif (clk'event and clk ='1') then 
			 Q <= D;
		end if;
    end ffdp;
	 
begin

	abc:process(clk, clr)
		begin
			ffdp(clk, clr, D, Q);
	end process;
 
end ffd_rtl;