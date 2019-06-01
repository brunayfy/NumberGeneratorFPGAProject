ENTITY adder IS
  PORT   (a, b, ve  : IN  BIT;
          s, vs     : OUT BIT); 
END adder;

ARCHITECTURE teste OF adder IS
BEGIN
  s  <=  a XOR b  XOR ve;                      -- soma
  vs <= (a AND b) OR (a AND ve) OR (b AND ve); -- vai um
END teste;