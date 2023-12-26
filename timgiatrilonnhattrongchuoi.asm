.model small
.stack 100h
.data 
   
   endl db 13,10, '$' ;kytu xuong dong   
   
   list db 9,8,3,1
    

.code
main proc  
   mov ax, @data
   mov ds, ax
   lea si, list
   
   mov cx, 3  
   mov bl, [si] 
   lodsb 

   
start:    
    

    lodsb 
    
    ;neu bl < al thi bl = dl 
    ;neu bl >= al thi loop start
    cmp bl, al
    jl ans1
    jge ans2 
    

ans1: 
    mov bl, al 
    loop start  
    
    cmp cx, 0
    je ans3
               
ans2:
    loop start 
    
ans3:    
    mov dl, bl
    mov ah, 2  
    add dl, 30h
    int 21h
    mov ah, 4ch 
    int 21h

main endp   

     


end 

