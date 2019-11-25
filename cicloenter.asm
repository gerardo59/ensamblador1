.model small 
.data

msg db 10,13, "Ingresa un numero $"
num dw ?

.code

mov ax,@data
mov ds, ax

mov ah,09h
lea dx,msg 
int 21h 

ciclo:
mov ah,01h
int 21h 
cmp al,13
jne ciclo

mov ah,04ch
int 21h

end
