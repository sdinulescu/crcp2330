// whatever file the assembler will read in to parse

String input_file = "Max.asm";
PrintWriter output_file;
String bit = "";

Parser parser; 
Code code;
SymbolTable symbolTable;

String  assemble(String comp, String dest, String jump) {
  return ("111" + comp + dest + jump);
}

boolean isNumeric(String string) {  //checks if it is a numeric A command (ex. @1) or if it is a symbol (ex. @R1)
  try {  int d = Integer.parseInt(string);  }  
  catch(NumberFormatException nfe) {  return false;  }  
  return true;  
}

boolean isLabel(String s) {
  if ( s.matches(".*\\d+.*") ) {
    return false;
  } else { return true; }
}
  

String removeCharAt(String s, int pos) {
  if (pos == 0) {  return s.substring(1, s.length());  }
  else {  return s.substring(0,pos)+s.substring(pos+1);  }
}

String removeSpaces(String s) {
  String str = "";
  for (int i = 0; i < s.length(); i++) {
    if ( s.substring(i, i+1).equals(" ") ) { }
    else {  str = str + s.substring(i, i+1);  }
  }
  return str;
}
String removeComments(String s) {
  String str = "";
  if ( s.contains("//") ) {
    int index = s.indexOf('/');
    str = s.substring(0, index);
    return str;
  } else {  return s;  }
}

void firstPass(Parser parser, SymbolTable symbolTable) { //puts everything into symbol table
  String address = "";
  int count = 0;
  println("first pass");
  for (int i = 0; i < parser.lines.size(); i++) {
    String o_str = parser.lines.get(i);
    String bin = "";
    o_str = removeSpaces(o_str);
    o_str = removeComments(o_str);
    parser.lines.set(i, o_str);
    println("o_str: " + o_str); 
    if (  o_str.contains("@") && isNumeric( o_str.substring( 1, o_str.length() ) ) == false && isLabel(o_str) == false )  { //symbol or label
      //str = removeSpaces(str);
      //str = removeComments(str);
      if (o_str.charAt(1) == 'R') { // @memoryAddress, parse into binary to put in symbol table
        bin = o_str.substring(2, o_str.length());
        address = symbolTable.handleA(bin);
      } 
      //check if symbol is in the table
      println(symbolTable.contains(  o_str  ) );
      if (  symbolTable.contains(  o_str  )  == false ) { // if it is not in the table, add it
        symbolTable.addEntry(  o_str,  address );
      }
    } else if ( o_str.contains("@") && isLabel(o_str) == true) {
      String designatedAddress = "1" + count;
      count += 2;
      println("designatedAddress: " + designatedAddress);
      designatedAddress = symbolTable.handleA(  designatedAddress  );
      println("designatedAddress: " + designatedAddress);
      symbolTable.addEntry(  o_str, designatedAddress  );
    }
  }
  println("SymbolTable: " + symbolTable.hm);
}

void secondPass(Parser parser, Code code) {
  println("second pass");
  while (parser.has_more_commands() == true) {
    bit = "";
    String line = parser.advance();
    String ctype = parser.command_type();
    println("line: " + line);
    println("ctype: " + ctype);
    if (  ctype.equals("C_COMMAND")  ) { //C Commands
      //println("comp: " + parser.comp(line) + " dest: " + parser.dest(line) + " jump: " + parser.jump(line) );
      //println(  "comp: " + code.comp(  parser.comp(line)  ) + " dest: " + code.dest(  parser.dest(line)  ) + " jump: " + code.jump(  parser.jump(line)  )  );
      bit = assemble(code.comp(parser.comp(line)), code.dest(parser.dest(line)), code.jump(parser.jump(line)));
    } else if (  ctype.equals("A_COMMAND")   ) { //A Commands
      if ( isNumeric (ctype) ) {
        bit = parser.handleA(line);
      } else {
        println("check symbol table");
        if (symbolTable.contains(line)) {
        bit = symbolTable.hm.get(line);
        } else { 
          println("not in symbolTable"); 
          ctype = "L_COMMAND";
          parser.labels.add(line.substring(1, line.length()));
        }
        println("bit from symbolTable: " + bit);
      }
    } 
    output_file.write(bit);
    println("ctype: " + ctype);
    if (  ctype.equals("L_COMMAND") && !line.contains("(") ) { // handle label
      output_file.write(bit);
      bit = symbolTable.hm.get(line);
    }
    
    output_file.close(); //close the file
  }
}

void setup() {
  output_file = createWriter("output_MAX.hack");
  // instance of the code module
  code = new Code();
  // instance of the parser module, taking in the input file
  parser = new Parser(input_file);
  // instance of the symbol table module
  symbolTable = new SymbolTable();
  
  firstPass(parser, symbolTable);
  secondPass(parser, code);

}
