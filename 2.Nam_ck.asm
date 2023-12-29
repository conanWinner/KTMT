
.model small
	.stack 100
	.data
	       
	       
	       so db 10,10 dup($)  
	       
	       
	       yeucau db 10,13,'=======Danh sach cac chuc nang=======$'
	       thoat db 10,13,'0. Thoat$'    
	       cn1 db 10,13,'1. Nhap so$'
	       cn2 db 10,13,'2. In ra so$'
	       cn3 db 10,13,'3. Tinh giai thua $'
	       cn4 db 10,13,'4. Kiem tra co phai so hay khong:$'
	       nhapso_giaithua db 10,13,'Moi ban nhap so:$'
	       chon db 10,13,'Moi ban chon chuc nang: $'   
	       x db ?
	       muoi dw 10 
	       input db 10,13, 'Nhap vao mot ky tu: $'             
           no db ' Khong phai so$' 
           yes db ' La so$'     
           CLRF db 13,10,'$'
	          
	       tb_thoat db 10,13,'Tam biet$'
	       tb_cn1 db 10,13,'Moi ban nhap so: $'
	       tb_cn2 db 10,13,'So ban vua nhap la: $'
	       tb_cn3 db 10,13,'Ket qua giai thua la: $'
	       tb_cn4 db 10,13,'Ket qua : $'
	       
	.code
	    main proc
	        mov ax,@data
	        mov ds,ax                       
	                    
	                 
	        for:
	            mov ah, 9 
	            lea dx, yeucau
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
	            
	            mov ah, 1  ; cin >> x
	            int 21h   
	            
	            mov x, al
	            
	         cmp x, '0'
	         je thoat1
	         
	         
	         cmp x, '1'
	         je cin 
	         
	         cmp x, '2'
	         je cout
	         
	         cmp x, '3'
	         je giai_thua
	         
	         cmp x, '4'
	         je ktraso 
	         
	         loop for
	         
	         thoat1: 
	            lea dx, tb_thoat
	            mov ah, 9
	            int 21h
	            mov ah,4Ch
	            int 21h   
	            
	         cin:
	            call cn1_nhapso  
	            ret
    	                   
    	     cout:
    	        call cn2_inso
    	        ret  
	         
	         giai_thua:
	            call cn3_giai_thua
	            ret
	         
	         ktraso:
	            call cn4_ktraso
	            ret
	         
	    main endp  
	         
	              
	    
	    cn1_nhapso proc   
	        lea dx, tb_cn1
	        mov ah, 9
	        int 21h
	        
	        lea dx, so            
            mov ah, 10 ; cin >> so 
            int 21h 
            
                       
	    ret  
	    
	    
	    cn2_inso proc
	        lea dx, tb_cn2
	        mov ah, 9
	        int 21h
	        
	        lea si,so+2
	        mov cl,[so+1]    ;so lan lap lodsb
	        batdau:
	            lodsb
	            
	            mov dl, al
	            ;add dl, '0'
	            mov ah, 2
	            int 21h   
	            
	            cmp cl, 0
	            je end
	            
	            loop batdau
	        
	        end:         
	    ret   
	    
	    
	    cn3_giai_thua proc 
	    
	    lea dx,nhapso_giaithua 
        mov ah, 9
        int 21h
    
	    mov ah,1
        int 21h    
        sub al,'0'
        mov cx,0
        mov cl,al
        
        lea dx,tb_cn3
        mov ah,9
        int 21h
        
        mov ax,1
        mov bx,1
        
        Giaithua:
            Mul bx
            inc bx
            cmp bx,cx
            jle giaithua
         mov cx,0
         
        Lappush:
            mov dx,0
            div muoi
            add dx,'0'
            push dx
            inc cx
            cmp ax,0
            jne Lappush
            
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            Loop Hienthi
         

	     ret  
	     
	     
	    
	     cn4_ktraso proc
            mov ah, 9
            lea dx, input
            int 21h  
            mov ah, 1   
       
            int 21h                 
            cmp al, 30h
            je ket       
            cmp al, 30h 
            jb sai     
            cmp al, 39h
            jg sai     
            jmp dung   
        sai:            
            mov ah, 9
            lea dx, no 
            int 21h
            mov AH,9
            lea DX,CLRF
            int 21H  
          
        dung:
            mov ah, 9
            lea dx, yes
            int 21h
            mov AH,9
            lea DX,CLRF
            int 21H
        ket:      
        
               

	     ret
	     
	     
	     
	     
	     
	    end