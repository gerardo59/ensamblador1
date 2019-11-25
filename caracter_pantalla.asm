.model small                                                        
.stack 100h
.data
car    DB 0
pox    DB 0
poy    DB 0
xa     DB 0
ya     DB 0
aviso DB 'Ingrese un caracter ','$' 
msg  DB '*$'

caracter DB 'o$'     
pared db "*$" 

pox1 db 1
poy1 db 1

.code
   mov ax,@data
   mov ds,ax
   mov  ax,02h      ;
   mov  bx,00h
   mov  cx,5      ;fil
   mov  dx,5      ;col
   int  10h
   mov  ah,9
   mov  dx,OFFSET aviso
   int  21h
   mov  ah,01h
   int  21h
   mov  car,al
   mov  ah,03h
   mov  bh,01h
   int  10h
   mov  pox,10
   mov  poy,10
   dec  pox
   mov  ah,05h   ; borrar pantalla
   mov  al,01h
   int  10h
 
 
 
mov pox1, 1  
mov poy1, 1
   superior:

    mov ah, 02h
    mov dh, poy1
    mov dl, pox1
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc pox1
    
    cmp pox1, 30
    jne superior
         
mov pox1, 1
mov poy1, 15
         
inferior:

    mov ah, 02h
    mov dh, poy1
    mov dl, pox1
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc pox1
    
    cmp pox1, 30
    jne inferior   
    
    
mov pox1, 1
mov poy1, 1

lateral1:

    mov ah, 02h
    mov dh, poy1
    mov dl, pox1
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc poy1
    
    cmp poy1, 15
    jne lateral1
    
mov pox1, 30
mov poy1, 1

lateral2:

    mov ah, 02h
    mov dh, poy1
    mov dl, pox1
    int 10h
    
    mov ah, 09h
    lea dx, pared
    int 21h     
    
    inc poy1
    
    cmp poy1, 15
    jne lateral2
   
   
   
bucle:
   mov  ah,02h; ubicarse en la posicion anterior
   mov  bh,01h
   mov  dh,ya
   mov  dl,xa
   int  10h
   mov  ah,02h ; borrar el caracter
   mov  dl,32 ;
   int  21h
   mov  ah,02h; ubicar el cursor
   mov  bh,01h
   mov  dh,poy
   mov  dl,pox
   int  10h
   mov  ah,02h ; imprimir el caracter
   mov  dl,car
   int  21h
   mov  ah,02h ; colocar el cursor en su posicion anterior
   mov  bh,01h
   mov  dh,poy
   mov  dl,pox
   int  10h
   mov  xa,dl
   mov  ya,dh
   mov  ah,00h
   int  16h   ; interrup de teclado
   cmp  ah,75
   jnz  noleft
   
   cmp pox, 2
   je bucle
   
   dec  pox
   jmp  bucle
   
noleft:
   cmp  ah,72
   jnz  nodown
   
   cmp poy, 2
   je bucle     ;arriba
   
   dec  poy
   jmp  bucle
nodown:
   cmp  ah,77
   jnz  noright   ;derecha
   
   cmp pox, 29
   je bucle
  
   
   inc  pox
   jmp  bucle
noright:
   cmp  ah,80
   jnz  noup  
   
   cmp poy, 14 ;abajo
   je bucle
   
   inc  poy
   jmp  bucle
noup:
   cmp  al,27 
   cmp pox, 2
   jz   fin
   jmp  bucle
     
fin:
   mov ax,4ch
   mov bx,00h    
   mov cx,0000h  
   mov dx,184Fh 
       int 10h 
   int  21h
END