.MODEL SMALL

.STACK 100H

.DATA

    A DB "30$" 
    B DB "28/29$"
    C DB "31$"
 
.CODE
    MAIN PROC

        MOV AX,@DATA
        MOV DS,AX
        
        ; YOUR CODE STARTS HERE
        
        MOV AH,1        ;TAKING INPUT
        INT 21H 
        SUB AL,48
        MOV BL,AL  

        MOV AH,2        ;CARRIAGE RETURN AND LINE FEED
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        MOV AL,BL  
        
        CMP AL,1        ;AL == 1 ?
        JE CON3         ;IF AL == 1, JUMP TO CON3
        
        CMP AL,2        ;AL == 2 ?
        JE CON2         ;IF AL == 2, JUMP TO CON2
        
        CMP AL,3        ;AL == 3 ?
        JE CON3         ;IF AL == 3, JUMP TO CON2
        
        CMP AL,4        ;AL == 4 ?
        JE CON1         ;IF AL == 4, JUMP TO CON1
        
        CMP AL,5        ;AL == 5 ?
        JE CON3         ;IF AL == 5, JUMP TO CON3
        
        CMP AL,6        ;AL == 6 ?
        JE CON1         ;IF AL == 6, JUMP TO CON1
        
        CMP AL,7        ;AL == 7 ?
        JE CON3         ;IF AL == 7, JUMP TO CON3
        
        CON1:
        LEA DX,A        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT
        
        CON2:
        LEA DX,B        ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT 
        
        CON3:C
        LEA DX,S3       ;PRINT STATEMENT
        MOV AH,9
        INT 21H
        JMP EXIT
        
        ;YOUR CODE ENDS HERE
        
        EXIT:
        MOV AX,4C00H
        INT 21H
        
MAIN ENDP
END MAIN