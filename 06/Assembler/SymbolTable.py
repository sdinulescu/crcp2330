# SYMBOL TABLE MODULE
# Stejara Dinulescu


class SymbolTable:
    # constructor
    def __init__(self):
        print("symbol table object created")
        pass

    # add to symbol table
    def add_entry(self, symbol, address):
        # adds the pair to the table
        return

    # returns whether or not symbol is in the hash table already
    @property
    def contains(self):
        # if ():
            # return 1
        # else :
        return 0

    # finds the address of the symbol
    @property
    def get_address(self):
        address = 0
        return address

    # returns hexa value if it is a predefined symbol
    @property
    def predefined(self):
        hexa = 000000
        if self == "SP":
            hexa = 0x0000
        if self == "LCL":
            hexa = 0x0001
        if self == "ARG":
            hexa = 0x0002
        if self == "THIS":
            hexa = 0x0003
        if self == "THAT":
            hexa = 0x0004
        if self == "SCREEN":
            hexa = 0x4000
        if self == "KBD":
            hexa = 0x6000
        if self.get_value(0) == "R":
            hexa = "0x000-f"
        return hexa

