import Parser
import Code
from SymbolTable import SymbolTable

# whatever file the assembler will read in to parse
input_file = open("MaxL.asm")
output_file = open("test.txt")


def assemble(a, comp, dest, jump):
    return 111 + a + comp + dest + jump


def main():
    # instance of a code module
    code = Code.Code()
    # instance of a parser module, taking in the input file
    p = Parser.Parser(input_file)

    while p.has_more_commands is 1:
        line = p.advance
        # ctype = p.command_type(line)
        # print(ctype)
        # if ctype is "C_COMMAND":
            # print("C")
            # bit = assemble(code.decide_a(line), code.comp(line), code.dest(line), code.jump(line))
            # output_file.write(bit)
        # else:
            # print('A_COMMAND')

    return


main()
