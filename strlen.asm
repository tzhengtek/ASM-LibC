BITS 64                             ; 64-bit mode
SECTION .text                       ; Code section
GLOBAL strlen                       ; Export 'strlen'

strlen:
        PUSH RBP
        MOV RBP, RSP
        XOR RCX, RCX                ; Init RCX to 0
        LOOP:
            CMP BYTE[RDI + RCX], 0
            JE end
            INC RCX
            JMP LOOP

end:
        MOV RAX, RCX                ; RAX = number of character
        LEAVE                       ; Epilogue
        RET                         ; Return
