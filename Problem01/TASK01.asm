.MODEL SMALL 
.STACK 100H  
   
   
.DATA
    ;DEFINE YOUR VARIABLES HERE  
    
    
.CODE
    ;STARTING OF CODE SEGMENT   
    
    MAIN PROC            
        
        ;START OF PROCEDURE  
        
        ;BEFORE STARTING YOUR CODE MOVE DATA TO DS 
        
        ;YOUR CODE STARTS HERE
        
        ADD AL, 100
        ADD BL, 200
        
        ADD DL, AL
        SUB AL, AL
        ADD AL, BL
        SUB BL, BL
        ADD BL, DL                      
        
        ;YOUR CODE ENDS HERE 
        
    
        ;RETURNING THE CONTROL TO OS 
        
        ;MOV AX, 4C00H
        ;INT 21H 
        
    MAIN ENDP  

END MAIN       

;END OF PROCEDURE 