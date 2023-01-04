
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



start:

generateRandomNumber:
MOV AH,00H
INT 1AH

MOV AX,DX
MOV DX,0
MOV BX,10
DIV BX

MOV randomNum,DL

MOV DL,randomNum
ADD DL,'0'
MOV print_random[0FH],DL  ; END OF GENERATE RANDOM

; for NPC below
MOV AH,00H
INT 1AH

MOV AX,DX
MOV DX,0
MOV BX,10
DIV BX

MOV randomNPC,DL  ; END OF GENERATE RANDOM
MOV AL,DL
CALL numberToSevenDisplayN
MOV DX,2040H
MOV CX,10H
JMP print_in_lcd

take_input:
LEA DX, msg
MOV AH,09H
INT 21H
MOV AH, 01H
INT 21H
SUB AL ,'0'
MOV userNum, AL
CALL numberToSevenDisplayU

;seven's adress
MOV CX,8H
MOV DX,2030H
MOV SI,0

JMP print_in_seven

print_in_seven:
MOV AL, seven_display[SI]
OUT DX,AL
INC SI
INC DX

LOOP print_in_seven

MOV CX,10H
MOV DX,2040H
MOV SI,0

print_in_lcd:
MOV AL,print_random[SI]
OUT DX,AL
INC SI
INC DX
LOOP print_in_lcd
JMP take_input

PROC numberToSevenDisplayU
    CMP AL,0
    JE ZERO
    CMP AL,1
    JE ONE
    CMP AL,2
    JE TWO
    CMP AL,3
    JE THREE
    CMP AL,4
    JE FOUR
    CMP AL,5
    JE FIVE
    CMP AL,6
    JE SIX
    CMP AL,7
    JE SEVEN
    CMP AL,8
    JE EIGHT
    CMP AL,9
    JE NINE
    
       
    ZERO: MOV seven_display[2], 00111111b 
    JMP FINISH 
    ONE:  MOV seven_display[2], 00000110b 
    JMP FINISH
    TWO:  MOV seven_display[2], 01011011b 
    JMP FINISH
    THREE:MOV seven_display[2], 01001111b 
    JMP FINISH
    FOUR: MOV seven_display[2], 01100110b 
    JMP FINISH
    FIVE: MOV seven_display[2], 01101101b 
    JMP FINISH
    SIX:  MOV seven_display[2], 01111101b 
    JMP FINISH
    SEVEN:MOV seven_display[2], 00000111b 
    JMP FINISH
    EIGHT:MOV seven_display[2], 01111111b 
    JMP FINISH
    NINE: MOV seven_display[2], 01101111b 
    JMP FINISH
    
    FINISH:    
    ret
Endp


PROC numberToSevenDisplayN
    CMP AL,0
    JE ZERO1
    CMP AL,1
    JE ONE1
    CMP AL,2
    JE TWO1
    CMP AL,3
    JE THREE1
    CMP AL,4
    JE FOUR1
    CMP AL,5
    JE FIVE1
    CMP AL,6
    JE SIX1
    CMP AL,7
    JE SEVEN1
    CMP AL,8
    JE EIGHT1
    CMP AL,9
    JE NINE1
    
       
    ZERO1: MOV seven_display[7], 00111111b 
    JMP FINISH1
    ONE1:  MOV seven_display[7], 00000110b 
    JMP FINISH1
    TWO1:  MOV seven_display[7], 01011011b 
    JMP FINISH1
    THREE1:MOV seven_display[7], 01001111b 
    JMP FINISH1
    FOUR1: MOV seven_display[7], 01100110b 
    JMP FINISH1
    FIVE1: MOV seven_display[7], 01101101b 
    JMP FINISH1
    SIX1:  MOV seven_display[7], 01111101b 
    JMP FINISH1
    SEVEN1:MOV seven_display[7], 00000111b 
    JMP FINISH1
    EIGHT1:MOV seven_display[7], 01111111b 
    JMP FINISH1
    NINE1: MOV seven_display[7], 01101111b 
    JMP FINISH1
    
    FINISH1:
        
    ret
Endp


MOV CX, 28H
MOV DX,2000H
MOV SI,0
print_in_dot:
MOV AL, DOTS_U_WINS[SI]
OUT DX,AL
INC DX
INC SI
LOOP print_in_dot


endall:

ret

NUMBERS DB 00111111b, 00000110b, 01011011b, 01001111b, 01100110b, 01101101b, 01111101b, 00000111b, 01111111b, 01101111b 
DOTS_U_WINS DB 01111111b, 01000000b, 01000000b, 01000000b, 01111111b ;U
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;
 DB 01111111b, 00100000b, 00011000b, 00100000b, 01111111b ;W
 DB 00000000b, 00000000b, 01111111b, 00000000b, 00000000b ;I
 DB 01111111b, 00000100b, 00001000b, 00010000b, 01111111b ;N
 DB 01001111b, 01001001b, 01001001b, 01001001b, 01111001b ;S
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ; 
 
DOTS_C_WINS DB 00111110b, 01000001b, 01000001b, 01000001b, 00100010b ;C
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;
 DB 01111111b, 00100000b, 00011000b, 00100000b, 01111111b ;W
 DB 00000000b, 00000000b, 01111111b, 00000000b, 00000000b ;I
 DB 01111111b, 00000100b, 00001000b, 00010000b, 01111111b ;N
 DB 01001111b, 01001001b, 01001001b, 01001001b, 01111001b ;S
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ; 
 
DOTS_TIE DB 00000000b, 00000000b, 01111111b, 00000000b, 00000000b ;I
 DB 00000001b, 00000001b, 01111111b, 00000001b, 00000001b ;T
 DB 01001111b, 01001001b, 01001001b, 01001001b, 01111001b ;S
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;
 DB 00000001b, 00000001b, 01111111b, 00000001b, 00000001b ;T
 DB 00000000b, 00000000b, 01111111b, 00000000b, 00000000b ;I
 DB 01111111b, 01001001b, 01001001b, 01001001b, 01000001b ;E
 DB 00000000b, 00000000b, 00000000b, 00000000b, 00000000b ;

print_random db 'RANDOM NUMBER : $'
msg db 'Enter a number between 0-9 : $'
randomNum db 0
randomNPC db 0
userNum db 0

seven_display db 00111110b, 01000000b, 00000000b, 00000000b,00000000b , 00111001b, 01000000b,00000000b,00000000b




