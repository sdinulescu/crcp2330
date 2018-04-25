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
        if self.curr_file is None:  # if eof
            return 1
        else:
            return 0

    # Reads the next command from the input and makes it the current command.
    # Should be called only if has_more_commands() is true, initially there is no current command
    def advance(self):
        if self.has_more_commands is 0:
            self.curr_file.read()
        return

    # returns the command type
    @property
    def command_type(self):
        t = ""
        if "@" in self.command:
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
        s = ""
        if self.command_type is "A_COMMAND" or "L_COMMAND":
            return s
        else:
            return "Must be called on an L_COMMAND"

    @property
    def dest(self, string):
        # only called when command type is C
        d = ""
        if string.command_type is "C_COMMAND":
            return d
        else:
            return "Must be called on a C_COMMAND"

    @property
    def comp(self, string):
        # only called when command type is C
        c = ""
        if string.command_type is "C_COMMAND":
            return c
        else:
            return "Must be called on a C_COMMAND"

    @property
    def jump(self, string):
        # only called when command type is C
        j = ""
        if string.command_type is "C_COMMAND":
            return j
        else:
            return "Must be called on a C_COMMAND"




