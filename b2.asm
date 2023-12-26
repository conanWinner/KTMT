.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap ky tu: $'
   tb2 db 'Kqua là: $'
   tmp db ? 

.code
main proc  
   mov ax, @data
   mov ds, ax
    
   ; in ra tb1
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ; nhap ky tu
   mov ah, 1
   int 21h
   
   ; gan gia tri cua al vào tmp
   mov tmp, al  
   
   ; in ra endl
   mov ah, 9
   lea dx, endl
   int 21h
   
   ; in ra tb2
   mov ah, 9
   lea dx, tb2
   int 21h
   
   ; in ra gia tri cua tmp
   mov ah, 2
   mov dl, tmp
   int 21h
  
   
   mov ah, 4ch
   int 21h
    
main endp
end main
