BITS 64                                 ; 64-bit mode
SECTION .text                           ; Code section
GLOBAL strrchr                          ; Export 'strrchr'

strrchr:
        PUSH RBP                        ; Enter
        MOV RBP, RSP
        XOR RCX, RCX                    ; Init RCX to 0
        XOR R8, R8                      ; Init R8 to 0
        JMP loop                        ; Jump to the

loop:
        CMP BYTE[RDI + RCX], 0          ; Check if count byte of RDI is null
        JE last_check                   ; Jump to the last check
        CMP [RDI + RCX], SIL            ; Compare bytes to parameter
        JE find                         ; If equal, Jump to find
        INC RCX                         ; Increment count
        JMP loop                        ; looping

last_check:
        CMP [RDI + RCX], SIL            ; Check if the parameter is null
        JE endloop                      ; If it's, Jump to endloop
        JNE check_index                 ; If not, Jump to check_index

check_index:
        CMP R8, 0                       ; Check if value is found
        JE null                         ; If not found, Jump to null
        JNE endloop                     ; If found, Jump to endloop

find:
        MOV R8, RCX                     ; Save the count in R8
        INC RCX                         ; Increment the count
        JMP loop                        ; Jump to the loop

endloop:
        ADD RDI, R8                     ; Move the pointer of RDI by the save count
        MOV RAX, RDI                    ; Move RDI in RAX
        LEAVE                           ; Epilogue
        RET                             ; Return

null:
        XOR RAX, RAX                    ; MOve null in RAX
        LEAVE                           ; Leave
        RET                             ; Return