// PARSER MODULE
// Stejara Dinulescu

class Parser {
  String backwards = "";
  String curr_file = "";
  ArrayList<String> lines = new ArrayList<String>();
  ArrayList<String> type = new ArrayList<String>();
  int num = 0;
  int curr_num = 0;

  // constructor
  Parser(String read_file) {
    curr_file = read_file;
    String[] l = loadStrings(read_file); //each line of text file becomes a slot in the array
    for (int i = 0; i < l.length; i++) {
      String s = l[i];
      lines.add(s);
    }
    num = lines.size();
  }

  // file still has more to parse?
  boolean has_more_commands() {
    curr_num++;
    if (num == curr_num) {
      println("eof");
      return false;
    } else {
      //println("keep going");
      return true;
    }
  }

  // Reads the next command from the input and makes it the current command.
  // Should be called only if has_more_commands() is true, initially there is no current command
  String advance() {
    if ( curr_num < num ) {
      //println("advance file");
      if ( !lines.get(curr_num).contains("//")  ) {
        // print("good line");
        println(lines.get(curr_num));
        return lines.get(curr_num);
      } else {
        //println("commented line");
        return "0";
      }
    } else { 
      return "eof";
    }
  }

  // returns the command type
  String command_type() {
    String t = "";
    if (  lines.get(curr_num).contains("@")  ) { 
      t = "A_COMMAND";
    } else if (  lines.get(curr_num).contains("=")   ||  lines.get(curr_num).contains(";")  ) { 
      t = "C_COMMAND";
    } else if (  lines.get(curr_num).contains("//")  ) { 
      t = "commented line";
    } else { 
      t = "L_COMMAND";
    }
    type.add(t);
    return t;
  }

  String symbol(String s) {
    // only when command type is A or L
    String str = ""; 
    if (type.get(curr_num) == "A_COMMAND" || type.get(curr_num) == "L_COMMAND") { 
      //DO SOMETHING HERE
      return str;
    } else { 
      return "Must be called on an L_COMMAND";
    }
  }

  String dest(String line) {
    // only called when command type is C
    String d = "";
    if ( line.contains(";") ) {
      d = "null";
    } else {
      d = line.substring(0, 1); 
    }
    return d;
  }

  String comp(String line) {
    // only called when command type is C
    String c = "";
    if ( line.contains("=") ) { 
      int index = line.indexOf("="); 
      c = line.substring(index+1, line.length());
    } else if ( line.contains(";") ) {
      c = line.substring(0, 1);
    } else { 
      c = "null";
    }
    return c;
  } 

  String jump(String line) {
    // only called when command type is C
    String j = ""; 
    if ( line.contains(";") ) { 
      int index = line.indexOf(";");
      j = line.substring(index+1, line.length());
    } else { 
      j = "null";
    }
    return j;
  }
  
  String handleA(String num) {
    String forwards = "";
    String bit = "0";
    int n = Integer.parseInt(  num.substring(  1, num.length()  )  );
    numToBinary(n, forwards);
    for (int i = backwards.length() - 1; i >= 0; i--) {
      forwards = forwards + backwards.charAt(i);
    }
    for (int i = 0; i < (15 - forwards.length()); i++) {
      bit = bit + "0";
    }
    bit = bit + forwards;
    return bit;
  }
  
  void numToBinary(int num, String bit) {
    String bin = "";
    int n = num/2;
    int quotient = num%2;
    bin = bit + quotient;
    backwards = bin;
    if (num >= 2) {
      numToBinary(n, bin);
    }
  }
}
