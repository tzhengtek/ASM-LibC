BITS 64                     ; 64-bits mode
SECTION .text               ; Code section
GLOBAL index                ; Export 'index'
EXTERN strchr

index:
    PUSH RBP                ; Enter
    MOV RBP, RSP
    call strchr wrt ..plt   ; Call strchr
    LEAVE                   ; Leave
    RET                     ; Return
