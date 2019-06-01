--Exercício 7.6.6
--Multiplicador
--Descrição:
--

ARCHITECTURE multiplier_rtl OF multiplier IS
    SIGNAL p2,p1 : std_logic_vector (0 to 2); -- vai um interno 
    SIGNAL p1b,p0b : std_logic_vector (1 to 2); -- vai um interno 
    SIGNAL c1,c0 : std_logic_vector (1 to 3); -- vai um interno 
BEGIN   
    p(0) <= a(0) and b(0);
    p2(0) <= a(2) and b(0);
    p1(0) <= a(1) and b(0);
    p1b(1) <= a(1) and b(1);
    p1b(2) <= a(1) and b(2);
    p0b(1) <= a(0) and b(1);
    p0b(2) <= a(0) and b(2);
    --abc: FOR i IN 0 TO 2 GENERATE 
    --    c1: som_1a PORT MAP (p2(i),a(1) and b(i+1), c1(i+1), p1(i+1), c(i+1));
    --END GENERATE abc; 
    c10: adder PORT MAP( p2(0), p1b(1), '0' , p1(1), c1(1)); 
    c11: adder PORT MAP( p2(1), p1b(2), c1(1), p1(2), c1(2)); 
    c12: adder PORT MAP( p2(2), c0(3) , c1(2), p(4) , p(5));

    c00: adder PORT MAP( p1(0), p0b(1), '0' , p(1), c0(1));
    c01: adder PORT MAP( p1(1), p0b(2), c0(1), p(2), c0(2)); 
    c02: adder PORT MAP( p1(2), '0'   , c0(2), p(3), c0(3));
END multiplier_rtl;
