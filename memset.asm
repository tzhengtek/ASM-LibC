BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL memset                           ; Export 'memset'

memset:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        JMP loop

loop:
        CMP BYTE[RDI + RCX], 0
        JE null
        CMP RDX, RCX
        JG switch
        INC RCX                     ; Increment count
        JMP loop                    ; looping

switch:
        MOV BYTE[RDI + RCX], SIL
        INC RCX
        JMP loop

null:
        MOV RAX, RDI
        LEAVE                           ; Epilogue
        RET                             ; Return
