// whatever file the assembler will read in to parse
String input_file = "MaxL.asm";
PrintWriter output_file;

String  assemble(String comp, String dest, String jump) {
  return ("111" + comp + dest + jump);
}

void setup() {
  output_file = createWriter("output.txt");
  // instance of a code module
  Code code = new Code();
  // instance of a parser module, taking in the input file
  Parser parser = new Parser(input_file);

  while (parser.has_more_commands() == true) {
    String line = parser.advance();
    String ctype = parser.command_type();
    println(ctype);
    print();
    if (  ctype.equals("C_COMMAND")  ) { //C Commands
      String dest = parser.dest(line);
      String comp = parser.comp(line);
      String jump = parser.jump(line);
      println("comp = " + comp + " dest = " + dest + " jump = " + jump);
      
      String bit = assemble(code.comp(comp), code.dest(dest), code.jump(jump));
      println("comp: " + code.comp(comp) + " dest: " + code.dest(dest) + " jump: " + code.jump(jump));
      println("bit = " + bit);
      //output_file.println(bit);
    } else if (  ctype.equals("A_COMMAND")  ) { //A Commands
      
    
    }
  }
}
