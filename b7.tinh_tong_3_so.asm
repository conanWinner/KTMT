.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap a: $'
   tb2 db 'nhap b: $'
   tb3 db 'nhap c: $'
   tb4 db '=========> a + b + c = $'
   a db ?
   b db ?
   c db ?
   ans db ? 

.code
main proc  
     
   mov ax, @data
   mov ds, ax
   
           
           
           
   ;in tb 1
   mov ah, 9
   lea dx, tb1
   int 21h
   
   
   ;nhap a
   mov ah, 1
   int 21h
   
   ;gan al vao a
   mov a, al
   
   ;in endl
   mov ah, 9
   lea dx, endl
   int 21h
   
   ;in tb2
   mov ah, 9
   lea dx, tb2
   int 21h
   
   ;nhap b
   mov ah, 1
   int 21h
   
   ;gan al vao b
   mov b, al 
   
   ;in endl
   mov ah, 9
   lea dx, endl
   int 21h
   
   ;in tb3
   mov ah, 9
   lea dx, tb3
   int 21h
   
   ;nhap c
   mov ah, 1
   int 21h
   
   ;gan al vao c
   mov c, al
   
   mov ah, 9
   lea dx, endl ;in ra endl
   int 21h                 
   lea dx, tb4 ;in ra tb4
   int 21h
   
   ;thuc hien tinh hieu
   mov dl, a 
   add dl, b
   add dl, c
   sub dl, '0'
   sub dl, '0' 
   mov ans, dl
  
   ;kqua
   mov ah, 2
   mov dl, ans
   int 21h
   
   
   mov ah, 4ch
   int 21h
    
main endp
end main
