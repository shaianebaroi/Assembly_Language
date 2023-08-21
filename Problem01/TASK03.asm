.MODEL SMALL 
.STACK 100H
.DATA
     ;DEFINE YOUR VARIABLE HERE: 
     X dw 30
     Y db 6
     Z db 10 
     W db 2 

.CODE
MAIN PROC

    ;INITIALYZING DS
     MOV AX, @DATA
     MOV DS, AX

     MOV AX,0 

    ;YOUR CODE STARTS HERE 

     ;X = (X/Y) * (YZ) / (ZW)
     MOV AL, Y
     MUL Z  ; Y * Z
     DIV Z  ; Y * Z / Z
     MOV DL, AL ; DL = Y * Z / Z 
     MOV AX, X  ; AX = X

     DIV Y
     MUL DL
     MOV CL, W
     DIV CL 
     MOV X, AX


    ;EXIT TO DOS
    MOV AX, 4C00H
    INT 21H
    MAIN ENDP