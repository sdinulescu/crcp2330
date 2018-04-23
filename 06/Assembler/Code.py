# CODE MODULE
# Stejara Dinulescu


class Code:

    # constructor
    def __init__(self):
        print('code object created')
        pass

    # returns whether or not it is an A command
    @property
    def decide_a(self):
        a = 0
        if self.get_value(0) == 1:
            a = 1
        return a

    # returns binary code of dest
    @property
    def dest(self):
        bit = 000
        if self == "null":
            bit = 000
        if self == "M":
            bit = 001
        if self == "D":
            bit = 010
        if self == "MD":
            bit = 011
        if self == "A":
            bit = 100
        if self == "AM":
            bit = 101
        if self == "AD":
            bit = 110
        if self == "AMD":
            bit = 111

        return bit

    # returns binary code of comp
    @property
    def comp(self):
        bit = 0000000
        a = self.decideA()
        if a == 0:
            if self == 0:
                bit = 101010
            if self == 1:
                bit = 111111
            if self == -1:
                bit = 111010
            if self == "D":
                bit = 001100
            if self == "A":
                bit = 110000
            if self == "!D":
                bit = 001101
            if self == "!A":
                bit = 110001
            if self == "-D":
                bit = 001111
            if self == "-A":
                bit = 110011
            if self == "D+1":
                bit = 011111
            if self == "A+1":
                bit = 011111
            if self == "D-1":
                bit = 001110
            if self == "A-1":
                bit = 110010
            if self == "D+A":
                bit = 000010
            if self == "D-A":
                bit = 010011
            if self == "A-D":
                bit = 000111
            if self == "D&A":
                bit = 000000
            if self == "D|A":
                bit = 010101
        else:
            if self == "M":
                bit = 110000
            if self == "!M":
                bit = 110001
            if self == "-M":
                bit = 110011
            if self == "M+1":
                bit = 110111
            if self == "M-1":
                bit = 110010
            if self == "D+M":
                bit = 000010
            if self == "D-M":
                bit = 010011
            if self == "M-D":
                bit = 000111
            if self == "D&M":
                bit = 000000
            if self == "D|M":
                bit = 010101
        return bit

    @property
    def jump(self):
        # returns binary code of dest
        bit = 000
        if self == "null":
            bit = 000
        if self == "JGT":
            bit = 001
        if self == "JEQ":
            bit = 010
        if self == "JGE":
            bit = 011
        if self == "JLT":
            bit = 100
        if self == "JNE":
            bit = 101
        if self == "JLE":
            bit = 110
        if self == "JMP":
            bit = 111
        return bit
