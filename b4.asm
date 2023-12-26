.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap chuoi: $'
   tb2 db 'chuoi vua nhap: $'
   tmp db 100 dup('$') 

.code
main proc 
   
   ; nhap 1 chuoi va in ra 
     
   mov ax, @data
   mov ds, ax
       
   ;in tb1
   mov ah, 9
   lea dx, tb1
   int 21h    
          
          
   ;nhap vao chuoi       
   mov ah, 10     
   lea dx, tmp
   int 21h 
   
   ; in ra endl
   mov ah, 9
   lea dx, endl
   int 21h
   
   ;in tb2
   mov ah, 9
   lea dx, tb2
   int 21h
   
   ;in ra kq
   lea dx, tmp + 2
   int 21h
   
   
   
   mov ah, 4ch
   int 21h
    
main endp
end main
