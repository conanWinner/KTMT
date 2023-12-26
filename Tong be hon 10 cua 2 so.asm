.model small
.code    
org 100h

jmp Main
    a db ?
    b db ?
    t db ?
    tb1 db 'Nhap a: $'
    tb2 db 'Nhap b: $'
    tb3 db 'Ket qua: $'
    xdvdd db 13,10,'$' 
    
; chuong trinh chinh
Main Proc
        call Tong
        ;tro ve dos
        int 20h
Main endp
    

; chuong trinh con    


Tong Proc
    ;In ra tb1
    mov ah,9
    lea dx,tb1
    int 21h
    
    ;Nhap a
    mov ah,1
    int 21h
    sub al,30h
    mov a,al
       
    ; Xuong dong
    mov ah,9
    lea dx,xdvdd
    int 21h
    
    ; In ra tb2
    mov ah,9
    lea dx,tb2
    int 21h   

    ; Nhap b            
    mov ah,1
    int 21h
    sub al,30h
    mov b,al             
    
    ; tinh tong
    mov al,a
    add al,b
    mov t,al
    
    ; Xuong dong
    mov ah,9
    lea dx,xdvdd
    int 21h    
    
    ; in ra tb3
    mov ah,9
    lea dx,tb3
    int 21h
    
    ; in ra ket qua        
    mov ah,2       
    mov dl,t  
    ; inc dl - tang dl 1 don vi
    add dl,30h
    int 21h          
    
    ret