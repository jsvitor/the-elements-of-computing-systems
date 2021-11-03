// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here. → jose vitor
// declarar as variáveis R0, R1 e R2.


(INICIO)
  // Inicializando R2, onde será armazenado o produto
  @R2
  M = 0 // RAM[2] = 0, atribue o valor 0 a RAM[2].

(REPETIR) // Enquanto R1 for menor ou igual a 0, some R0 com R2
  // 3 x 4 = 12 → 4 + 4 + 4 = 3 + 3 + 3 → toda multiplicação é uma soma.
  // IF R1 <= 0, finalizar.
  @R1
  D = M
  @FIM
  D;JLE // JUMP LESS OR EQUAL
  // SOMA R0 a R2.
  @R0
  D = M
  @R2
  M = M + D // ONDE M=R2 e D=R0
  // Decrementa R1
  @R1
  M = M - 1
  // PULE PARA REPETIR (LOOP)
  @REPETIR
  0;JMP
(FIM)
  // finalizar. Adiciona um loop infinito, para evitar código malicioso.
  @FIM
  0;JMP
