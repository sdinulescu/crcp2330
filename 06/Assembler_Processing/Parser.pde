// PARSER MODULE
// Stejara Dinulescu

class Parser {
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
    } else { return "eof"; }
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
      }
      else { return "Must be called on an L_COMMAND"; }
  }

  String dest(String s) {
      // only called when command type is C
      String d = "";
      if (type.get(curr_num) == "C_COMMAND") { 
        //DO SOMETHING HERE
        return d; 
      }
      else { return "Must be called on a C_COMMAND"; }
  }

  String comp(String s) {
      // only called when command type is C
      String c = "";
      if (type.get(curr_num) == "C_COMMAND") { 
        return c; 
      }
      else { return "Must be called on a C_COMMAND"; }
  } 

  String jump(String s) {
      // only called when command type is C
      String j = ""; 
      if(type.get(curr_num) == "C_COMMAND") { 
        return j; 
      }
      else { return "Must be called on a C_COMMAND"; }
  }
}
