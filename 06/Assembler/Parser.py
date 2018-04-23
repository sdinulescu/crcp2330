# PARSER MODULE
# Stejara Dinulescu


class Parser:
    command = ""  # type: str
    curr_file = ""

    # constructor
    def __init__(self, read_file):
        print('parser object created')
        self.curr_file = read_file
        pass

    # file still has more to parse?
    @property
    def has_more_commands(self):
        if self.curr_file is None: # if eof
            return 1
        else:
            return 0

    # Reads the next command from the input and makes it the current command.
    # Should be called only if has_more_commands() is true, initially there is no current command
    def advance(self):
        if self.has_more_commands() is 0:
            self.curr_file.read()
        return

    # returns the command type
    @property
    def command_type(self):
        t = ""
        if self.command.get_value(0) == "@":
            t = "A_COMMAND"
        if "=" in self.command:
            t = "C_COMMAND"
        if ";" in self.command:
            t = "C_COMMAND"
        else:
            t = "L_COMMAND"
        return t

    @property
    def symbol(self):
        # only when command type is A or L
        symb = ""
        return symb

    @property
    def dest(self):
        # only called when command type is C
        d = ""
        return d

    @property
    def comp(self):
        # only called when command type is C
        c = ""
        return c

    @property
    def jump(self):
        # only called when command type is C
        j = ""
        return j



