
# NumberGeneratorFPGAProject
Implementation of pseudo-random number Generator using logistic map on FPGA. 

<p align="center">
  <a href="Logistic Map">
    <img src="https://github.com/brunayfy/NumberGeneratorFPGAProject/blob/master/imgs/LogisticMap.jpg?raw=true" />
  </a>
</p>

Implement:
* Multiplier implemented using FOR GENERATE based on exercise 7.6.6 of D'Amore book.
* Mux using concurrent statement: WITH-SELECT.
* Subtractor using FOR GENERATE with component for full subtractor. 
* Left shift (<<2) using FUNCTION.
* FF type D using PROCEDURE.

# How it works:

x(i+1) = r * x(i) * (1 - x(i))

being:

0 < r    <= 4 (being 4 the maximum caos)

0 < x(i) <1

So that x(i+1) is:

x(i+1) = 4 * x(i) * (1 -x(i))

x(i+1) = x(i) * (1 -x(i)) <<2

# Research :
Fixed point(Q-format) Q.N(number of bits)
