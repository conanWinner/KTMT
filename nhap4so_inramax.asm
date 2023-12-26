.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db "nhap so thu 1: $"
   tb2 db 13, 10, "nhap so thu 2: $"  
   tb3 db 13, 10, "nhap so thu 3: $"
   tb4 db 13, 10, "nhap so thu 4: $" 
   ans db 13, 10, "ket qua la: $"
     
    

.code
main proc  
     
   mov ax, @data
   mov ds, ax
   
   mov ah, 9
   lea dx, tb1 ;tb1
   int 21h  
              
   mov ah, 1   ;nhap so thu 1
   int 21h   
      
   mov bl, al 
       
   mov ah, 9
   lea dx, tb2 ;tb2
   int 21h  
   
   mov ah, 1   ;nhap so thu 2
   int 21h
   
   ; bl = 1, al = 2
   ; neu bl < al: bl = 2 <=> bl = al
   ; neu bl >= al : khong lam gi ca
  
 
   
   
   call cout
   
   ; bl: somax1    al: 3
   
   mov ah, 9
   lea dx, tb3 ;tb3
   int 21h  
              
   mov ah, 1   ;nhap so thu 3
   int 21h  
   
   call cout 
   
   
   
   mov ah, 9
   lea dx, tb4 ;tb4
   int 21h  
              
   mov ah, 1   ;nhap so thu 4
   int 21h  
   
   call cout
                     
                     
                     
                     
                     
                     
                     
   ;in ra so lon nhat
   
   mov ah, 9
   lea dx, ans
   int 21h
   
   mov dl, bl
   mov ah, 2
   int 21h
   
       
   mov ah, 4ch
   int 21h
   


     
    
main endp 


cout proc
       ; so sanh 2 so, gan so lon hon vao bl
       cmp bl, al
       jl ans1 
       
       jge thoat
       
       ans1: 
           mov bl, al 
       
       thoat:
    ret


end 
