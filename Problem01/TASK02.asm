.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    A DB 40
    B DB 30
    C DB 20
    D DB 10
    
.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX
        MOV AX, 0
        
        ; YOUR CODE STARTS HERE   
        MOV AL,A ; AL = 40
        MOV BL,C ; BL = 20
        ADD AL,BL ; AL = 40 + 20 = 60
        ADD AL,D ; AL = 60 + 10 = 70
        
        MOV BL,A ;BL = 40
        SUB BL,AL ;BL = 40 - 70 = -30 
        
        MOV D, BL        


        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN