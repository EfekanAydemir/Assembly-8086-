
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV BX,2000H  
MOV AX, 01H
MOV [BX],AX

MOV BX,2001H 
MOV AX, 02H
MOV [BX],AX 

MOV BX,2002H 
MOV AX, 03H
MOV [BX],AX  

MOV BX,2003H  
MOV AX, 04H
MOV [BX],AX

MOV BX,2004H
MOV AX, 05H
MOV [BX],AX


ret




