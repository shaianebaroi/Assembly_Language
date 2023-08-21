.MODEL SMALL
.STACK 100H
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    X DB "1st input: $"
    Y DB "2nd input: $"
    Z DB "3rd input: $" 
    
    
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
        SUB AL, 48
            
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
        SUB AL, 48
            
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
        SUB AL, 48
            
        MOV CL, AL   ;STORING INPUT
            
        MOV AH, 2    ;CARRIAGE RETURN AND LINE FEED    
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H         
        
        ;CALCULATING THE MAXIMUM   
        
        ;IF BL > BH
        
        CMP BL,BH    ; BL > BH ?
        JG CON1      ; IF BL > BH, JUMP TO CONDITION 1
        
        ;ELSE IF BH > CL  
        
        CMP BH,CL    ;BH > CL ?
        JG CON3      ;IF BH > CL, JUMP TO CONDITION 2
        
        ;ELSE
         
        ADD CL,48
        MOV DL,CL
        MOV AH,2
        INT 21H
        JMP EXIT
        
        
        CON1:
        
        CMP BL,CL     ;BL > CL ?
        JG CON2       ;IF BL > CL, JUMP TO CONDITION 2
       
        ;ELSE:
         
        ADD CL,48
        MOV DL,CL
        MOV AH,2
        INT 21H
        JMP EXIT
        
        
        CON2:
         
        ADD BL,48
        MOV DL,BL
        MOV AH,2
        INT 21H
        JMP EXIT
        
        
        CON3:
         
        ADD BH,48
        MOV DL,BH
        MOV AH,2
        INT 21H
        JMP EXIT
        

        ; YOUR CODE ENDS HERE     
        
        EXIT:
        MOV AX, 4C00H
        INT 21H

    MAIN ENDP
    END MAIN
