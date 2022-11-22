.model small
.stack 100H
.data
msg db 10,13,"Enter num 1: $"
msg1 db 10,13,"Enter num 2: $"
msg2 db 10,13,"Sum: $"

.code
.startup
MOV AH,09 ;09 display
MOV DX,OFFSET msg
INT 21H

MOV AH, 01
INT 21H
SUB AL,30H
MOV BL, AL
 
MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV AH, 01
INT 21H
SUB AL,30H
ADD BL,AL

MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV DL,BL
CMP DL, 09
JG L6
ADD DL,30H
JMP L7
L6: ADD DL, 37H
L7: MOV AH,02
INT 21H

MOV AH, 4CH
INT 21H
.exit
end