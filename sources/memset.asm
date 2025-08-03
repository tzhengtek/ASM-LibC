BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memset                           ; Export 'memset'

memset:
        PUSH RBP                        ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        JMP loop

loop:
        CMP RDX, RCX                    ; Check if counter equal RDX
        JE null                         ; End loop
        MOV BYTE[RDI + RCX], SIL        ; Move the byte into RDI
        INC RCX                         ; Increment count
        JMP loop                        ; Restart loop

null:
        MOV RAX, RDI                    ; Move in RAX RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
