.MODEL SMALL
.STACK 100H
.DATA       

;DECLARED STRINGS

INTRO DB '*************************Welcome to our Online shop*****************************$',10,13
                              

ENTER DB 10,13,'PLEASE ENTER THE KEYS WHAT YOU WANT TO BUY: $'

INFO DB 10,13,'KEYS         ITEMS               PRICE$'

PS5 DB 10,13,' 1         PS5 Console          400 USD $'
                        
GL DB 10,13,' 2         Gaming Laptop        2500 USD $'
                     
RTX DB 10,13,' 3          RTX 4090           1000 USD $'

GM DB 10,13,' 4          Gaming Mouse         350 USD $'

GH DB 10,13,' 5        Gaming Headphone      140 USD $'

IM DB 10,13,' 6        27 inch Monitor       400 USD $'

GK DB 10,13,' 7       Gaming Keyboard         310 USD $'

Mousepad DB 10,13,' 8         Mousepad             50 USD $'

EC DB 10,13,' 9         Empty Case             225 USD $'

E_QUANTITY DB 10,13,'ENTER QUANTITY: $'

AGAIN DB 10,13,'DO YOU WANT TO BUY MORE? (1.YES || 2.NO): $'

ER_MSG DB 10,13,'ERROR INPUT$'  

CHOICE DB 10,13,'ENTER YOUR CHOICE:$'    

FT DB 10,13,'TOTAL AMOUNT IS :$' 
 
ERR DB 0DH,0AH,'WRONG INPUT! START FROM THE BEGINNING $'   

ERR2 DB 0DH,0AH,'WRONG INPUT.PRESS Y/Y OR N/N $' 

R DB 0DH,0AH,'PRESENT AMOUNT IS : $' 

E_DISCOUNT DB 10,13,'ENTER DISCOUNT(IF NOT AVAILABLE ENTER 0 ): $' 

ERASK DB 10,13,'START FROM THE BEGINNING $'

EN_DIS DB 10,13,'AGAIN ENTER DISCOUNT: $'

A DW ?                           ;DECALRED VARIABLES
B DW ?
C DW ?
S DW 0,'$'
                                 
NL DB 0DH,0AH,'$'                ;NEW LINE

 
.CODE
  
     MOV AX, @DATA               
     MOV DS, AX     
     
     
     LEA DX,INTRO                ;PRINT INTRO STRING 
     MOV AH,9
     INT 21H
          
          
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H       

     JMP BEGINTOP                ;DIRECTLY GO TO BEGINTOP LEBEL WHERE USER WILL GIVE INPUT 

 ERROR121:  
                  
     LEA DX,ER_MSG               ;PRINT ERROR MESSAGE 
     MOV AH,9
     INT 21H 
                                 ;IF USER GIVES AN ERROR THEN USER WILL BE ASKED TO INPUT AGAIN
     LEA DX,ERASK
     MOV AH,9
     INT 21H
                

 BEGINTOP:   
 
     LEA DX,NL                   ;PRINT A NEW LINE
     MOV AH,9
     INT 21H
    
                                 
     MOV BL,10                   ;COLOR CODE
     MOV AH,9 
     MOV AL,0  
     INT 10H                
      
     LEA DX,INFO                 ;PRINT INFO STRING
     MOV AH,9 
     INT 21H                     
     
     MOV BL,11                   ;COLOR CODE
     MOV AH,9 
     MOV AL,0  
     INT 10H   
   
        

     LEA DX,PS5              
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H

                  
     LEA DX,GL              
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,RTX            
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,GM              
     MOV AH,9
     INT 21H   
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,GH            
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,IM          
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H
     
     LEA DX,GK              
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H
     
      
     LEA DX,Mousepad              
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
      
     LEA DX,EC               
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H
            
     LEA DX,ENTER               
     MOV AH,9       
     INT 21H    
        
     
     MOV AH,1                   
     INT 21H 
     
                                 
     CMP AL,49                   
     JE PS5B
     
     CMP AL,50                   
     JE GLB
     
     CMP AL,51                   
     JE RTXB
     
     CMP AL,52                   
     JE GMB
     
     CMP AL,53                  
     JE GHB
     
     CMP AL,54                  
     JE IMB
     
     CMP AL,55                  
     JE GKB
     
     CMP AL,56                   
     JE MousepadB
     
     CMP AL,57                   
     JE ECB
     
    
     
     
     JMP ERROR121                ;IF WRONG KEYWORD IS PRESSED THEN THE SHOPLIST WILL SHOW AGAIN 
     
  
