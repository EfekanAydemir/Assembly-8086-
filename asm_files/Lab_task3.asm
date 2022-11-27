
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
       
CLD
MOV CX,14       
MOV DI, 2000H
LEA SI, VAR1
REP MOVSB


MOV CX,14
MOV BX, 3000H
SUB DI, 01H
SUB SI, 01H


STD
LOOP1:
LODSB
MOV [BX],AL
ADD BX, 01H
LOOP LOOP1


CLD
MOV CX, 14
MOV SI, 3000H
MOV DI, 2000H

REP MOVSB


ret

VAR1 DB 'MICROCOMPUTERS'


