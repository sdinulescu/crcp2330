// SYMBOL TABLE MODULE
// Stejara Dinulescu

  
import java.util.*;

class SymbolTable {
  
  HashMap<String,Integer> hm = new HashMap<String,Integer>();
  String backwards = "";
    
  SymbolTable() {  }
    
  void addEntry(String symbol, int address){ // adds the pair to the table
      hm.put(symbol, address);
      println("Entry added! Symbol: " + symbol + " Address: " + address);
  }
    
  // returns whether or not symbol is in the hash table already
  boolean contains(String symbol){
    try {  hm.get(symbol);  }  
    catch(NumberFormatException nfe) {  
      println("not in table");
      return false;  
    }  
    return true; 
  }  

  // finds the address of the symbol
  int getAddress(String symbol){
      int address = hm.get(symbol);
      return address;
  }
  
  // returns hexa value if it is a predefined symbol
  String predefined(String s){
      String hexa = "";
      if ( s.equals("SP") ) { hexa = "0x0000"; } 
      else if ( s.equals("LCL") ) { hexa = "0x0001"; }
      else if ( s.equals("ARG") ) { hexa = "0x0002"; }
      else if ( s.equals("THIS") ) { hexa = "0x0003"; }
      else if ( s.equals("THAT") ) { hexa = "0x0004"; }
      else if ( s.equals("SCREEN") ) { hexa = "0x4000"; }
      else if ( s.equals("KBD") ) { hexa = "0x6000"; }
      else if ( s.substring(0, 1).equals("R") ) { hexa = "0x000-f"; }
      return hexa;
  }
  
  String numToBinary(int num, String bit) {
    String bin = "";
    int n = num/2;
    int quotient = num%2;
    bin = bit + quotient;
    backwards = bin;
    if (num >= 2) {
      numToBinary(n, bin);
    }
    String done = flipBinary(backwards);
    return done;
  }
  
  String flipBinary(String b) {
    String binary = "";
    for (int i = b.length() - 1; i >= 0; i--) {
      binary = binary + b.charAt(i);
    }
    return binary;
  }
    
}
