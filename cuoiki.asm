
.model small
	.stack 50
	.data
	       
	       
	       so db 10,0,10 dup($)  
	       
	       yeucau db 10,13,'=======Danh sach cac chuc nang=======$'
	       thoat db 10,13,'0. Thoat$'    
	       cn1 db 10,13,'1. Nhap so$'
	       cn2 db 10,13,'2. In ra so$'
	       cn3 db 10,13,'3. Tinh tong cac chu so chan$'
	       cn4 db 10,13,'4. Kiem tra xem co phai la so LOC PHAT ? (y/n)$'
	       
	       chon db 10,13,'Moi ban chon chuc nang: $'   
	       x db ?
	       tong db ?
	       tmp db ?  
	       tmp4 db ?
	       muoi db 10  
	       sau db 6
	       tam db 8
	       
	       yes db 'y$'
	       no db 'n$'
	       check1 db ?
	       check2 db ?
	       
	       tb_thoat db 10,13,'Tam biet nha  (+.+)$'
	       tb_cn1 db 10,13,'Moi ban nhap so: $'
	       tb_cn2 db 10,13,'So ban vua nhap la: $'
	       tb_cn3 db 10,13,'Tong cac chu so chan la: $'
	       tb_cn4 db 10,13,'Ket qua: $'
	       
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
	         je tong_chan
	         
	         cmp x, '4'
	         je so_loc_phat 
	         
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
	         
	         tong_chan:
	            call cn3_tong_chan
	            ret
	         
	         so_loc_phat:
	            call cn4_so_loc_phat
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
	    
	    
	    cn3_tong_chan proc
	        lea dx, tb_cn3
	        mov ah, 9
	        int 21h
	        
	        lea si,so+2
	        mov cl,[so+1]    ;so lan lap lodsb  
	        
	        mov bl, 2
	        mov tmp, 0
	        mov tong, 0
	        batdau3: 
	            mov ah, 0 ;reset de thuc hien div
	            lodsb 
	            
	            mov tmp, al   
	            
	            cmp cl, 0      ; if(cl == 0) => thoat loop
	            je end3
	            
	             
	            div bl         ;div 2
	            
	            cmp ah, 0
	            je chan        ;if du la chan => tinh tong
	            jne le
	            
	            chan: 
	                mov al, tmp
	                add tong, al
	                sub tong, 30h
	                        
	            le:
	            
	            loop batdau3
	        
	        end3: 
	            mov ah, 0
	            mov al, tong 

	            ;thuc hien in ra so lon hon 10
    	        mov cl, 2
    	        ok:     
    	           div muoi   
    	           mov dl, ah
    	           mov ah, 0
    	           push dx
    	           cmp cl, 1
    	           je kt1
    	           loop ok
    	        
    	        kt1:
    	            
    	        mov cl, 2
    	        ok2: 
    	            pop dx    
    	            add dl, '0'
        	        mov ah, 2
        	        int 21h
        	        cmp cl, 1
        	        je kt2 
        	        loop ok2:
	            kt2: 

	     ret  
	     
	     
	     ;so loc phat la so chi gom 6 va 8
	     cn4_so_loc_phat proc 
	        
	        lea dx, tb_cn4
	        mov ah, 9
	        int 21h
	        
	        lea si,so+2
	        mov cl,[so+1]    ;so lan lap lodsb
	        batdau4:
	            mov ah, 0
	            lodsb
	            mov tmp4, al
	            
	            div sau
	            mov check1, ah
	            
	            
	            mov ah, 0
	            mov al, tmp4
	            div tam 
	            mov check2, ah
	            
	            ;ktra xem co chia het cho 6 or 8 khong ?
	            mov dl, check1
	            and dl, check2
	            
	            
	            cmp dl, 0
	            jne sai
	             
	              
	            cmp cl, 1
	            je dung
	            
	            loop batdau4
	        dung:
	            lea dx, yes
	            mov ah, 9
	            int 21h 
	            jmp end4
	        sai:
	            lea dx, no
	            mov ah, 9
	            int 21h
	            jmp end4
	        end4:
	     ret
	     
	     
	     
	     
	     
	    end