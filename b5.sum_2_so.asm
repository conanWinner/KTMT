.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap a: $'
   tb2 db 'nhap b: $'
   tb3 db '=========> a + b = $'
   a db ?
   b db ?
   s db ? 

.code
main proc 
   
   ; nhap 1 chuoi va in ra 
     
   mov ax, @data
   mov ds, ax
   
   
   ;in tb1
   mov ah, 9
   lea dx, tb1
   int 21h
       
   ;nhap a
   mov ah, 1
   int 21h
   
   ;gan al vao a
   mov a, al
   
   mov ah, 9      
   lea dx, endl ; in endl
   int 21h
   
   lea dx, tb2
   int 21h ;in tb2
   
   ;nhap b
   mov ah, 1
   int 21h
   
   ;gan al vao b
   mov b, al
   
   ;thuc hien tinh tong
   mov dl, a
   add dl, b 
   sub dl, '0'
   mov s, dl

   mov ah, 9
   lea dx, endl ;in endl
   int 21h
   
   lea dx, tb3 ; in tb3
   int 21h
   
   
   mov ah, 2
   mov dl, s
   int 21h
   
   
   mov ah, 4ch
   int 21h
    
main endp
end main
