
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
            
org  100h

ARRAY DB 'M','E','R','H','A','B','A'
COUNT DW 6  
  
RET
  
MOV DX,COUNT 
CALL SORT
CALL COPY
CALL PRINT  

SORT PROC 
   MOV CX,, COUNT
   LEA SI, ARRAY

     L1:
       MOV AL, [SI]             
       CMP AL, [SI+1]
       JL COMMON                      
       XCHG AL, [SI+1]
       MOV [SI], AL     

     COMMON:
       INC SI
       LOOP L1

       DEC DX
       JNZ SORT
SORT ENDP 
       
COPY PROC  
    MOV DI,2000H  
  
    CLD 
    LEA SI, ARRAY
    MOV CX, 7
    REP MOVSB   
    
COPY ENDP 

PRINT PROC 
    LEA SI, ARRAY
    MOV CX, 7
    MOV AH, 0Eh
    GO: LODSB
    INT 10h
    LOOP GO   
PRINT ENDP 
END
ret