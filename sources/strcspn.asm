BITS 64                                         ; 64-bit mode
SECTION .text                                   ; Code section
GLOBAL strcspn                                  ; Export 'strcspn'

strcspn:
        PUSH RBP                                ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                            ; Init RCX at 0 as counter for RDI
        XOR RDX, RDX                            ; Init RDX at 0 as counter for RSI
        JMP loop                                ; Jump to loop

loop:
        XOR RDX, RDX                            ; Init RDX counter at 0 every loop
        CMP BYTE[RDI + RCX], 0                  ; Compare if the counter byte of RDI is null
        JE end                                  ; Jump to end loop
        MOV R8B, BYTE[RDI + RCX]                ; Save the nb byte of RDI in R8B
        JMP check_loop                          ; Jump to the second loop check

check_loop:
        CMP BYTE[RSI + RDX], 0                  ; Check if RSI counter byte is null
        JE increment                            ; Jump to increment counter for RDI
        CMP [RSI + RDX], R8B                    ; Compare if the RSI counter byte is equal to RDI counter byte
        JE end                                  ; If equal, end loop
        INC RDX                                 ; Increment the RSI counter
        JMP check_loop                          ; Looping on RSI

increment:
        INC RCX                                 ; Increment the counter of RDI
        JMP loop                                ; Looping

end:
        MOV RAX, RCX                            ; Move the counter of RDI in RAX
        LEAVE                                   ; Leave
        RET                                     ; Return
