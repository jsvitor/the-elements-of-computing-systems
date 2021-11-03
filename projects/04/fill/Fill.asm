// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here. josé vitor
(INICIO)
  // @24576 = RAM[24576] = keyboard = teclado
  @24576
  D = A
  @teclado
  M = D
(VERIFICA_TECLADO)
  // Coloca o valor atual para o último pixel da tela mapeado
  @24575
  D = A
  @atual
  M = D // RAM[atual] = 24575
  // se o teclado for pressionado, será diferente de 0.
  // Então preencha a tela com branco.
  @teclado
  A = M
  D = M
  @valor_de_preenchimento
  M = -1
  @PINTE
  D;JNE
  // se não, limpe a tela
  @valor_de_preenchimento
  M = 0
(PINTE)
  // Preenha ou limpe o pixel atual, dependendo do valor_de_preenchimento
  @valor_de_preenchimento
  D = M
  @atual
	A = M
	M = D
	// Se for o primeiro pixel, não resta nada pra pintar,
  // então volte para o verificador do teclado
	@atual
	D = M
	@16384
	D = D - A
	@VERIFICA_TECLADO
	D;JLE
	// Decrementa o pixel atual
	@atual
	M = M - 1
	// continue "pintando" o próximo pixel.
	@PINTE
	0;JMP
