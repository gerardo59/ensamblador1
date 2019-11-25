.model small
.data

msj1 db 10,13, "ingresa num$" 
msj2 db 10,13, "Es menor$"
msj3 db 10,13, "Es mayor$" 
msj4 db 10,13, "Es igual$"  

num dw ?
.code

mov ax, @data
mov ds, ax

mov ah, 09h
lea dx, msj1

int 21h

mov ah, 01h
int 21h
mov ah, 0
sub al, 48
mov num, ax

cmp num, 5
mov ah, 09h

jl menor  
je igual
jg  mayor
                     <


menor:
lea dx, msj2
jmp final:

igual:
lea dx, msj4 
jmp final:

mayor:
lea dx, msj3 

 
final:

int 21h

mov ah, 4ch
int 21h

end        