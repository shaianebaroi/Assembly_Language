.MODEL SMALL
.STACK 100H  

.DATA
    ;DEFINE YOUR VARIABLES HERE
    A DB "1ST SIDE: $" 
    B DB "2ND SIDE: $"
    C DB "3RD SIDE: $"
    D DB "4TH SIDE: $"
    E DB "Y$"
    F DB "N$"    
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX

        ;YOUR CODE STARTS HERE        

        LEA DX,A        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV AH,1        ;TAKING INPUT
        INT 21H
        MOV BH,AL
        
        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        
        LEA DX,B        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV AH,1        ;TAKING INPUT
        INT 21H
        MOV BL,AL

        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 

        LEA DX,C        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV AH,1        ;TAKING INPUT
        INT 21H
        MOV CH,AL

        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H 
        
        LEA DX,D        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        MOV AH,1        ;TAKING INPUT
        INT 21H
        MOV CL,AL

        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        
        ;COMPARISON
        
        CMP BH,CH        ;BH == CH ?
        JE CON1          ;IF BH == CH, JUMP TO CON1
        
        LEA DX,E         ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT
        
        CON1:
        CMP BL,CL        ;BL == CL ?
        JE CON2          ;IF BL == CL, JUMP TO CON2
        
        LEA DX,F         ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT
        
        CON2:
        CMP BL,CH        ;BL == CH ?
        JE CON3          ;IF BL == CH, JUMP TO CON3
        
        LEA DX,F         ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT
        
        CON3:
        LEA DX,E         ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        
        
        ;YOUR CODE ENDS HERE
         
        EXIT:
        MOV AX,4C00H
        INT 21H
        
        MAIN ENDP
           END MAIN