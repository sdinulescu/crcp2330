# PARSER MODULE
# Stejara Dinulescu


class Parser:
    command = ""  # type: str

    # constructor
    def __init__(self, read_file):
        print('parser object created')
        my_text = read_file.readlines()  # reads to whole text file, skipping first 4 lines
        pass

    # file still has more to parse?
    @property
    def has_more_commands(self):
        # if ():
            return 0

    def advance(self):
        # Reads the next command from the input and makes it the current command.
        # Should be called only if hasMoreCommands() is true.
        # Initially there is no current command
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



