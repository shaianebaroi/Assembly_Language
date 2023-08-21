.MODEL SMALL
.STACK 100H
.DATA
    ;DEFINE YOUR VARIABLES HERE
    

.CODE
    MAIN PROC

        MOV AX, @DATA
        MOV DS, AX       
        MOV AX, 0

        ; YOUR CODE STARTS HERE
                                 
        MOV AX, 10
        MOV BL, 5
        DIV BL          ;AX = 2
        MOV CX,AX       ;CX = 2 
        
        MOV BL,4        ;BL = 0
        SUB BL, 0       ;BL = 4 - 0 = 4
        
        MOV AX, 3
        MOV DL, 2
        MUL DL          ;AX = 3 * 2 = 6
        
        MOV DX, 5       ;DX = 5
        ADD DX,AX       ;DX = 5 + 6 = 11
        
        MOV AX, 2
        MOV BH, 1
        DIV BH          ;AX = 2/1 = 2  
        MOV BH,AL       ;BH = 2
                                     
        MOV AL,CL       ;AL = 2
        MUL BL          ;AL = 2 * 4 = 8
        
        ADD DL,AL       ;DL = 11 + 8 = 19    
        ADD DL,BH       ;DL = 19 + 2 = 21 [ANS]
         

        ; YOUR CODE ENDS HERE

        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN