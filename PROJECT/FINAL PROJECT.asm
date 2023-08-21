.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    
    A DB 20 DUP(?)
    B DB "PLEASE ENTER 20 CHARACTERS: $"    
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX  
        MOV AX, 0

        ; YOUR CODE STARTS HERE
        
        ; FOR INPUT 
        
        LEA DX, B           ;PRINT STATEMENT 
        MOV AH, 9    
        INT 21H
        
        MOV CX, 20
        MOV SI, OFFSET A 
        
        LOOP1:              ;TAKING INPUT INTO ARRAY USING IMPLICIT LOOP
        MOV AH, 01H
        INT 21H
        
        MOV [SI], AL        
        INC SI
        LOOP LOOP1
        
        MOV AH, 2           ;CARRIAGE RETURN AND LINE FEED   
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H  
        
        ;FOR OUTPUT 
        
        MOV SI, 19          ;RESETTING SI
        MOV AX, 0           ;RESETTING ALL REGISTERS
        MOV BX, 0
        MOV CX, 0
        MOV CX, 0
        
        LOOP2:              ;PRINTING OUTPUT USING EXPLICIT LOOP
        CMP SI,0
        JE OUTPUT2
        
        MOV AL, [SI]
        MOV BL, [SI-1]
        CMP AL, BL
        JNE OUTPUT
        DEC SI
        LOOP LOOP2 
        
        OUTPUT:
        MOV DL, [SI] 
        MOV AH, 02H
        INT 21H
        
        DEC SI
        JMP LOOP2 
        
        OUTPUT2:
        MOV DL, [SI]
        MOV AH, 02H
        INT 21H
        JMP END

        ; YOUR CODE ENDS HERE
        END: 
        MOV AX, 4C00H
        INT 21H
        

    MAIN ENDP
    END MAIN