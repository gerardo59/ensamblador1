org 100h

; add your code here

org 100h
.model small
.stack 64                 
.data

mensaje db 10, 13, "Hola :ç$"
.code

mov ax, @data
mov ds, ax 

mov cx, 0

ciclo:

mov ah, 09h
lea dx, mensaje
int 21h

inc cx
cmp cx, 10
jle ciclo

fin:  

mov ah, 4ch
int 21h 
 


END