.model small
.stack 50
.data   
    so db 10,0,10 dup('$') ;so 0 la gi????????
    
    menu db 10,13, '============ Menu ===========$'
    thoat db 10,13, '0. Thoat$'
    cn1 db 10,13, '1. Nhap cac chu so$'
    cn2 db 10,13, '2. In ra so vua nhap$'
    cn3 db 10,13, '3. Kiem tra co phai so doi xung hay khong (y/n)$'
    cn4 db 10,13, '4. Tim kiem vi tri xuat hien dau tien cua so can tim$'
    
    
    chon db 10,13, 'Moi ban chon chuc nang: $'
    loaicn db ?
    yes db 'y$'
    no db 'no$' 
    check db 0
    length db ?  
    tmpss db ?  
    mot db 1
    so_can_tim db ?
    khong_tim_thay db 10,13, 'Khong tim thay$'
    vi_tri_so_can_tim db 0
    
    
    tb_thoat db 10,13, 'Tam biet$'
    tb_cn1 db 10,13, 'Moi ban nhap so: $'
    tb_cn2 db 10,13, 'So vua nhap la: $'
    tb_cn3 db 10,13, 'Ket qua: $'
    tb_cn4 db 10,13, 'Xuat hien tai vi tri: $'  
    
    
    sokhong db 0 
    tb_chua_nhap_so db 10,13, 'Ban chua nhap so$' 
    tb_nhap_so_can_tim db 10,13, 'Nhap so can tim : $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    while:
        mov ah, 9
        lea dx, menu
        int 21h
        
        lea dx, thoat
        int 21h
        
        lea dx, cn1
        int 21h
        
        lea dx, cn2
        int 21h
        
        lea dx, cn3
        int 21h
        
        lea dx, cn4
        int 21h
        
        lea dx, chon
        int 21h
        
        
        ;Nhap chuc nang
        mov ah, 1
        int 21h
                                           
                              
        ;Kiem tra chuc nang gi
        mov loaicn, al
        
        cmp loaicn, '0'
        je exit
        
        cmp loaicn, '1'
        je nhap_so
        
        cmp loaicn, '2'
        je so_vua_nhap
        
        cmp loaicn, '3'
        je ktra_so_doi_xung
        
        cmp loaicn, '4'
        je tim_vi_tri
        
     loop while
     
     
     ;Thoat
     exit:
         lea dx, tb_thoat
         mov ah, 9
         int 21h
         mov ah, 4ch
         int 21h
     
     
     ;Nhap so
     nhap_so:
         call cn1_nhap_so
         ret
            
     ;in ra so vua nhap
     so_vua_nhap:
         call cn2_so_vua_nhap
         ret  
         
     ;kiem tra so doi xung
     ktra_so_doi_xung:
        call cn3_ktra_so_doi_xung
        ret
     
     ;Tim vi tri
     tim_vi_tri:
        call cn4_tim_vi_tri
        ret         
    
main endp          


cn1_nhap_so proc
    lea dx, tb_cn1
    mov ah, 9
    int 21h
    
    mov ah, 10
    lea dx, so ;nhap so
    int 21h
    
RET        
cn1_nhap_so endp  




cn2_so_vua_nhap proc
        lea si, so+2 ; dat con tro tai gia tri dau tien
        mov cl, so+1 ; do dai cua so vua nhap
        
        cmp cl, sokhong
        je chua_nhap_so1
        jne tieptuc1
    
     chua_nhap_so1:
        lea dx, tb_chua_nhap_so
        mov ah, 9
        int 21h
        
        lea dx, tb_cn1
        int 21h
        
        mov ah, 10
        lea dx, so
        int 21h
     
     tieptuc1:  
        lea dx, tb_cn2
        mov ah, 9
        int 21h
        
   
        lea si, so+2 ; dat con tro tai gia tri dau tien
        mov cl, so+1 ; do dai cua so vua nhap 
        
        start1:
       
            mov dl, [si]
            mov ah, 2
            int 21h
            inc si
            cmp [si], '$'
            jne start1       
           
RET         
    
cn2_so_vua_nhap endp 


cn3_ktra_so_doi_xung proc
       lea si, so+2 ; dat con tro tai gia tri dau tien
       mov cl, [so+1] ; do dai cua so vua nhap
        
        cmp cl, sokhong
        je chua_nhap_so2
        jne tieptuc2
    
     chua_nhap_so2:
        lea dx, tb_chua_nhap_so
        mov ah, 9
        int 21h
        
        lea dx, tb_cn1
        int 21h
        
        mov ah, 10
        lea dx, so
        int 21h
     
     tieptuc2:  
        lea dx, tb_cn3
        mov ah, 9
        int 21h
        

        lea si, so+2 ; dat con tro tai gia tri dau tien
        mov cl, [so+1] ; do dai cua so vua nhap 
        mov length, cl
        
        start2:
            lodsb
            mov dl, al
            push dx
            
            cmp cl, 1
            je endstack
        loop start2 
        
        endstack:
        
        lea si, so+2
        mov cl, [so+1]
        sosanh:   
            lodsb 
            pop dx 
            cmp dl, al
            je dung 
            cmp cl, 0 
            je tinh 
            lap:
                   
                loop sosanh
        dung:                
        
            inc check 
            jmp lap
 
        tinh:
            
            mov dl, check     
            
            mov bl, length

         
                
            cmp dl, bl
            je yes3
            jne no3 
             
        yes3:
            lea dx, yes
            mov ah, 9
            int 21h
            jmp out3
        no3:
            lea dx, no
            mov ah, 9
            int 21h
                  
        out3:
            
            mov check, 0  
ret        
           
cn3_ktra_so_doi_xung endp 

cn4_tim_vi_tri proc
     lea si, so+2 ; dat con tro tai gia tri dau tien
       mov cl, [so+1] ; do dai cua so vua nhap
        
        cmp cl, sokhong
        je chua_nhap_so3
        jne tieptuc3
    
     chua_nhap_so3:
        lea dx, tb_chua_nhap_so
        mov ah, 9
        int 21h
        
        lea dx, tb_cn1
        int 21h
        
        mov ah, 10
        lea dx, so
        int 21h  
     
     tieptuc3:  
        lea dx, tb_nhap_so_can_tim
        mov ah, 9
        int 21h 
        
        mov ah, 1
        int 21h  
        mov so_can_tim, al
        ;sub so_can_tim, 30h ;chuyen sang gia tri so
        
        xor cx, cx
        xor si, si
        lea si, so+2 ; dat con tro tai gia tri dau tien
        mov cl, so+1 ; do dai cua so vua nhap
        
     start3:
            lodsb 
            mov dl, al
            inc vi_tri_so_can_tim 
            cmp so_can_tim, dl
            je vi_tri

            loop start3
     kh_tim_thay:
          mov ah, 9
          lea dx, khong_tim_thay
          int 21h
          mov vi_tri_so_can_tim, 0
          ret       
     vi_tri:                          
          add vi_tri_so_can_tim, 30h
           
          mov ah, 9
          lea dx, tb_cn4
          int 21h
          
          mov ah, 2
          mov dl, vi_tri_so_can_tim
          int 21h
          mov vi_tri_so_can_tim, 0
          ret
            
            
        
         
cn4_tim_vi_tri endp

end 
