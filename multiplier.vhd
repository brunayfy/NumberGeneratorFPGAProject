ARCHITECTURE multiplier_rtl OF multiplier IS
    type vec is array (bussize -1 downto 0)  of std_logic_vector (bussize -1 downto 0);
    signal sum: vec ;
    signal cout :std_logic_vector (bussize -1 downto 0);
    function andbit ( ybit : std_logic; xvector: std_logic_vector(bussize-1 downto 0)) return std_logic_vector is
    constant zeros :std_logic_vector(xvector'range) := (others=> '0'); 
    begin
        if (ybit='1') then
            return xvector;
        else 
            return zeros; 
        end if;
    end andbit;
BEGIN
    
    cout(0) <= '0';
    sum(0) <= andbit(y(0), x);
    --abc: for j in 0 to bussize -1 generate
    --    sum(0)(j) <= y(0) and x(j);
    --end generate;
    --p(bussize*2 - 1) <= cout(bussize-1) ;
    --p((bussize*2 - 2) downto (bussize -1)) <=sum(bussize-1)((bussize -1) downto 0);

    --p((bussize*2 - 1) downto (bussize -1)) <= (cout(bussize-1) ,sum(bussize-1)((bussize -1) downto 0));
    p((bussize*2 - 1) downto (bussize-1)) <= (cout(bussize-1) & sum(bussize-1)((bussize -1) downto 0));


    nbitadders: FOR i IN 0 TO bussize-2 GENERATE 
        --                   (x            ,y                                        ,s       , cin,cout     )
        ci: n_adder PORT MAP ((andbit(y(i+1),x)), (cout(i) & sum(i)(bussize-1 downto 1)),sum(i+1) , '0', cout(i+1));
        p(i) <= sum(i)(0);
    END GENERATE nbitadders; 
END multiplier_rtl;