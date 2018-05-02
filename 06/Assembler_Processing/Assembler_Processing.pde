// whatever file the assembler will read in to parse
String input_file = "MaxL.asm";
String output_file = "test.txt";

void setup() {
    // instance of a code module
    Code code = new Code();
    // instance of a parser module, taking in the input file
    Parser parser = new Parser(input_file);

    while (parser.has_more_commands() == true){
        String line = parser.advance();
        //ctype = parser.command_type(line)
        //print(ctype)
        //if ctype is "C_COMMAND":
            //print("C")
            //bit = assemble(code.decide_a(line), code.comp(line), code.dest(line), code.jump(line))
            //output_file.write(bit)
        //else:
            //print('A_COMMAND')
            
    }
}
