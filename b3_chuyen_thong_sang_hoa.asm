.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap ky tu can chuyen: $'
   tb2 db 'ket qua la: $'
   tmp db ?
    

.code
main proc  
   mov ax, @data
   mov ds, ax
    
   ;in tb1
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ;nhap ky tu
   mov ah, 1
   int 21h
   
   ;chuyen sang ky tu hoa
   sub al, 20h
   mov tmp, al ; gan vao tmp
   
   ;in ra endl
   mov ah, 9
   lea dx, endl
   int 21h
   
   ;in ra tb2
   mov ah, 9
   lea dx, tb2
   int 21h
   
   mov ah, 2
   mov dl, tmp
   int 21h
   
 
   
   
   mov ah, 4ch
   int 21h
    
main endp
end main
