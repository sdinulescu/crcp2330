# PARSER MODULE
# Stejara Dinulescu


class Parser:
    command = ""  # type: str
    curr_file = ""
    lines = ""
    num = 0
    curr_num = 0

    # constructor
    def __init__(self, read_file):
        print("parser object created")
        print(read_file)
        self.curr_file = read_file
        self.lines = read_file.readlines()
        self.num = len(self.lines)
        print(self.lines)
        print(self.num)
        pass

    # file still has more to parse?
    @property
    def has_more_commands(self):
        self.curr_num = self.curr_num + 1
        print(self.curr_num)
        if self.num < self.curr_num:
            print("stop")
            return 0
        else:
            print("keep going")
            return 1

    # Reads the next command from the input and makes it the current command.
    # Should be called only if has_more_commands() is true, initially there is no current command
    @property
    def advance(self):
        if self.has_more_commands == 1:
            print("advance file")
            line = self.curr_file.readline().rstrip()
            if "//" not in line:
                print("good line")
                return line
            else:
                print("commented line")
                return "0"
        else:
            print("no more lines")
            return "eof"


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




