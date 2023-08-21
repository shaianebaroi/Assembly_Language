.MODEL SMALL
.STACK 100H
.DATA   

     ;DECLARE VARIABLES HERE  
     A DB "RESULT: $"
     
.CODE
MAIN PROC
    ;INITIALYZING DS 
    
    MOV AX,@DATA
    MOV DS,AX    
    
    ;ENTER YOUR CODE HERE
        
        LEA DX,A        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV DH,0
        MOV DL,0 
        MOV CX,7        ;COUNT LIMIT
        
        CON1:
        ADD DH,3
        MOV AX,CX
        MOV BL,2
        DIV BL
        CMP AH,0
        JE CON2
        ADD DL,DH
        LOOP CON1
        JMP EXIT
        
        CON2:
        SUB DL,DH
        LOOP CON1
        JMP EXIT
        
        EXIT:
        MOV AH,2
        INT 21H
                  
                  
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H
    MAIN ENDP
END MAIN


