.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    
     X DB "ENTER FIRST NUMBER: $" 
     
     Y DB "ENTER SECOND NUMBER: $"
     
     Z DB "TOTAL SUM: $"        
     
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        MOV AX, 0
         
        LEA DX,X        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV AH,1        ;FIRST INPUT
        INT 21H 
        SUB AL,48
        MOV BH,AL
         
        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH 
        INT 21H   
        MOV DL,0AH
        INT 21H
        
        LEA DX,Y        ;PRINT STATEMENT  
        MOV AH,9 
        INT 21H  
        
        MOV AH,1        ;SECOND INPUT
        INT 21H 
        SUB AL,48
        MOV BL,AL
        
        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH 
        INT 21H   
        MOV DL,0AH
        INT 21H     
        
        LEA DX,Z        ;PRINT STATEMENT  
        MOV AH,9 
        INT 21H
        
        
        MOV DL,0        ;LOOP
        
        START_LOOP: 
        
        CMP BH,BL
        JG END
        
        MOV AL,BH
        MOV DH,1
        MUL DH
        MOV DH,4
        DIV DH
        
        CMP AH,0
        JE SUMM
        INC BH
        JMP START_LOOP
        
        SUMM:
        ADD DL,BH
        INC BH
        JMP START_LOOP
        
        END: 
        ADD DL,48
        MOV AH,2
        INT 21H
 
    ;EXIT TO DOS
    MOV AX,4C00H
    INT 21H 
    
    MAIN ENDP
END MAIN
