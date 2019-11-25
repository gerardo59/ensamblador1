
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 

.model small
.stack
.data
var1 db ?
.code
.startup

inicio:

    mov ah,01h;
    int 21h;
    
    sub al,30h;resto 30h
    mov var1,al;
    
    mov ah,01h;
    
    int 21h;
    sub al,30h;
    
    add dl,30h;
    mov ah,02;
    
    int 21h
    ;.exit

fin:




