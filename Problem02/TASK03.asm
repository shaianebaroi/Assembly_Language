.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    X DB "Enter First Initial: $"
    Y DB "Enter Second Initial: $"
    Z DB "Enter Third Initial: $" 
    
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX  
        MOV AX, 0

        ; YOUR CODE STARTS HERE
        
        LEA DX, X    
        MOV AH, 9    
        INT 21H
            
        MOV AH, 1    ;FIRST INPUT
        INT 21H
            
        MOV BL, AL   ;STORING THE INPUT
            
        MOV AH, 2    ;CARRIAGE RETURN AND LINE FEED   
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        LEA DX, Y
        MOV AH, 9
        INT 21H
            
        MOV AH, 1    ;SECOND INPUT
        INT 21H
            
        MOV BH, AL   ;STORING INPUT
            
        MOV AH, 2    ;CARRIAGE RETURN AND LINE FEED
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        LEA DX, Z
        MOV AH, 9
        INT 21H
            
        MOV AH, 1    ;THIRD INPUT
        INT 21H
            
        MOV CL, AL   ;STORING INPUT
            
        MOV AH, 2    ;CARRIAGE RETURN AND LINE FEED    
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        MOV DL, BL   ;MOVING FOR FIRST OUPUT
        MOV AH, 2
        INT 21H
            
        MOV AH, 2    ;OUTPUT
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        MOV DL, CL   ;MOVING FOR SECOND OUTPUT
        MOV AH, 2    
        INT 21H
            
        MOV AH, 2    ;OUTPUT
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
            
        MOV DL, BH   ;MOVING FOR THIRD OUTPUT
        MOV AH, 2    ;OUTPUT
        INT 21H   

        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN
