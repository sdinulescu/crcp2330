// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


//Multiplying R0 * R1: R1 is the loop number, R0 is what we are adding over and over again

@R2		//R2 is the cummulative addition (product)
M=0   	//R2 is 0 initially

//Set a variable num = whatever R1 is so that we can store and subtract 1 from the loop number with each iteration of the loop
@1		//accesses address of R1
D=M 	//R1 is now stored into D register
@num 	//variable to store number of times it loops
M=D 	//set it equal to D register (R1)


(LOOP)
	@num 		//accesses address of num in the A register
	D=M 		//stores whatever num is into the D register
	@END 		
	D;JEQ 		//stop if num becomes 0

	@1  		//accesses R1 (how many times we are adding)
	D=D-A   	//subtracts 1 from R1, stores it in D register
	@num
	M=D 		//sets num to whatever is in D register (num - 1)

	@2			//address of R2 (whatever is the cummulative product currently)
	D=M 		//grab value of whatever is in R2 and store it into D register
	@0 			//address of R0 (whatever we are trying to multiply)
	D=D+M 		//add whatever is in R0 to the D register
	@2
	M=D 		//stores the sum back into R0
	
	//loop from beginning
	@LOOP
	0;JMP 	//Go to LOOP

(END)
	@END
	0;JMP
	
