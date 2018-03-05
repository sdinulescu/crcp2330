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

//figure out how to multiply for the whole screen -> total is 8192 16-bit registers

@8192
D=A 				//set D register to 8192

@var 				//var is a counter variable
M=D 				//var = 8192

(LOOP)
	@pos 			//variable for position on the screen
	M=0 			//starts at 0, will increment to get all pixels on screen

(KEY)
	@KBD
	D=M 			//grabs whether or not a key is pressed
	@WHITE
	D;JEQ 			//go to white if out equals 0 (key not pressed)

(BLACK)				//fill with black
	@pos 			//find position we are in
	D=M 			//load it into the D register

	@SCREEN  		
	A=A+D 			//set screen to whatever register position
	M=-1 	 		//set it to black
	
	@END 			//go to end in order to increment position and decrease var
	0;JMP	

//white is initial state
(WHITE) 			//fill with white
	@pos			//find the pos
	D=M

	@SCREEN 
	A=A+D 			//calculate the position
	M=0 			//fill with white
	
(END)
	@pos 			//increment position (to change the whole screen)
	D=M
	D=D+1
	M=D

	@var 			//decrease var ("counter")
	D=D-M

	@LOOP
	D;JEQ 			//if var-pos == 0, go to loop (if whole screen is filled)

	@KEY
	0;JMP 			//infinite loop
