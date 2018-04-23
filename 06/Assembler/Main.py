import Parser
import Code
from SymbolTable import SymbolTable

# whatever file the assembler will read in to parse
input_file = open("test.txt")


def main():
    code = Code.Code() # instance of a code module
    parser = Parser.Parser(input_file) # instance of a parser module, taking in the input file

    print("Hello World!")


main()
