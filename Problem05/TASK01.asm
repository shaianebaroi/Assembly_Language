.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    
    A DB 19 DUP(?)
    B DB "Enter Name: $"
    C DB "Output: $"  
    
    
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
        
        MOV CX, 19
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
                            ;PRINT STATEMENT
        LEA DX, C    
        MOV AH, 9    
        INT 21H
        
        MOV SI, OFFSET A    ;RESETTING SI
        
        LOOP2:              ;PRINTING OUTPUT USING EXPLICIT LOOP
        CMP SI,19
        JE END
        
        MOV DL, [SI]
        
        CMP DL, 090         ;COMPARING WITH ASCII CODES
        JG SMALL
        
        CMP DL, 032         ;COMPARING WITH ASCII CODES 
        JE SPACE
        
        ;ELSE               ;CONDITION FOR CAPITAL LETTERS
        MOV DL, 'A'        
        MOV AH, 02H
        INT 21H
        
        MOV DL, [SI]        
        INC SI
        JMP LOOP2  
        
        SMALL:              ;CONDITION FOR SMALL LETTERS
        MOV DL, 'z' 
        MOV AH, 02H
        INT 21H 
        INC SI
        JMP LOOP2
        
        SPACE:              ;CONDITION FOR SPACE
        MOV DL, ' ' 
        MOV AH, 02H
        INT 21H 
        INC SI
        JMP LOOP2      

        ; YOUR CODE ENDS HERE
        END: 
        MOV AX, 4C00H
        INT 21H
        

    MAIN ENDP
    END MAIN