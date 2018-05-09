// SYMBOL TABLE MODULE
// Stejara Dinulescu

  
import java.util.*;

class SymbolTable {
  
  HashMap<String,String> hm = new HashMap<String,String>();
  String backwards = "";
    
  SymbolTable() {  }
    
  void addEntry(String symbol, String address){ // adds the pair to the table
      hm.put(symbol, address);
      //println("Entry added! Symbol: " + symbol + " Address: " + address);
  }
    
  // returns whether or not symbol is in the hash table already
  boolean contains(String symbol){
    if ( hm.get(symbol) == null ) { return false; }
    else {  return true; }
  }  

  // finds the address of the symbol
  String getAddress(String symbol){
      String address = hm.get(symbol);
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
  
  String handleA(String num) {
    String forwards = "";
    String bit = "0";
    int n = Integer.parseInt(  num   );
    bit = numToBinary(n, forwards);
    for (int i = 0; i < (16 - backwards.length()); i++) { //converts into 16 bit word
      bit = "0" + bit;
    }
    bit = bit + forwards;
    return bit;
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
