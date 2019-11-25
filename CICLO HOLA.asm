 org 100h
.model small 
.stack 64

.data

mensaje db 10,13,"Hola $"
mensaje2 db 10,13,10,13, "ingresa un valor: $"
num1 dw ?

.code 

mov ax,@data
mov ds, ax

mov ah, 09h
lea dx, mensaje2
int 21h    

mov ah, 01h
int 21h
mov ah, 0
sub al, 48
mov num1,ax
mov cx, 1 

ciclo:

mov ah, 09h
lea dx,mensaje
int 21h

inc cx
cmp cx, num1
jle ciclo

fin:

mov ah, 4ch 
int 21  
                         

end 

