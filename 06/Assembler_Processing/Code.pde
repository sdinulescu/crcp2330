// CODE MODULE
// Stejara Dinulescu

class Code {
  // constructor
  Code() { }

  // returns whether or not it is an A command
  String decide_a(String line) {
    String a = "0";
    if ( line.contains("M")) { 
      //println("a = 1");
      a = "1";
    } else { 
      //println("a = 0"); 
    }
    return a;
  }

  // returns binary code of dest
  String dest(String d) {
    String bit = "";
    if (d.equals("null")) { 
      bit = "000";
    } else if (d.equals("M")) { 
      bit = "001";
    } else if (d.equals("D")) { 
      bit = "010";
    } else if (d.equals("MD")) { 
      bit = "011";
    } else if (d.equals("A")) { 
      bit = "100";
    } else if (d.equals("AM")) { 
      bit = "101";
    } else if (d.equals("AD")) { 
      bit = "110";
    } else if (d.equals("AMD")) { 
      bit = "111";
    }
    return bit;
  } 

  // returns binary code of comp
  String comp(String c) {
    String bit = "";
    String a = decide_a(c);
    if (a.equals("0")) {
      //println("a is 0");
      if (c.equals("0")) { 
        bit = "101010";
      } else if (c.equals("1")) { 
        bit = "111111";
      } else if (c.equals("-1")) { 
        bit = "111010";
      } else if (c.equals("D")) { 
        bit = "001100";
      } else if (c.equals("A")) { 
        bit = "110000";
      } else if (c.equals("!D")) { 
        bit = "001101";
      } else if (c.equals("!A")) { 
        bit = "110001";
      } else if (c.equals("-D")) { 
        bit = "001111";
      } else if (c.equals("-A")) { 
        bit = "110011";
      } else if (c.equals("D+1")) { 
        bit = "011111";
      } else if (c.equals("A+1")) { 
        bit = "110111";
      } else if (c.equals("D-1")) { 
        bit = "001110";
      } else if (c.equals("A-1")) { 
        bit = "110010";
      } else if (c.equals("D+A")) { 
        bit = "000010";
      } else if (c.equals("D-A")) { 
        bit = "010011";
      } else if (c.equals("A-D")) { 
        bit = "000111";
      } else if (c.equals("D&A")) { 
        bit = "000000";
      } else if (c.equals("D|A")) { 
        bit = "010101";
      }
    } else {
      //println("a is 1");
      if (c.equals("M")) { 
        bit = "110000";
      } else if (c.equals("!M")) { 
        bit = "110001";
      } else if (c.equals("-M")) { 
        bit = "110011";
      } else if (c.equals("M+1")) { 
        bit = "110111";
      } else if (c.equals("M-1")) {  
        bit = "110010";
      } else if (c.equals("D+M")) { 
        bit = "000010";
      } else if (c.equals("D-M")) { 
        bit = "010011";
      } else if (c.equals("M-D")) { 
        bit = "000111";
      } else if (c.equals("D&M")) { 
        bit = "000000";
      } else if (c.equals("D|M")) { 
        bit = "010101";
      }
    }
    String s = "" + a + bit;
    return s;
  }

  // returns binary code of jump
  String jump(String j) {
    String bit = "0";
    if (j.equals("null")) { 
      bit = "000";
    } else if (j.equals("JGT")) { 
      bit = "001";
    } else if (j.equals("JEQ")) { 
      bit = "010";
    } else if (j.equals("JGE")) { 
      bit = "011";
    } else if (j.equals("JLT")) { 
      bit = "100";
    } else if (j.equals("JNE")) { 
      bit = "101";
    } else if (j.equals("JLE")) { 
      bit = "110";
    } else if (j.equals("JMP")) { 
      bit = "111";
    }
    return bit;
  }
}
