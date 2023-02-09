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
                JE last_check
                CMP [RDI + RCX], SIL     ; Compare bytes to parameter
                JE find
                INC RCX                     ; Increment count
                JMP loop                    ; looping

last_check:
        CMP [RDI + RCX], SIL
        JE endloop
        JNE check_index

check_index:
        CMP R8, 0
        JE null
        JNE endloop

find:
        MOV R8, RCX
        INC RCX
        JMP loop

endloop:
        ADD RDI, R8
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return

null:
        MOV RAX, 0
        LEAVE
        RET