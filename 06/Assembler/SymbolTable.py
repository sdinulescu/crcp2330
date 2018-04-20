# SYMBOL TABLE MODULE
# Stejara Dinulescu

#constructor for symbol table

#add to symbol table
def addEntry(symbol, address):
    #adds the pair to the table
    return

#whether or not symbol is in the hash table already
def contains(symbol):
    #if ():
        #return 1
    #else :
        return 0

def getAddress(symbol):
    address = 0 #finds the address of the symbol
    return address


def predefined(label):
    hexa = 000000
    if (label == "SP"): hexa = 0x0000
    if (label == "LCL"): hexa = 0x0001
    if (label == "ARG"): hexa = 0x0002
    if (label == "THIS"): hexa = 0x0003
    if (label == "THAT"): hexa = 0x0004
    if (label == "SCREEN"): hexa = 0x4000
    if (label == "KBD"): hexa = 0x6000
    if (label.get_value(0) == "R"): hexa = "0x000-f"
    return hexa

