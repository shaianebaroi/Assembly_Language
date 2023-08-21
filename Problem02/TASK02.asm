.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE   
    
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX  
        MOV AX, 0

        ; YOUR CODE STARTS HERE 
        
        MOV AH,1        ;TAKING INPUT
        INT 21h
        
        MOV BL,20h
        SUB AL, BL
        MOV CL,AL
        
        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL, 0DH
        INT 21h
        MOV DL, 0AH
        INT 21H
        
        MOV DL, CL      ;TAKING OUTPUT
        MOV AH,2
        INT 21h


        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN