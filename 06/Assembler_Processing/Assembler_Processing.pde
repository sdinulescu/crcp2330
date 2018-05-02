// whatever file the assembler will read in to parse
String input_file = "MaxL.asm";
PrintWriter output_file;

String  assemble(int a, int comp, int dest, int jump) {
  String a_s = "" + a;
  String comp_s = "" + comp;
  String dest_s = "" + dest;
  String jump_s = "" + jump;
  return ("111" + a_s + comp_s + dest_s + jump_s);
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
    if (ctype == "C_COMMAND") { //C Commands
      String bit = assemble(code.decide_a(line), code.comp(line), code.dest(line), code.jump(line));
      println(bit);
      //output_file.println(bit);
    } else { //A Commands
    }
  }
}
