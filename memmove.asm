BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memmove                          ; Export 'memmove'

memmove:
        PUSH RBP                        ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        XOR R8, R8                      ; Init R8 to 0
        CMP RDI, RSI                    ; Check pointer of Src and Dest
        JL loop_forward                ; If greater: Jump on loop forward
        JMP launch_backward              ; If lower: Jump on launch backward

launch_backward:
        MOV RCX, RDX                    ; Save RDX in RCX
        DEC RCX                         ; Decrease by one the n byte
        JMP loop_backward               ; Jump on loop backward

loop_backward:
        XOR R8, R8
        MOV R8B, [RSI + RCX]            ; Save in register the nb byte on RSI
        MOV [RDI + RCX], R8B            ; Move the save byte into RDI
        CMP RCX, 0                      ; Check if nb byte is 0
        JE end                          ; End loop
        DEC RCX                         ; Decrease by one
        JMP loop_backward               ; Restart the loop

loop_forward:
        CMP RDX, RCX                    ; Check if counter is equal to the nb byte needed
        JE end                          ; End loop
        MOV R8B, [RSI + RCX]            ; Save in register the nb byte on RSI
        MOV [RDI + RCX], R8B            ; Move the save byte into RDI
        INC RCX                         ; Increment count
        JMP loop_forward                ; Restart the loop

end:
        MOV RAX, RDI                    ; Move Rax the modified RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
