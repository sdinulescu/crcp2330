// whatever file the assembler will read in to parse
String input_file = "MaxL.asm";
PrintWriter output_file;
String bit = "";

String  assemble(String comp, String dest, String jump) {
  return ("111" + comp + dest + jump);
}

void setup() {
  output_file = createWriter("output.hack");
  // instance of a code module
  Code code = new Code();
  // instance of a parser module, taking in the input file
  Parser parser = new Parser(input_file);

  while (parser.has_more_commands() == true) {
    String line = parser.advance();
    String ctype = parser.command_type();
    //println(ctype);
    if (  ctype.equals("C_COMMAND")  ) { //C Commands
      //println("comp: " + parser.comp(line) + " dest: " + parser.dest(line) + " jump: " + parser.jump(line) );
      //println(  "comp: " + code.comp(  parser.comp(line)  ) + " dest: " + code.dest(  parser.dest(line)  ) + " jump: " + code.jump(  parser.jump(line)  )  );
      bit = assemble(code.comp(parser.comp(line)), code.dest(parser.dest(line)), code.jump(parser.jump(line)));
    } else if (  ctype.equals("A_COMMAND")  ) { //A Commands
      bit = parser.handleA(line);
    } else {}
    println("bit: " + bit);
    if (bit.equals("")) {} else { output_file.println(bit); } //print each bit as a line to the output file, ignore whitespace
  }
  
  output_file.close(); //close the file
}
