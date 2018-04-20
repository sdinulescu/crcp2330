# CODE MODULE
# Stejara Dinulescu

def dest(mnemonic):
    bit = 000
    #returns binary code of dest
    if (mnemonic == "null"): bit = 000
    if (mnemonic == "M"): bit = 001
    if (mnemonic == "D"): bit = 010
    if (mnemonic == "MD"): bit = 011
    if (mnemonic == "A"): bit = 100
    if (mnemonic == "AM"): bit = 101
    if (mnemonic == "AD"): bit = 110
    if (mnemonic == "AMD"): bit = 111

    return bit


def comp(mnemonic):
    bit = 0000000
    a = decideA(mnemonic)
    if (a == 0):
        if (mnemonic == 0): bit = 101010
        if (mnemonic == 1): bit = 111111
        if (mnemonic == -1): bit = 111010
        if (mnemonic == "D"): bit = 001100
        if (mnemonic == "A"): bit = 110000
        if (mnemonic == "!D"): bit = 001101
        if (mnemonic == "!A"): bit = 110001
        if (mnemonic == "-D"): bit = 001111
        if (mnemonic == "-A"): bit = 110011
        if (mnemonic == "D+1"): bit = 011111
        if (mnemonic == "A+1"): bit = 011111
        if (mnemonic == "D-1"): bit = 001110
        if (mnemonic == "A-1"): bit = 110010
        if (mnemonic == "D+A"): bit = 000010
        if (mnemonic == "D-A"): bit = 010011
        if (mnemonic == "A-D"): bit = 000111
        if (mnemonic == "D&A"): bit = 000000
        if (mnemonic == "D|A"): bit = 010101
    else :
        if (mnemonic == "M"): bit = 110000
        if (mnemonic == "!M"): bit = 110001
        if (mnemonic == "-M"): bit = 110011
        if (mnemonic == "M+1"): bit = 110111
        if (mnemonic == "M-1"): bit = 110010
        if (mnemonic == "D+M"): bit = 000010
        if (mnemonic == "D-M"): bit = 010011
        if (mnemonic == "M-D"): bit = 000111
        if (mnemonic == "D&M"): bit = 000000
        if (mnemonic == "D|M"): bit = 010101
    #returns binary code of dest
    return bit


def decideA(mnemonic):
    a = 0
    if (mnemonic.get_value(0) == 1):
        a = 1
    return a

def jump(mnemonic):
    #returns binary code of dest
    bit = 000
    if (mnemonic == "null"): bit = 000
    if (mnemonic == "JGT"): bit = 001
    if (mnemonic == "JEQ"): bit = 010
    if (mnemonic == "JGE"): bit = 011
    if (mnemonic == "JLT"): bit = 100
    if (mnemonic == "JNE"): bit = 101
    if (mnemonic == "JLE"): bit = 110
    if (mnemonic == "JMP"): bit = 111
    return bit