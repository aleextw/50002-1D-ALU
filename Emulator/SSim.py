import random
import os
import math 

filename = "game"

registers = {i : 0 for i in range(32)}
labels = {}
data = []
data_counter = 0
instruction_counter = 0
instructions = {}

subbed_asm = []

data_labels = {}

def ld(args):
    global registers
    if len(args) == 2:
        args.insert(0, 31)
    if args[2] != 31:
        registers[args[2]] = int(data[(registers[args[0]] + args[1]) // 2], 2)

def st(args):
    global registers
    if len(args) == 2:
        args.append(31)
    data[(args[1] + registers[args[2]]) // 2] = bin(registers[args[0]])[2:].zfill(16)

def rand(args):
    global registers
    if args[0] != 31:
        registers[args[0]] = random.randint(1, 15)

def beq(args):
    global registers
    global instruction_counter
    if len(args) == 2:
        args.append(31)
    if args[2] != 31:
        registers[args[2]] = instruction_counter + 4
    if not registers[args[0]]:
        instruction_counter = instruction_counter + (args[1] * 4)
    
def bne(args):
    global registers
    global instruction_counter
    if len(args) == 2:
        args.append(31)
    if args[2] != 31:
        registers[args[2]] = instruction_counter + 4
    if registers[args[0]]:
        instruction_counter = instruction_counter + (args[1] * 4)

def jmp(args):
    global registers
    global instruction_counter
    if len(args) == 1:
        args.append(31)
    if args[1] != 31:
        registers[args[1]] = instruction_counter + 4
    instruction_counter = registers[args[0]] >> 2 << 2

def nop(args):
    pass

def svc(args):
    global registers
    while True:
        try:
            temp = int(input("Button Input: "))
        except Exception as _:
            continue
        break

    registers[0] = temp
    
def move(args):
    global registers
    if args[1] != 31:
        registers[args[1]] = registers[args[0]] 

def cmove(args):
    global registers
    if args[1] != 31:
        registers[args[1]] = args[0]

def br(args):
    if len(args) == 1:
        beq([31, *args, 31])
    else:
        beq([31, *args])

# TODO: Update Stack OPs to work with emulator
def push(args):
    sp = "11101"
    four = "0000000000000100"
    neg_four = "1111111111111100"
    arith("110000", [sp, four, sp])
    st([*args, neg_four, "11101"])

def pop(args):
    sp = "11101"
    four = "0000000000000100"
    neg_four = "1111111111111100"
    ld([sp, neg_four, *args])
    arith("110001", [sp, four, sp])

def allocate(args):
    sp = "11101"
    alloc_val = parse_op_arg(str(4 * int(args[0])))

def deallocate(args):
    sp = "11101"
    alloc_val = parse_op_arg(str(4 * int(args[0])))


def arith(opcode, args):
    global registers
    match opcode[1]:
        case "0":
            match opcode[2:]:
                case "0000":
                    registers[args[2]] = (registers[args[0]] + registers[args[1]]) % 2**16
                case "0001":
                    registers[args[2]] = (registers[args[0]] - registers[args[1]]) % 2**16
                case "0100":
                    registers[args[2]] = (registers[args[0]] == registers[args[1]]) % 2**16
                case "0101":
                    registers[args[2]] = (registers[args[0]] < registers[args[1]]) % 2**16
                case "0110":
                    registers[args[2]] = (registers[args[0]] <= registers[args[1]]) % 2**16
                case "1000":
                    registers[args[2]] = (registers[args[0]] & registers[args[1]]) % 2**16
                case "1001":
                    registers[args[2]] = (registers[args[0]] | registers[args[1]]) % 2**16
                case "1010":
                    registers[args[2]] = (registers[args[0]] ^ registers[args[1]]) % 2**16
                case "1100":
                    registers[args[2]] = (registers[args[0]] << registers[args[1]]) % 2**16
                case "1101":
                    registers[args[2]] = ((registers[args[0]] & 0xffff) >> registers[args[1]]) % 2**16
                case "1110":
                    registers[args[2]] = (registers[args[0]] >> registers[args[1]]) % 2**16
        case "1":
            match opcode[2:]:
                case "0000":
                    registers[args[2]] = (registers[args[0]] + args[1]) % 2**16
                case "0001":
                    registers[args[2]] = (registers[args[0]] - args[1]) % 2**16
                case "0100":
                    registers[args[2]] = (registers[args[0]] == args[1]) % 2**16
                case "0101":
                    registers[args[2]] = (registers[args[0]] < args[1]) % 2**16
                case "0110":
                    registers[args[2]] = (registers[args[0]] <= args[1]) % 2**16
                case "1000":
                    registers[args[2]] = (registers[args[0]] & args[1]) % 2**16
                case "1001":
                    registers[args[2]] = (registers[args[0]] | args[1]) % 2**16
                case "1010":
                    registers[args[2]] = (registers[args[0]] ^ args[1]) % 2**16
                case "1100":
                    registers[args[2]] = (registers[args[0]] << args[1]) % 2**16
                case "1101":
                    registers[args[2]] = ((registers[args[0]] & 0xffff) >> args[1]) % 2**16
                case "1110":
                    registers[args[2]] = (registers[args[0]] >> args[1]) % 2**16
    if args[2] == 31:
        registers[args[2]] = 0


one_x_zero = {
    "ADD" : "0000",
    "SUB" : "0001",
    "CMPEQ" : "0100",
    "CMPLT" : "0101",
    "CMPLE" : "0110",
}

one_x_one = {
    "AND" : "1000",
    "OR" : "1001",
    "XOR" : "1010",
    "SHL" : "1100",
    "SHR" : "1101",
    "SRA" : "1110"
}

op_lookup = {
    "RAND" : rand,
    "BEQ" : beq,
    "BNE" : bne,
    "JMP" : jmp,
    "LD" : ld,
    "ST" : st,
    "NOP" : nop,
    "SVC" : svc,
    "MOVE" : move,
    "CMOVE": cmove,
    "BF": beq, 
    "BT": bne,
    "BR": br,
    "PUSH": push,
    "POP": pop,
    "ALLOCATE": allocate,
    "DEALLOCATE": deallocate
}

reg_lookup = {
    "BP" : "R27",
    "LP" : "R28",
    "SP" : "R29",
    "XP" : "R30",
}

with open(f"{filename}_data.txt") as fp:
    b = fp.read().split("\n")

for row in b:
    row = row.strip()                   # Remove whitespace
    if row == "" or row[0:2] == "||":   # If line is empty / comment line, ignore
        continue
    elif row[-1] == ":":
        labels[row[:-1]] = data_counter
        data_labels[row[:-1]] = data_counter
    else:
        row = row.strip().split("||")
        data.append(row[0].strip())
        data_counter += 2

with open(f"{filename}.txt") as fp:
    a = fp.read().split("\n")

# Initial cleaning up
parsed_rows = []
for row in a:
    row = row.strip()                   # Remove whitespace
    if row == "" or row[0:2] == "||":   # If line is empty / comment line, ignore
        continue
    else:
        row = row.strip().split("||")   # Else, split on comment and take first element (ASM instruction) without whitespace
        parsed_rows.append(row[0].strip())

def parse_op_str(s):
    # print(s)
    if not s.isnumeric():
        op, args = s[:-1].split("(")
        if len(args) > 0:
            args = [parse_op_arg(i.strip(), op.lower() in ["push", "pop", "ld", "st"]) for i in args.split(",")]
        else:
            args = []

        if op in one_x_zero:
            arith("10" + one_x_zero[op], args)
        elif op[:-1] in one_x_zero:
            arith("11" + one_x_zero[op[:-1]], args)
        elif op in one_x_one:
            arith("10" + one_x_one[op], args)
        elif op[:-1] in one_x_one:
            arith("11" + one_x_one[op[:-1]], args)
        elif op in op_lookup:
            op_lookup[op](args)
        else:
            raise Exception(f"Non-op string {s} provided.")

def parse_op_arg(s, mem=False):
    if s in reg_lookup:
        s = reg_lookup[s]
    if s[0].lower() == "r":
        s = s[1:]
        return int(s)
    elif s.isnumeric():
        # We are reading a literal:
        return int(s)
    elif s[1:].isnumeric():
        return int(s[1:])
    elif s in labels:
        if not mem:
            # Have to convert from label to literal
            # print(labels[s])
            literal = ((labels[s] - instruction_counter) // 4) - 1
            # print(literal)
            return int(literal)
        else:
            return int(labels[s])
    else:
        raise Exception(s)

def dec_to_tcbin(x):
    if x < 0:
        x = (abs(x) ^ 131071) + 1
    return bin(x)[2:].zfill(16)[-16:]

for idx, row in enumerate(parsed_rows):
    if row[-1] == ":":
        # Add to our labels table and set it to current instruction counter value
        labels[row[:-1]] = instruction_counter
    elif row[0] == ".":
        address = row.split("=")[1].strip()
        while instruction_counter < int(address) * 4:
            instruction_counter += 4
    else:
        instructions[instruction_counter] = row
        instruction_counter += 4

instruction_counter = 0



flip_labels = {labels[i]: i for i in labels}

flip_data_labels = {data_labels[i]: i for i in data_labels}

print(flip_data_labels)
input()

while True:
    row = instructions[instruction_counter]
    os.system('cls' if os.name == 'nt' else 'clear')
    instr_lookahead = [f"{flip_labels.get(instruction_counter + i * 4, '') + '    ':>30}{instruction_counter + i * 4:<5}:    {instructions.get(instruction_counter + i * 4, 'NOP()'):<44}" for i in range(10)]
    instr_lookahead.insert(0, "INSTRUCTIONS:" + ' ' * 79)
    
    data_lookahead = [f"{flip_data_labels.get(i * 2, '') + '    ':>30}{i * 2:<4}:    {data[i]:<20}" for i in range(60, 78)]
    data_lookahead.insert(0, "DATA:" + ' ' * 49)

    reg_disp_left = [f"R{i:<2}:    {bin(registers[i])[2:].zfill(16):<39}" for i in range(16)]
    reg_disp_right = [f"R{i:<2}:    {bin(registers[i])[2:].zfill(16):<29}" for i in range(16, 32)]

    for idx, val in enumerate(instr_lookahead):
        print(f"{val}{data_lookahead[idx]}")
    
    cont = len(instr_lookahead) + 1
    print(" " * 84 + data_lookahead[cont - 1])

    for idx, val in enumerate(reg_disp_left):
        if cont + idx < len(data_lookahead):
            print(f"{val}{reg_disp_right[idx]}{data_lookahead[cont + idx]}")
        else:
            print(f"{val}{reg_disp_right[idx]}")

    if row[0] == ".":
        address = row.split("=")[1].strip()
        while instruction_counter < int(address) * 4:
            instruction_counter += 4
    elif row[-1] != ":":
        try:
            parse_op_str(row)
        except Exception as e:
            print(row)
            raise e
        
        row[:3] != "SVC" and input()
        instruction_counter += 4


