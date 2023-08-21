.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE
     
    A DB 6 DUP(?)
    B DB "ENTER SIX NUMBERS: $"
    C DB "SORTED ARRAY: $"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        MOV AX, 0
        
        ;YOUR CODE START HERE
        
        ;FOR INPUT
        
        LEA DX, B           ;PRINT STATEMENT 
        MOV AH, 9    
        INT 21H
        
        MOV CX, 6
        MOV BX, OFFSET A
        MOV AH, 1
        
        LOOP1:              ;TAKING INPUT INTO ARRAY USING IMPLICIT LOOP
        MOV AH, 01H
        INT 21H
        
        MOV [SI], AL        
        INC SI
        LOOP LOOP1
        
        MOV CX, 6           ;RESETTING COUNTER 
        DEC CX
        
        ;FOR SORTING 
        
        LOOP2:              ;MAIN LOOP
        MOV BX, CX
        MOV SI, 0
        
        LOOP3:              ;LOOP FOR COMPARING TWO INDEXES
        MOV AL, A[SI]
        MOV DL, A[SI + 1]
        CMP AL, DL
        
        JNC CON1            ;NO NEED TO SWAP
        
        ;ELSE:              ;CONDITION FOR SWAPPING
         
        MOV A[SI], DL
        MOV A[SI + 1], AL
        
        CON1:               ;CONDITION FOR NO SWAPPING
        INC SI
        DEC BX
        JNZ LOOP3
        
        LOOP LOOP2
        
        ;FOR OUTPUT
        
        MOV AH, 2           ;CARRIAGE RETURN AND LINE FEED   
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H 
        
        LEA DX, C           ;PRINT STATEMENT 
        MOV AH, 9    
        INT 21H
        
        MOV CX, 6           ;RESETTING COUNTER
        MOV BX, OFFSET A
             
        LOOP4:              ;PRINTING ELEMENTS OF THE SORTED ARRAY
        MOV DL,[BX]
        MOV AH, 02H
        INT 21H
        
        INC BX
        LOOP LOOP4 
        
        ; YOUR CODE ENDS HERE
 
        MOV AX, 4C00H
        INT 21H

MAIN ENDP
END MAIN
