BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL strrchr                           ; Export 'strrchr'

strrchr:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        XOR R8, R8
        loop:
                CMP BYTE[RDI + RCX], 0
                JE endloop
                CMP [RDI + RCX], SIL     ; Compare bytes to parameter
                JE find
                INC RCX                     ; Increment count
                JMP loop                    ; looping

find:
        MOV R8, RCX
        INC RCX
        JMP loop

endloop:
        CMP R8, 0
        JE null
        ADD RDI, R8
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return

null:
        MOV RAX, 0
        LEAVE
        RET