BITS 64                                     ; 64-bit mode
SECTION .text                               ; Code section
GLOBAL strcmp                               ; Export 'strcmp'

strcmp:
        PUSH RBP                            ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                        ; Init RCX to 0
        XOR R8, R8                          ; Init R8 to 0
        XOR R9, R9                          ; Init R9 to 0
        JMP loop                            ; Jump to loop

loop:
        MOV R8B, [RDI + RCX]                ; Move the RDI n byte in R8B
        MOV R9B, [RSI + RCX]                ; Move the RSI n byte in R9B
        CMP R8B, 0                          ; Check if R8B is null
        JE last_check                       ; Move to the last check
        CMP R9B, 0                          ; Check if R9B is null
        JE last_check                       ; Move to the last check
        CMP R8B, R9B                        ; Compare R8B and R9B
        JNE error                           ; Move to the not equal label
        INC RCX                             ; Increment count
        JMP loop                            ; Looping

last_check:
    CMP R8B, R9B                            ; Check the last byte : 'null'
    JNE error                               ; Jump get the difference
    JE equal                                ; Jump to same byte

equal:
    XOR RAX, RAX                            ; Move in RAX null
    LEAVE                                   ; Leave
    RET                                     ; Return

error:
    SUB R8, R9                              ; Get the difference value of the two bytes
    MOV RAX, R8                             ; Move R8 in RAX
    LEAVE                                   ; Leave
    RET                                     ; Return