PS5B:
                                 
MOV A,400                      

JMP QUANTITY

GLB:

MOV A,2500                        

JMP QUANTITY 

RTXB:

MOV A,1000                        

JMP QUANTITY 

GMB: 

MOV A,350                       

JMP QUANTITY 

GHB: 

MOV A,140                       

JMP QUANTITY 

IMB:

MOV A,400                       

JMP QUANTITY 

GKB:   

MOV A,310                        

JMP QUANTITY 

MousepadB:   

MOV A,50                        

JMP QUANTITY 

ECB:      

MOV A,225                        

JMP QUANTITY 

;AFTER MOVING PRICE PROGRAM WILL JUMP TO QUANTITY LEBEL    

QUANTITY:  

    MOV BL,11 
    MOV AH,9                     ;COLOR CODE
    MOV AL,0  
    INT 10H

    LEA DX,E_QUANTITY            ;PRINT ENTER QUANTITY STRING
    MOV AH,9
    INT 21H 
    
    JMP MULTI           ;PROGRAM WILL GO TO MULTI LEBEL WHERE THE PRICE WILL BE MILTIPLIED WITH THE AMOUNT


ASK: 

    MOV BL,1                     ;COLOR  CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H
    
    LEA DX,AGAIN                 ;PRINT AGAIN IF USER WANTS TO BUY MORE
    MOV AH,9
    INT 21H 
    
    MOV AH,1                     ;TAKES THE INPUT OF YES OR NO
    INT 21H
    
    CMP AL,49                    ;IF YES, THEN AGAIN GO TO SHOPLIST MENU AND BUY AGAIN
    JE BEGINTOP
    
    CMP AL,50
    JE OUTPUT2                   ;IF NO, PROGRAM WILL GIVE THE TOTAL OUTPUT
    
    LEA DX,ER_MSG
    MOV AH,9                     ;IF ANY WRONG INPUT, PRINT ERROR MESSAGE AND AGAIN ASK TO BUY AGAIN
    INT 21H
    
    JMP ASK                      
    


ERROR:
    
    LEA DX,ER_MSG                ;PRINT ERROR MESSAGE 
    MOV AH,9
    INT 21H
    
    JMP QUANTITY                 ;JUMP TO QUANTITY LEBEL
    
ER_DISCOUNT:   

    LEA DX,ER_MSG                ;DURING DISCOUNT INPUT IF WRONG INPUT IS PRESSES ERROR MESSSAGE WILL SHOW
    MOV AH,9
    INT 21H
    
    LEA DX,NL                    ;PRINT NEW LINE
    MOV AH,9
    INT 21H
    
    LEA DX,EN_DIS                ;PRINT AGAIN INPUT DISCOUNT VALUE 
    MOV AH,9
    INT 21H
    
    JMP INPUT_SUB                ;DIRECLTY JUMP TO INPUT OF DISCOUNT 
    
    
MULTI:         

    MOV BL,10                       ;COLOR CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H    

