
# NumberGeneratorFPGAProject
Implementation of pseudo-random number Generator using logistic map on FPGA. 

<p align="center">
  <a href="Logistic Map">
    <img src="https://github.com/brunayfy/NumberGeneratorFPGAProject/blob/master/imgs/LogisticMap.jpg?raw=true" />
  </a>
</p>

Implement:
* Multiplicador implementado utilizando FOR GENERATE baseado no exercício 7.6.6 do livro do D'Amore.
* Multiplexador utilizando construção concorrente: WHEN-ELSE ou WITH-SELECT
* Subtrator utilizando FOR GENERATE com COMPONENTE para o subtrator-completo 
* Deslocador para a esquerda (<<2) utilizando FUNCTION
* FF tipo D utilizando PROCEDURE

# How it works:
x(i+1) = r * x(i) * (1 - x(i))

0 < r    <= 4 (being 4 the maximum caos)
0 < x(i) <1

x(i+1) = 4 * x(i) * (1 -x(i))
x(i+1) = x(i) * (1 -x(i)) <<2

# Research :
Ponto fixo(Q-format) Q.N(number of bits)