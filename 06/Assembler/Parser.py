# PARSER MODULE
# Stejara Dinulescu


class Parser:
    command = ""
# constructor for parser module -> opens input file and gets ready to parse it

    def hasMoreCommands(self):
        #if (): #file still has more to parse
            return 0


    def advance(self):
        # Reads the next command from the input and makes it the current command.
        # Should be called only if hasMoreCommands() is true.
        # Initially there is no current command
        return

    # returns the command type
    def commandType(self):
        type = ""
        if (self.command.get_value(0) == "@"): type = "A_COMMAND"
        if ("=" in self.command): type = "C_COMMAND"
        if (";" in self.command): type = "C_COMMAND"
        else: type = "L_COMMAND"
        return type


    def symbol(self):
        # only when command type is A or L
        symb = ""
        return symb


    def dest(self):
        # only called when command type is C
        d = ""
        return d


    def comp(self):
        # only called when command type is C
        c = ""
        return c

    def jump(self):
        # only called when command type is C
        j = ""
        return j