INDEC3 PROC                        ;INDEC3 IS FOR TAKING INPUT FOR MULTIPLY WITH THE GIVEN AMOUNT
    
    PUSH BX                        ;TAKE VALUES INTO STACK 
    PUSH CX
    PUSH DX

    
    
    XOR BX,BX                       ;HOLDS TOTAL
    
    XOR CX,CX                       ;SIGN
                    
    
    MOV AH,1                        ;TAKE CHARACTER IN AL
    INT 21H


    
    REPEAT4: 
                                     
    CMP AL,48                       ;IF AL<0, PRINT ERROR MESSAGE
    JL ERROR
    
    CMP AL,57                       ;IF AL>9, PRINT ERRIR MESSAGE 
    JG ERROR


    AND AX,00FH                     ;CONVERT TO DIGIT
    PUSH AX                         ;SAVE ON STACK
    
    MOV AX,10                       ;GET 10
    MUL BX                          ;AX=TOTAL * 10
    POP BX                          ;GET DIGIT BACK
    ADD BX,AX                       ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                      ;CARRIAGE RETURN
    JNE REPEAT4                     ;IF NO CARRIEGE RETURN THEN MOVE ON
    
    MOV AX,BX                       ;STORE IN AX
    
    
    JMP MUL_
    
    POP DX                          ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                             ;AND RETURN
    
    

INDEC3 ENDP                         ;END OF INDEC3 

ADD_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX  
    
    MOV BL,4                         ;COLOR CODE
    MOV AH,9 
    MOV AL,0  
    INT 10H 
    
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B                         ;MOV B TO AX
    ADD A,AX                         ;ADD A WITH AX
    
    
    MOV AX,A                         ;MOV A TO AX
    
    PUSH AX                          ;TAKE AX INTO STACK
    
    
    JMP END

SUB_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX 
    
    LEA DX,R                         ;PRINT PRESENT AMOUNT STRING
    MOV AH,9
    INT 21H
    
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B                         ;MOV B TO AX
    SUB A,AX                         ;SUBSTRACT AX FROM A
    
    
    MOV AX,A                         ;MOV A TO AX
    
    PUSH AX  
    
    ADD S,AX
    
    JMP OUTPUT

MUL_: 


    ;SECOND VALUE STORED IN B
    MOV B,AX             
    
    MOV BL,4
    MOV AH,9                         ;COLOR CODE
    MOV AL,0  
    INT 10H 
    
    LEA DX,E_DISCOUNT                ;PRINT ENTER DISCOUNT STRING
    MOV AH,9
    INT 21H
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,B
    
    MUL A                            ;MULTIPLY A WITH AX
    
    
    PUSH AX                          ;TAKE AX INTO STACK
    
    MOV A,AX 
   
                                     
    JMP INPUT_SUB                    ;JUMP TO INP1UT_SUB
    
    
    
    JMP OUTPUT 
                                          
INPUT_ADD: 

INDEC1 PROC                          ;INDEC PROC1 IS FOR ADDING THE PRESENT AMOUNTS INTO TOTAL 
    
    PUSH BX                          ;TAKE THE VALUES IN STACK
    PUSH CX
    PUSH DX
    
        
    BEGIN1:
    
    
    XOR BX,BX                        ;HOLDS TOTAL
    
    XOR CX,CX                        ;SIGN
                    
    
    MOV AH,1                         ;TAKE CHARACTER IN AL
    INT 21H

    
    REPEAT2: 
                                     ;IF AL<0, PRINT ERROR MESSAGE
    CMP AL,48
    JL ERROR
    
    CMP AL,57                        ;IF AL>9, PRINT ERROR MESSAGE
    JG ERROR


    AND AX,00FH                      ;CONVERT TO DIGIT
    PUSH AX                          ;SAVE ON STACK
    
    MOV AX,10                        ;GET 10
    MUL BX                           ;AX=TOTAL * 10
    POP BX                           ;GET DIGIT BACK
    ADD BX,AX                        ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1                         ;TAKE VALUE INTO AL
    INT 21H
    
    CMP AL,0DH                       ;CARRIAGE RETURN
    JNE REPEAT2                      ;NO KEEP GOING
    
    MOV AX,BX                        ;STORE IN AX
                         
    
    JMP ADD_                         ;JUMP TO ADD_ TO STORE THE TOTAL VALUE
    
    POP DX                           ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                              ;AND RETURN
    
    

INDEC1 ENDP   

INPUT_SUB: 

