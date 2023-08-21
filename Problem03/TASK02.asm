.8086
.MODEL SMALL
.STACK 100H
.DATA   

    ;YOUR DATA HERE
    X DB "1ST INPUT: $"
    Y DB "2ND INPUT: $"
    
    A DB "DIVISIBLE$"
    B DB "NOT DIVISIBLE$"
    
.CODE
    MAIN PROC
        ;INITIALYZING DS
        MOV AX,@DATA
        MOV DS,AX 
        
        ;YOUR CODE HERE
        
        LEA DX, X       ;PRINT STATEMENT
        MOV AH, 9
        INT 21H
        
        MOV AH, 1       ;FIRST INPUT
        INT 21H
        
        MOV CH, AL      ;STORING THE INPUT
        
        MOV AH, 2       ;CARRIAGE RETURN AND LINE FEED 
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        LEA DX, Y        ;PRINT STATEMENT
        MOV AH, 9
        INT 21H
        
        MOV AH, 1        ;SECOND INPUT
        INT 21H
        
        MOV CL, AL       ;STORING INPUT
        
        MOV AH, 2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        ;OPERATIONS WITH 3  
        
        MOV AL, CL
        MUL CH
        MOV BL, AL
        
        MOV AL, BL
        MOV AH, 0
        MOV DL, 3
        MOV DH, 0         
        DIV DL            ;AX / DL, Q => AL, R => AH  
        
        CMP AH, 0         ;REMAINDER == 0 ?
        JE CON1           ;IF REMAINDER == 0, JUMP TO CON1
        
        ;OPERATIONS WITH 5
        
        MOV AL, BL
        MOV AH, 0
        MOV DL, 5
        MOV DH, 0
        DIV DL            ;AX / DL, Q => AL, R => AH
        
        CMP AH, 0         ;REMAINDER == 0 ?
        JE CON2           ;IF REMAINDER == 0, JUMP TO CON2

        
        CON1:
        MOV AL, BL
        MOV AH, 0
        MOV DL, 5
        MOV DH, 0
        DIV DL
        
        CMP AH, 0         ;REMAINDER == 0 ?
        JE CON3           ;IF REMAINDER == 0, JUMP TO CON3 ==> NOT DIVISIBLE  
        JMP CON4
        
        LEA DX, A         ; ==> NOT DIVISIBLE
        MOV AH, 9
        INT 21H         
        
        CON2:
        MOV AL, BL
        MOV AH, 0
        MOV DL, 3
        MOV DH, 0
        DIV DL
        
        CMP AH, 0         ;REMAINDER == 0 ?
        JE CON3           ;IF REMAINDER == 0, JUMP TO CON3 ==> NOT DIVISIBLE
        JMP CON4
              
        CON3:
        LEA DX, B         ; ==> NOT DIVISIBLE
        MOV AH, 9
        INT 21H   
        
        CON4: 
        LEA DX, A         ; ==> DIVISIBLE
        MOV AH, 9
        INT 21H 
        
        JMP EXIT     
        
        
        EXIT:
        ;DOS FUNCTION CALL TO EXIT BACK TO DOS
        MOV AX,4C00H
        INT 21H 
        
    MAIN ENDP
END


