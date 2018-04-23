from Parser import Parser
from Code import Code
from SymbolTable import SymbolTable

input_file = open("test.dat") # whatever file the assembler will read in to parse


def main():
    code = Code() # instance of a code module
    parser = Parser(input_file) # instance of a parser module, taking in the input file

    print("Hello World!")


main()
