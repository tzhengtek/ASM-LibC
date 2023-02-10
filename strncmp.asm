BITS 64                                     ; 64-bit mode
SECTION .text                               ; Code section
GLOBAL strncmp                              ; Export 'strncmp'

strncmp:
        PUSH RBP                            ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                        ; Init RCX to 0 as count
        XOR R8, R8                          ; Init register R8 to 0
        XOR R9, R9                          ; init register R9 to 0
        JMP loop                            ; Jump to loop

loop:
        CMP RDX, RCX                        ; Check if count is equal to the nb byte needed
        JE equal                            ; Jump to equal
        MOV R8B, [RDI + RCX]                ; Save the count byte of RDI in R8B
        MOV R9B, [RSI + RCX]                ; Save the count byte of RSI in R9B
        CMP R8B, 0                          ; Check if R8B is equal to null
        JE last_check                       ; Jump to the last check
        CMP R9B, 0                          ; Check if R9B is equal to null
        JE last_check                       ; Jump to the last check
        CMP R8B, R9B                        ; Compare R8B and R9B
        JNE error                           ; If not equal, Jump to error
        INC RCX                             ; Increment count
        JMP loop                            ; Loop

last_check:
    CMP R8B, R9B                            ; Check if both are null value
    JNE error                               ; If not, Jump to error
    JE equal                                ; Jump to equal

equal:
    XOR RAX, RAX                            ; Move 0 in RAX
    LEAVE                                   ; Leave
    RET                                     ; Return

error:
    SUB R8, R9                              ; Get the difference of the two byte
    MOV RAX, R8                             ; Move the difference in RAX
    LEAVE                                   ; Leave
    RET                                     ; Return
