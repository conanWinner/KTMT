
.model small
	.stack 50
	.data
	       so db 10,0,10 dup($) 
	       tb1 db 'Nhap so: $'
	       tb2 db 10,13,'ket qua: $'
	       Tong db 0   
	       muoi db 10 
	.code
	    main proc
	        mov ax,@data
	        mov ds,ax
	        
	        lea dx,tb1
	        mov ah,9
	        int 21h  
	        
	        mov ah, 1
	        int 21h
	        
	        sub al, 30h
	        mov cl, al 
	        mov ax, 1
	        
	        mov bl, 0
	        start: 
	            inc bl
	            push cx
	            
	            loop start
	        
	        mov cl, bl    ;so lan lap
	        mov ax, 1 
	        check:
	            
	            pop dx 
	            mul dl
    	        loop check
        	mov dl, al
        	mov ah, 2
        	int 21h     
        	                                         
	        mov ah,4Ch
	        int 21h
	    main endp   
	    
	    
	    end 