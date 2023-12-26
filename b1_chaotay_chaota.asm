.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;kytu xuong dong
   chaotay db 'hello$'
   chaota db 'chao ban$'
    

.code
main proc  
   mov ax, @data
   mov ds, ax
    
   mov ah, 9
   
   lea dx, chaotay
   int 21h
   
   lea dx, endl
   int 21h
   
   lea dx, chaota
   int 21h
   
   mov ah, 4ch
   int 21h
    
main endp
end main