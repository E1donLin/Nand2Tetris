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

// Put your code here.
  // screenend = 24575
  @24575
  D = A
  @screenend
  M = D

  // current = current index on screen
  @SCREEN
  D = A
  @current
  M = D
  
(LOOP)
  // if (KBD > 0) goto FILL else goto CLEAR
  @KBD
  D = M
  @FILL
  D;JGT
  @CLEAR
  0;JMP

(FILL)
  // set cufrent pixel to black
  @current
  D = M
  A = M
  M = -1

  @current
  M = D + 1

  @LOOP
  0;JMP

(CLEAR)
  // set current pixel to white
  @current
  D = M
  A = M
  M = 0

  @current
  M = D - 1
  @LOOP
  0;JMP