BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL strchr                           ; Export 'strchr'

strchr:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        loop:
                CMP BYTE[RDI + RCX], 0
                JE last_check
                CMP [RDI + RCX], SIL            ; Compare bytes to parameter
                JE find                      ; Jump to end when condition if true
                INC RCX                     ; Increment count
                JMP loop                    ; looping

last_check:
        CMP BYTE[RDI + RCX], SIL
        JE find
        JNE null
find:
        ADD RDI, RCX
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return

null:
        MOV RAX, 0
        LEAVE                           ; Epilogue
        RET                             ; Return
