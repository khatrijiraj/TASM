;made by Raj Khatri
.model small
.386
.stack 100H
.data
data1 dd 00000000H
msg db 10,13,"Enter num 1: $"
msg1 db 10,13,"Enter num 2: $"
msg2 db 10,13,"Sum: $"
.code
.startup
MOV EBX, 00000000
MOV AH,09
MOV DX,OFFSET msg
INT 21H
MOV CX, 8
AGAIN:
MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P1
SUB AL,30H
JMP P4
P1:
SUB AL, 37H
P4:
SHL EBX, 4
MOV AH, 00
ADD EBX, EAX
LOOP AGAIN
MOV data1, EBX
MOV AH,09
MOV DX,OFFSET msg1
INT 21H
MOV CX, 8
AGAIN2: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P2
SUB AL,30H
JMP P3
P2:
SUB AL, 37H
P3:
SHL EBX, 4
MOV AH, 00
ADD EBX,EAX
LOOP AGAIN2
ADD EBX, data1
MOV AH,09
MOV DX,OFFSET msg2
INT 21H
MOV DX, 00000000
MOV CX, 8
AGAIN3: ROL EBX, 4
MOV DL,BL
AND DL, 0FH
CMP DL, 09
JG L6
ADD DL,30H
JMP L7
L6: ADD DL, 37H
L7: MOV AH,02
INT 21H
LOOP AGAIN3
MOV AH, 4CH
INT 21H
.exit
end