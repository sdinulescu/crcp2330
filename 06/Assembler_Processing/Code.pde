// CODE MODULE
// Stejara Dinulescu

class Code {
  // constructor
  Code() { }

  // returns whether or not it is an A command
  int decide_a(String line) {
    int a = 0;
    if ( line.contains("D")) { 
      a = 1;
    }
    return a;
  }

  // returns binary code of dest
  int dest(String d) {
    int bit = 0;
    if (d == "null") { 
      bit = 000;
    } else if (d == "M") { 
      bit = 001;
    } else if (d == "D") { 
      bit = 010;
    } else if (d == "MD") { 
      bit = 011;
    } else if (d == "A") { 
      bit = 100;
    } else if (d == "AM") { 
      bit = 101;
    } else if (d == "AD") { 
      bit = 110;
    } else if (d == "AMD") { 
      bit = 111;
    }
    return bit;
  } 

  // returns binary code of comp
  int comp(String c) {
    int bit = 0;
    int a = decide_a(c);
    if (a == 0) {
      if (c == "0") { 
        bit = 101010;
      } else if (c == "1") { 
        bit = 111111;
      } else if (c == "-1") { 
        bit = 111010;
      } else if (c == "D") { 
        bit = 001100;
      } else if (c == "A") { 
        bit = 110000;
      } else if (c == "!D") { 
        bit = 001101;
      } else if (c == "!A") { 
        bit = 110001;
      } else if (c == "-D") { 
        bit = 001111;
      } else if (c == "-A") { 
        bit = 110011;
      } else if (c == "D+1") { 
        bit = 011111;
      } else if (c == "A+1") { 
        bit = 110111;
      } else if (c == "D-1") { 
        bit = 001110;
      } else if (c == "A-1") { 
        bit = 110010;
      } else if (c == "D+A") { 
        bit = 000010;
      } else if (c == "D-A") { 
        bit = 010011;
      } else if (c == "A-D") { 
        bit = 000111;
      } else if (c == "D&A") { 
        bit = 000000;
      } else if (c == "D|A") { 
        bit = 010101;
      }
    } else {
      if (c == "M") { 
        bit = 110000;
      } else if (c == "!M") { 
        bit = 110001;
      } else if (c == "-M") { 
        bit = 110011;
      } else if (c == "M+1") { 
        bit = 110111;
      } else if (c == "M-1") {  
        bit = 110010;
      } else if (c == "D+M") { 
        bit = 000010;
      } else if (c == "D-M") { 
        bit = 010011;
      } else if (c == "M-D") { 
        bit = 000111;
      } else if (c == "D&M") { 
        bit = 000000;
      } else if (c == "D|M") { 
        bit = 010101;
      }
    }
    return bit;
  }

  // returns binary code of jump
  int jump(String j) {
    int bit = 0;
    if (j == "null") { 
      bit = 000;
    } else if (j == "JGT") { 
      bit = 001;
    } else if (j == "JEQ") { 
      bit = 010;
    } else if (j == "JGE") { 
      bit = 011;
    } else if (j == "JLT") { 
      bit = 100;
    } else if (j == "JNE") { 
      bit = 101;
    } else if (j == "JLE") { 
      bit = 110;
    } else if (j == "JMP") { 
      bit = 111;
    }
    return bit;
  }
}
