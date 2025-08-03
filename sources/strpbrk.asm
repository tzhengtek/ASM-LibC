BITS 64                                         ; 64-bit mode
SECTION .text                                   ; Code section
GLOBAL strpbrk                                  ; Export 'strpbrk'

strpbrk:
        PUSH RBP                                ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                            ; Init counter of RDI to 0
        XOR RDX, RDX                            ; Init counter of RSI to 0
        JMP loop                                ; Jump to the loop

loop:
        XOR RDX, RDX                            ; Init counter of RSI to 0 every loop
        MOV R8B, BYTE[RDI + RCX]                ; Save the count byte of RDI in R8B
        CMP BYTE[RDI + RCX], 0                  ; Check if RDI count byte is null
        JE error                                ; Jump to error
        JMP check_loop                          ; Jump to the RSI loop

check_loop:
        CMP BYTE[RSI + RDX], 0                  ; Check if RSI countbyte is null
        JE increment                            ; Jump to increment the count byte of RDI
        CMP [RSI + RDX], R8B                    ; Check if count byte of RSi is equal to R8B
        JE found                                ; If equal, Jump to found
        INC RDX                                 ; Increment RSI count
        JMP check_loop                          ; Looping on RSI value

increment:
        INC RCX                                 ; Increment RDI count
        JMP loop                                ; Jump to first loop

found:
        ADD RDI, RCX                            ; Move the pointer of RDI by its count
        MOV RAX, RDI                            ; Move RDI in RAX
        LEAVE                                   ; Leave
        RET                                     ; Return

error:
        XOR RAX, RAX                            ; Move null in RAX
        LEAVE                                   ; Leave
        RET                                     ; Return
