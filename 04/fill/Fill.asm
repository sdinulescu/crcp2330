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


//RAM[24576] is where key pressed on the physical keyboard

// Put your code here.




(LOOP)
	@KBD
	D=M 			//grabs whether or not a key is pressed
	@BLACK
	D;JNE 			//go to black if out doesn't equal 0 (if key is pressed)

(WHITE)
	@SCREEN
	M=0 			//fill with white


(BLACK)
	@SCREEN
	M=-1 			//fill with black
	@END
	0;JMP


(END)
	@LOOP
	0;JMP 			//infinite loop
