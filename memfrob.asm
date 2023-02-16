BITS 64                             ; 64-bit mode
SECTION .text                       ; Code section
GLOBAL memfrob                      ; Export 'memfrob'

memfrob:
        PUSH RBP                    ; Enter
        MOV RBP, RSP
        XOR R8, R8
        XOR RCX, RCX                ; Set counter to 0
        JMP loop                    ; Jump to the loop

loop:
        CMP RCX, RSI                ; Check if counter equal nb byte
        JE end                      ; Jump to end
        MOV R8B, [RDI + RCX]        ; Save the byte
        XOR R8B, 42                 ; Xor with 42
        MOV BYTE[RDI + RCX], R8B    ; Insert value
        INC RCX                     ; Increment counter
        JMP loop                    ; Jump to loop

end:
    MOV RAX, RDI                    ; Move RDI to RAX
    LEAVE                           ; Leave
    RET                             ; Return