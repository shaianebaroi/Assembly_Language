.MODEL SMALL

.STACK 100H

.DATA

A DB 20    
B DB 2       
C DB 'M'
D DB 'D'
E DB 'PRODUCT : $'
F DB 'REMAINDER : $'

       
.CODE
    MAIN PROC

        ;INITIALISE DS
        
        MOV AX,@DATA
        MOV DS,AX
        
        ; enter your code here
        MOV AX,0
        MOV AH,1
        INT 21H
        CMP AL,C
        JE MULTIPLICATION
        JMP DIVISION 
        
        
        
        MULTIPLICATION:
        
        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX,E
        MOV AH,9
        INT 21H
        
        MOV AX,51        
        MOV BX,4 
        
        MOV CX,AX       ;RECURSIVE SUMMATION
        MOV DX,0
        START:
        ADD DX,BX
        LOOP START
        
        MOV AX,DX
        SUB DX,DX
        MOV BX,1000
        
        LOOP:
        CMP B,4
        JG END
        DIV BX
        MOV CX,DX
        SUB DX,DX
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV AX,BX
        DIV A
        SUB DX,DX
        MOV BX,AX
        MOV AX,CX
        INC B
        JMP LOOP
        
         
        DIVISION:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        LEA DX,F
        MOV AH,9
        INT 21H
        
        MOV AX,51        
        MOV BX,4
        
        ;RECURSIVE DIVISION
        
        MOV DX,AX
        START2:
        SUB DX,BX
        CMP DX,BX
        JGE START2
        
        ;4 DIGIT NUMBER PRINT MAX TO LAST DIGIT
        MOV AX,DX
        SUB DX,DX
        MOV BX,1000
        
        LOOP2:
        CMP B,4
        JG END
        DIV BX
        MOV CX,DX
        SUB DX,DX
        MOV DL,AL
        ADD DL,48
        MOV AH,2
        INT 21H
        MOV AX,BX
        DIV A
        SUB DX,DX
        MOV BX,AX
        MOV AX,CX
        INC B
        JMP LOOP2
        
        END:
        ;MOV AX,4C00H
        ;INT 21H
        
        ;MAIN ENDP
        ;   END MAIN