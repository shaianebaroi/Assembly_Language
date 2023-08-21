.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    A DB "The remainder is $" 
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX  

        ; YOUR CODE STARTS HERE  
        
        MOV CL, 1
        
        MOV AH, 1   ;TAKING INPUT
        INT 21H
        SUB AL, 30H         
        
        MUL AL      ;STORED IN AX AS 16-BIT
        
        MOV BX, AX  ;STORING THE FIRST INPUT
        
        
        MOV AH, 1   ;TAKING INPUT
        INT 21H
        SUB AL, 30H   
        
        MOV CL, AL  ;STORING THE SECOND INPUT
        
        MOV AX, BX
        
        DIV CL     ;AX / CL, Q => AL, R => AH    
        
        MOV CH, AH
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
    
        LEA DX,A
        MOV AH,9
        INT 21h
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
        
        MOV DL, CH  ;MOVING TO DL TO PRINT
          
        ADD DL, 30H
        MOV AH, 2   ;OUTPUT  
        INT 21H 

        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN