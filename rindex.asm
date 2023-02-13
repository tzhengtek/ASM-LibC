BITS 64                     ; 64-bits mode
SECTION .text               ; Code section
GLOBAL rindex                ; Export 'rindex'
EXTERN strrchr

index:
    PUSH RBP                ; Enter
    MOV RBP, RSP
    call strrchr wrt ..plt  ; Call strrchr
    LEAVE                   ; Leave
    RET                     ; Return
