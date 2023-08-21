.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    
    A DB 6 DUP(?)
    B DB "Enter Six numbers: $"
    C DB "Sum: $"  
    
    
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
        
        MOV CX, 6
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
        
        MOV SI, OFFSET A    ;RESETTING SI
        MOV CX, 0           ;RESETTING CX
        MOV AX, 0
        MOV DX, 0
        
        LOOP2:              ;PRINTING OUTPUT USING EXPLICIT LOOP
        CMP SI,6
        JE OUTPUT
        
        MOV BL, 2
        MOV AL, [SI]        ;AX / BL, Q => AL, R => AH 
        SUB AL, 30H
        DIV BL
         
        CMP AH, 0           ;IF REMAINDER == 0, MEANS EVEN, JUMP TO CON1 => DIVISIBLE
        JE CON1
        
        ;ELSE:              ;IF REMAINDER != 0, MEANS ODD, ADD 
        MOV BL, [SI]
        SUB BL, 30H 
        ADD CL, BL, CL
        INC SI
        JMP LOOP2
        
        CON1:            
        INC SI
        JMP LOOP2 
        
        OUTPUT: 
        
        LEA DX, C    
        MOV AH, 9    
        INT 21H
        
        MOV DL, CL
        ADD DL, 30H 
        MOV AH, 02H
        INT 21H 

        ; YOUR CODE ENDS HERE
        END: 
        MOV AX, 4C00H
        INT 21H
        

    MAIN ENDP
    END MAIN