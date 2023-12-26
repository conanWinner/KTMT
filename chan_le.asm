.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;ky tu xuong dong
   tb1 db "nhap so : $"  
   tb_le db "le $"
   tb_chan db "chan $"
   ans db 13, 10, "ket qua la: $"
   tmp db ? 
   hai db 2 
    

.code
main proc  
     
   mov ax, @data
   mov ds, ax
   
   mov ah, 9
   lea dx, tb1      ; in tb1
   int 21h
   
   mov ah, 1   ; nhap vao so
   int 21h 
   sub al, '0' ; chuyen ve so 
   
   
   
   mov ah, 0 ;khoi tao ve 0 de thuc hien phep chia
   

   div hai      
   
   
   
   ;ah: du
   mov tmp, ah 
   
   ;tb ket qua
   mov ah, 9
   lea dx, ans
   int 21h          
             
             
   call check
   
   mov ah, 9
   lea dx, tb_chan
   int 21h
   
   mov ah, 4ch
   int 21h

    
main endp 


check proc 
       
       cmp tmp, 1
       je le 
       
       jmp thoat
       
       
       le: 
            mov ah, 9
            lea dx, tb_le
            int 21h  
            
            mov ah, 4ch
            int 21h   

       thoat:    
    
ret


end 