INDEC2 PROC
    
    PUSH BX                          ;SAVE TO STACK 
    PUSH CX
    PUSH DX
    
    
    
    XOR BX,BX                        ;HOLDS TOTAL
    
    XOR CX,CX                        ;SIGN
                    

    MOV AH,1                         ;CHAR IN AL
    INT 21H
    
    
    
    REPEAT3: 
    
    CMP AL,48                        ;IF AL<0, PRINT ERROR MESSAGE 
    JL ER_DISCOUNT
    
    CMP AL,57                        ;IF AL>9, PRINT ERROR MESSAGE 
    JG ER_DISCOUNT


    AND AX,00FH                      ;CONVERT TO DIGIT
    PUSH AX                          ;SAVE ON STACK
    
    MOV AX,10                        ;GET 10
    MUL BX                           ;AX=TOTAL * 10
    POP BX                           ;GET DIGIT BACK
    ADD BX,AX                        ;TOTAL = TOTAL X 10 +DIGIT
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                       ;CARRIAGE RETURN
    JNE REPEAT3                      ;NO KEEP GOING
    
    MOV AX,BX                        ;STORE IN AX
    
    OR CX,CX                         ;NEG NUM
    
    
    JMP SUB_

    POP DX                           ;RESTORE REGISTERS
    POP CX
    POP BX
    RET                              ;AND RETURN
                            


INDEC2 ENDP 
    
OUTPUT:         

;OUTDEC PROC IS FOR GIVING THE OUTPUT OF THE PRESENT AMOUNT

OUTDEC PROC
    
    
    PUSH AX                          ;SAVE REGISTERS
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR CX,CX                        ;CX COUNTS DIGITS
    MOV BX,10D                       ;BX HAS DIVISOR
    
    REPEAT1:
    
    XOR DX,DX                        ;PREP HIGH WORD
    DIV BX                           ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX                          ;SAVE REMAINDER ON STACK
    INC CX                           ;COUNT = COUNT +1
    
    OR AX,AX                         ;QUOTIENT = 0?
    JNE REPEAT1                      ;NO, KEEP GOING
    
    MOV AH,2                         ;PRINT CHAR FUNCTION
    
    PRINT_LOOP:
    
    POP DX                           ;DIGIT IN DL
    OR DL,30H                        ;CONVERT TO CHAR
    INT 21H                          ;PRINT DIGIT
    LOOP PRINT_LOOP                  ;LOOP UNTILL DONE
    
    POP DX
    POP CX                           ;RESTORE REGISTERS
    POP BX
    POP AX 
    
    JMP ASK
    
    RET
    OUTDEC ENDP 

OUTPUT2: 

    LEA DX,FT                        ;PRINT FINAL TOTAL
    MOV AH,9
    INT 21H
    
    XOR AX,AX                        ;CLEAR AX
    
    MOV AX,S                         ;SET AX INTO 0
    
    
    ;OUTDEC2 IS FOR GIVING THE TOTAL OUTPUT OF THE AMOUNT
    
                                     
OUTDEC2 PROC
    
    
    PUSH AX                          ;SAVE REGISTERS
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX,CX                        ;CX COUNTS DIGITS
    MOV BX,10D                       ;BX HAS DIVISOR
    
    REPEAT12:
    
    XOR DX,DX                        ;PREP HIGH WORD
    DIV BX                           ;AX = QUOTIENT, DX=REMAINDER
    
    PUSH DX                          ;SAVE REMAINDER ON STACK
    INC CX                           ;COUNT = COUNT +1
    
    OR AX,AX                         ;QUOTIENT = 0?
    JNE REPEAT12                     ;NO, KEEP GOING
    
    MOV AH,2                         ;PRINT CHAR FUNCTION
    
    PRINT_LOOP2:
    
    POP DX                           ;DIGIT IN DL
    OR DL,30H                        ;CONVERT TO CHAR
    INT 21H                          ;PRINT DIGIT
    LOOP PRINT_LOOP2                 ;LOOP UNTILL DONE
    
    POP DX
    POP CX                           ;RESTORE REGISTERS
    POP BX
    POP AX 
    

    OUTDEC2 ENDP 
 

     
END:
MOV AH, 4CH                  
INT 21H