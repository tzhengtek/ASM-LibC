BITS 64                                         ; 64-bit mode
SECTION .text                                   ; Code section
GLOBAL strchr                                   ; Export 'strchr'

strchr:
        PUSH RBP                                ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                            ; Init RCX to 0
        JMP loop                                ; enter loop

loop:
        CMP BYTE[RDI + RCX], 0                  ; Check if the nb byte of RDI is null
        JE last_check                           ; Go to the last check
        CMP [RDI + RCX], SIL                    ; Compare bytes to parameter
        JE find                                 ; Jump to end when condition if true
        INC RCX                                 ; Increment count
        JMP loop                                ; looping

last_check:
        CMP BYTE[RDI + RCX], SIL                ; Check if the last byte is equal null
        JE find                                 ; Find the corresponding byte
        JNE null                                ; Didn't find the corresponding byte
find:
        ADD RDI, RCX                            ; Move the pointer of RDI by nb byte
        MOV RAX, RDI                            ; Move in RAX RDI
        LEAVE                                   ; Epilogue
        RET                                     ; Return

null:
        XOR RAX, RAX                            ; Move in RAX null value
        LEAVE                                   ; Epilogue
        RET                                     ; Return
