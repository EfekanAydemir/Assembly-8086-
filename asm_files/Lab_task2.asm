
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV BX, 2000H
MOV [BX], 'M'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'I'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'C'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'R'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'O'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'C'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'O'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'M' 
PUSH [BX]
ADD BX, 01H
MOV [BX], 'P' 
PUSH [BX]
ADD BX, 01H
MOV [BX], 'U'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'T'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'E'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'R'
PUSH [BX]
ADD BX, 01H
MOV [BX], 'S'
PUSH [BX]

MOV CX,14
MOV BX,2000H

LOOP1:

POP [BX]
ADD BX, 01H

LOOP LOOP1


ret




