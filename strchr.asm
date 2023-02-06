BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL strchr                           ; Export 'strchr'

strlen:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        LOOP:
                CMP BYTE[RDI + RCX], 0
                JE null
                CMP [RDI + RCX], RSI        ; Compare bytes to '\0'
                JE find                      ; Jump to end when condition if true
                INC RCX                     ; Increment count
                JMP LOOP                    ; Looping

find:
        MOV RAX, [RDI + RCX]
        LEAVE                           ; Epilogue
        RET                             ; Return

null:
        MOV RAX, 0
        LEAVE                           ; Epilogue
        RET                             ; Return
