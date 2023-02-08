BITS 64                             ; 64-bit mode
SECTION .text                       ; Code section
GLOBAL strlen                       ; Export 'strlen'

strlen:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                ; Init RCX to 0
        loop:
            CMP BYTE[RDI + RCX], 0  ; Compare bytes to '\0'
            JE end                  ; Jump to end when condition if true
            INC RCX                 ; Increment count
            JMP loop                ; looping

end:
        MOV RAX, RCX                ; RAX = number of character
        LEAVE                       ; Epilogue
        RET                         ; Return
