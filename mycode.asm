.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db 'nhap so thu 1: $'
   tb2 db 'nhap so thu 2: $'
   tmp db ? 
   tmp2 db ? 
   tmp3 db ?
   tb3 db 'ket qua la: $'
    

.code
main proc  
     
   mov ax, @data
   mov ds, ax
   
   ;in tb1
   mov ah, 9
   lea dx, tb1
   int 21h
   
   ;nhap giatri thu 1
   mov ah, 1
   int 21h
   
   ;gan so thu 1 vao tmp
   mov tmp, al
   
   
   mov ah, 9
   lea dx, endl ;in endl
   int 21h              
   lea dx, tb2 ;in tb2
   int 21h
   
   ;nhap vao so thu 2
   mov ah, 1
   int 21h
   
   mov tmp3, al 
   
   ;in ra endl
   mov ah, 9
   lea dx, endl
   int 21h
   lea dx, tb3
   int 21h
   
   for:
        
        mov dl, tmp
        mov bl, tmp3
        
        cmp dl, bl
   
                 ;dl: 1     bl: 2
        jl ans1
        jg ans2
   
   ans1: 
        mov dl, bl
        mov ah, 2
        int 21h
        jmp thoat
        
        
   ans2:
        mov ah, 2
        int 21h
        
        jmp thoat
   thoat:         
    
main endp
end main
