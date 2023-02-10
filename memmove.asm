BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memmove                           ; Export 'memmove'

memmove:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        XOR R8, R8
        CMP RDI, RSI
        JLE loop_forward
        JG launch_backward

launch_backward:
        DEC RDX
        JMP loop_backward

loop_backward:
        MOV R8B, [RSI + RDX]
        MOV [RDI + RDX], R8B
        CMP RDX, 0
        JE end
        DEC RDX
        JMP loop_backward

loop_forward:
        CMP RDX, RCX
        JE end
        MOV R8B, [RSI + RCX]
        MOV [RDI + RCX], R8B
        INC RCX                     ; Increment count
        JMP loop_forward

end:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
