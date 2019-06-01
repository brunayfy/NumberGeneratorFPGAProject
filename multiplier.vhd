--Exercício 7.6.6
--Multiplicador
--Descrição:
--
ENTITY multiplier IS
    PORT (a, b : IN BIT_VECTOR(2 DOWNTO 0); -- entradas do multiplicador
        p : OUT BIT_VECTOR(5 DOWNTO 0)); -- multiplicacao
END multiplier;

ARCHITECTURE multiplier_rtl OF multiplier IS
    SIGNAL p2,p1 : BIT_VECTOR (0 to 2); -- vai um interno 
    SIGNAL p1b,p0b : BIT_VECTOR (1 to 2); -- vai um interno 
    SIGNAL c1,c0 : BIT_VECTOR (1 to 3); -- vai um interno 
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
    c10: adder PORT MAP( p2(0), p1b(1), OPEN , p1(1), c1(1)); 
    c11: adder PORT MAP( p2(1), p1b(2), c1(1), p1(2), c1(2)); 
    c12: adder PORT MAP( p2(2), c0(3) , c1(2), p(4) , p(5));

    c00: adder PORT MAP( p1(0), p0b(1), OPEN , p(1), c0(1));
    c01: adder PORT MAP( p1(1), p0b(2), c0(1), p(2), c0(2)); 
    c02: adder PORT MAP( p1(2), '0'   , c0(2), p(3), c0(3));
END multiplier_rtl;
