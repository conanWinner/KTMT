.MODEL Small
.STACK 100h
.DATA
    tb1 DB "Nhap vao 1 chuoi: $"
    tb2 DB 10, 13, "Tong chieu dai cua chuoi: $"
    s DB 100 dup("$")  ; chuoi nhap vao

    ; Menu data
    menu_header db 10, 13, '=======Danh sach cac chuc nang=======$'
    menu_1 db 10,13,'1. Nhap chuoi$'
    menu_2 db 10,13,'2. Tinh chieu dai chuoi$'
    menu_3 db 10,13,'3. Chuyen sang chuoi in thuong$'
    menu_4 db 10,13,'4. Chuyen sang chuoi in hoa$'
    menu_exit db 10,13,'0. Thoat$'
    chon db 10,13,'Moi ban chon chuc nang: $'   
    x db ?

.CODE
MAIN:
    MOV AX, @DATA
    MOV DS, AX ; khoi tao thanh ghi ds
    
    ; Menu loop
    MenuLoop:
        LEA DX, menu_header
        MOV AH, 9
        INT 21H
    
        LEA DX, menu_1
        MOV AH, 9
        INT 21H
        
        LEA DX, menu_2
        MOV AH, 9
        INT 21H
        
        LEA DX, menu_3
        MOV AH, 9
        INT 21H
        
        LEA DX, menu_4
        MOV AH, 9
        INT 21H
        
        LEA DX, menu_exit
        MOV AH, 9
        INT 21H
    
        ; Get user choice
        LEA DX, chon
        MOV AH, 9
        INT 21H
        MOV AH, 1
        INT 21H
        SUB AL, '0'
        MOV x, AL
    
        ; Perform actions based on user choice
        CMP x, 1
        JE NhapChuoi
        CMP x, 2
        JE ChieuDai
        CMP x, 3
        JE InThuong
        CMP x, 4
        JE InHoa
        CMP x, 0
        JE ExitProgram
        JMP MenuLoop
    
    NhapChuoi:
        ; Nhap chuoi
        LEA DX, tb1
        MOV AH, 9
        INT 21H 
        
        LEA DX, s 
        MOV AH, 10
        INT 21H 
    
        JMP MenuLoop
    
    ChieuDai:
        ; Tinh chieu dai chuoi
        LEA DX, tb2
        MOV AH, 9
        INT 21H
    
        ; Tinh chieu dai chuoi
        MOV AX, 0
        MOV AL, s+1  ; Chuyen chieu dai chuoi vao ax (al=9)
        MOV CX, 0    ; Khoi tao bien dem cx=0 (count)
        MOV BX, 10 ; Khoi tao so chia
    
        LapDem1:
            MOV DX, 0  ; Khoi tao phan du bang 0
            DIV BX ; Chia 10
            PUSH DX ; Lay dx la phan du day vao ngan xep
            INC CX ; Tang cx len 1 don vi
            CMP AX, 0 ; So sanh ax phan thuong  khac 0 thi tiep tuc vong lap
            JNZ LapDem1 ; Jump not zero
    
        LapDem2:
            ; Lay cac so tu ngan xep ra
            POP DX ; Chua so du trong phep chia
            ADD DX, '0' ; Chuyen chu so -> ky tu so  
            MOV AH, 2
            INT 21H
            LOOP LapDem2  
    
        JMP MenuLoop
    
    InThuong:
        ; Chuyen sang chuoi in thuong
        LEA DX, s
        MOV SI, DX
        CALL thuong
        JMP MenuLoop
    
    InHoa:
        ; Chuyen sang chuoi in hoa
        LEA DX, s
        MOV SI, DX
        CALL hoa
        JMP MenuLoop
    
    ExitProgram:
        MOV AH, 4Ch
        INT 21H

thuong PROC
    ; Ham in thuong
    Lap1:
        MOV DL, [SI]
        CMP DL, 'A' ; Compare
        JL In1  ; Jump less
        CMP DL, 'Z' ; Compare
        JG In1   ; Jump greater
        ADD DL, 32  ; Chuyen ky tu hoa thanh thuong
    In1:
        MOV AH, 2 ; In ky tu
        INT 21H
        INC SI  ; Increase
        CMP [SI], '$' ; Compare
        JNE Lap1 ; Jump not equal
    RET  ; Return
thuong ENDP

hoa PROC
    ; Ham in hoa
    Lap2:
        MOV DL, [SI]
        CMP DL, 'a'
        JL In2
        CMP DL, 'z'
        JG In2
        SUB DL, 32  ; Chuyen ky tu thuong thanh hoa
    In2:
        MOV AH, 2 ; In ky tu
        INT 21H
        INC SI  ; Increase
        CMP [SI], '$' ; Compare
        JNE Lap2 ; Jump not equal
    RET  ; Return
hoa ENDP

END MAIN
