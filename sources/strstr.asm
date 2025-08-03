BITS 64                                         ; 64-bits mode
SECTION .text                                   ; Code section
GLOBAL strstr                                   ; Export 'strstr'

strstr:
        PUSH RBP                                ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                            ; Init count of RDI to 0
        XOR RDX, RDX                            ; Init count of RSI to 0
        XOR R9, R9                              ; Init R9 to 0
        JMP loop                                ; Jump to loop

loop:
        ADD RDX, RCX                            ; Add the RSI's count to RDI's
        CMP BYTE[RDI + RDX], 0                  ; Check if RSI count of RDI is not null
        JE last_check                           ; Jump to the last check
        XOR RDX, RDX                            ; Init RSI count to 0 every loop
        JMP check_loop                          ; Jump to the second loop

check_loop:
        MOV R9, RCX                             ; Save the RDI count in R9
        ADD R9, RDX                             ; Increment it by the RSI count
        MOV R10B, [RDI + R9]                    ; Save the save count byte of RDI in R10B
        CMP BYTE[RSI + RDX], 0                  ; Compare it with null
        JE found                                ; If equal, Jump to found
        CMP BYTE[RSI + RDX], R10B               ; Check the save byte is eqaul to the count byte of RSI
        JNE increment                           ; If not, Jump to increment
        INC RDX                                 ; Increment RSi count
        JMP check_loop                          ; Looping

increment:
        INC RCX                                 ; Increment RDI count
        JMP loop                                ; Looping

found:
        ADD RDI, RCX                            ; Move the pointer of RDI by its count
        MOV RAX, RDI                            ; Move RDI in RAX
        LEAVE                                   ; Leave
        RET                                     ; Return

last_check:
        CMP BYTE[RSI], 0                        ; Verify if both are null
        JE empty                                ; Jump to empty
        JMP error                               ; Jump to error

empty:
        MOV RAX, RDI                            ; Move RDI in RAX
        LEAVE                                   ; Leave
        RET                                     ; Return

error:
        XOR RAX, RAX                            ; Move null to RAX
        LEAVE                                   ; Leave
        RET                                     ; Return
