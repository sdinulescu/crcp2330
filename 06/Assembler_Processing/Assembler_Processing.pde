// whatever file the assembler will read in to parse

String input_file = "Max.asm";
PrintWriter output_file;
String bit = "";

String  assemble(String comp, String dest, String jump) {
  return ("111" + comp + dest + jump);
}

boolean isNumeric(String string) {  
  try {  int d = Integer.parseInt(string);  }  
  catch(NumberFormatException nfe) {  return false;  }  
  return true;  
}

String removeCharAt(String s, int pos) {
  if (pos == 0) {  return s.substring(1, s.length());  }
  else {  return s.substring(0,pos)+s.substring(pos+1);  }
}

void firstPass(Parser parser, SymbolTable symbolTable) {
  println("first pass");
  for (int i = 0; i < parser.lines.size(); i++) {
    String str = parser.lines.get(i);
    println("str: " + str);
    println("does it contain @?: " + parser.lines.get(i).contains("@"));
    println("is it numeric?: " + isNumeric( parser.lines.get(i).substring( 0, str.length() ) ) );
    if (  str.contains("//")  ) { 
      println("commented line, ignore"); 
    } else if (  str.contains("@") && isNumeric( str.substring( 1, str.length() ) ) == false  )  { //symbol
      str = removeCharAt(str, str.indexOf('@'));
      println("SYMBOL: " + str);
      //check if symbol is in the table
      if (  symbolTable.contains(  str.substring(  1, str.length() - 1 )  )  == false ) { // if it is not in the table, add it
        println("Not in table");
        String num = symbolTable.numToBinary(  Integer.parseInt( str.substring(str.length() - 1, str.length() )), "");
        println("num: " + num);
        symbolTable.addEntry(  str.substring(1, str.length() - 1),  Integer.parseInt(num));
      }
    } else if ( str.contains("@") && isNumeric( str.substring( 1, str.length() ) ) == true ) { //label
       println("label");
    } 
  }
}

void secondPass(Parser parser, Code code) {
  println("second pass");
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

void setup() {
  output_file = createWriter("output.hack");
  // instance of the code module
  Code code = new Code();
  // instance of the parser module, taking in the input file
  Parser parser = new Parser(input_file);
  // instance of the symbol table module
  SymbolTable symbolTable = new SymbolTable();
  
  firstPass(parser, symbolTable);
  //secondPass(parser, code);

}
