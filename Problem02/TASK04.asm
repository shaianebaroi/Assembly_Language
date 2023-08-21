.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    X DB "ENTER A HEX DIGIT: $"
    Y DB "IN DECIMAL IT IS $"      
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX  
        MOV AX, 0

        ; YOUR CODE STARTS HERE    
        
        LEA DX, X       ;TAKING INPUT
        MOV AH, 9
        INT 21H 
        
        MOV AH, 1
        INT 21H  
        
        MOV BL, 11H 
        SUB AL, BL
        MOV BL, AL
        
        MOV AH, 2       ;CARRIAGE RETURN AND LINE FEED
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
        
        LEA DX, Y       ;TAKING INPUT
        MOV AH, 9
        INT 21H
        
        MOV DL, 31H     
                        
        MOV AH, 2
        INT 21H
        
        MOV DL, BL      ;COPYING VALUES
            
        MOV AH, 2       ;OUTPUT
        INT 21H    


        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN
