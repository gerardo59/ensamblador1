.model small 
.data  

msg1 db 10,13,"Ingresa un numero: $"
msg2 db 10,13,"Es menor $"
msg3 db 10,13,"Es mayor $" 
msg4 db 10,13,"Es igual $" 
msg5 db 10,13,"ERROR $"
num dw ?

.code  

mov ax,@data 
mov ds,ax

mov ah,09h
lea dx, msg1
int 21h

mov bx,0 

ciclo:

mov ah,01h
int 21h 
cmp al,13
je fin   

cmp al,048
jl fu
cmp al,057
jg fu

mov ah,0
sub al,48
mov cx,ax
mov ax,10
mul bx  
mov bx,ax
add bx,cx 
jne ciclo

fin:

mov num,bx 


cmp num,5000



jl menor 
je igual
jg mayor 

menor:
lea dx,msg2 
jmp final

mayor:
lea dx,msg3 
jmp final

igual:
lea dx,msg4

fu:
lea dx,msg5 
jmp final

final:
mov ah,09h
int 21h
mov ah,4ch
int 21h

end
