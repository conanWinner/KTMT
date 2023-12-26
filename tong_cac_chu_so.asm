
.model small
	.stack 50
	.data
	       so db 10,0,10 dup($)               ;chi nhap toi da 10 ky tu
	       tb1 db 'Nhap so: $'
	       tb2 db 10,13,'Tong cac chu so: $'
	       Tong db 0   
	       muoi db 10 
	.code
	    main proc
	        mov ax,@data
	        mov ds,ax
	        
	        lea dx,tb1
	        mov ah,9
	        int 21h
	        ;nhap so vao
	        lea dx,so
	        mov ah,10
	        int 21h    
	        
	        lea dx,tb2
	        mov ah,9
	        int 21h
	        
	        lea si,so+2
	        mov cl,[so+1]    ;so lan lap lodsb
	        
	        
	        start: 
	            lodsb  
	            mov dl, al  
	            push dx
	            
	            loop start
	        mov cl,[so+1]
	        end:
	            pop dx            
	            
	            
	            
	            mov bl, dl ;; nhap
	            
	            
	            
	            add Tong, dl    
	            loop end
	        
	        mov dl, Tong 
	        mov cl,[so+1]
	     
	        end2:          
	            sub dl, '0'
	            loop end2
	        
	        mov ah, 0
	        ;di chuyen vao al de thuc hien phep chia
	        mov al, dl
	          
	        call insolonhon10
	        int 20h
	        
    	        
	        
	    main endp 
	    
	    insolonhon10 proc
	       
	       mov cl, 2
	        ok:   
	             
	           div muoi   
	           mov dl, ah
	           mov ah, 0
	           push  dx
	           loop ok
	        
	       
	            
	        mov cl, 2
	        ok2: 
	            pop dx    
	            add dl, '0'
    	        mov ah, 2
    	        int 21h 
    	        loop ok2:
	       
	    ret
	    
	    end 