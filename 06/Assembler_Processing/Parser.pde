// PARSER MODULE
// Stejara Dinulescu
class Parser {
    String curr_file = "";
    ArrayList<String> lines = new ArrayList<String>();
    int num = 0;
    int curr_num = 0;

    // constructor
    Parser(String read_file){
        println("parser object created");
        println(read_file);
        curr_file = read_file;
        String[] l = loadStrings(read_file); //each line of text file becomes a slot in the array
        for (int i = 0; i < l.length; i++) {
          String s = l[i];
          lines.add(s);
        }
        print(lines);
    }

    // file still has more to parse?
    boolean has_more_commands(){
        print(curr_num);
        print(num);
        if (num == curr_num){
            println("stop");
            return false;
        } else {
            println("keep going");
            return true;
        }
    }

    // Reads the next command from the input and makes it the current command.
    // Should be called only if has_more_commands() is true, initially there is no current command
    String advance(){
        if (curr_num < num) {
            curr_num++;
            println("advance file");
            if ( !lines.get(curr_num).contains("//")  ) {
                // print("good line");
                print(lines.get(curr_num));
                return lines.get(curr_num);
            } else {
                // print("commented line");
                return "0";
            }
        } else {
            print("no more lines");
            return "eof";
        }
    }
    
    // returns the command type
    //String command_type(String line) {
    //    String t = "";
    //    if (lines.get(line).contains('@') ) { t = "A_COMMAND"; }
    //    else if (line) { t = "C_COMMAND"; }
    //    else if (';' in line_ { t = "C_COMMAND"; }
    //    else { t = "L_COMMAND"; }
    //    return t;
    //}
    
    //string symbol(string s) {
    //    // only when command type is A or L
    //    string s = ""
    //    if (s.command_type == "A_COMMAND" || s.command_type == "L_COMMAND") { return s; }
    //    else { return "Must be called on an L_COMMAND"; }
    //}
    
    //string dest(string s) {
    //    // only called when command type is C
    //    string d = "";
    //    if (s.command_type == "C_COMMAND") { return d; }
    //    else { return "Must be called on a C_COMMAND"; }
    //}
    
    //string comp(string s) {
    //    // only called when command type is C
    //    string c = "";
    //    if (s.command_type == "C_COMMAND") { return c; }
    //    else { return "Must be called on a C_COMMAND"; }
    //} 
    
    //void jump(string s) {
    //    // only called when command type is C
    //    j = ""
    //    if s.command_type == "C_COMMAND" { return j; }
    //    else { return "Must be called on a C_COMMAND"; }
    //}


}
