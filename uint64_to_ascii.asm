;-----------------------------------------------------------------------------
;
; DHBW Ravensburg - Campus Friedrichshafen
;
; Vorlesung Systemnahe Programmierung (SNP)
;
;----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; Section TEXT
;-----------------------------------------------------------------------------
SECTION .text

;-----------------------------------------------------------------------------
; FUNCTION: uint64_to_ascii:
;
; C-Prototype:
;   int uint64_to_ascii(char *s, uint64_t value, int digits);
;
; Parameters:
;   rdi: char *s    :  output buffer
;   rsi: uint64_t x :  uint64 value to convert to ASCII representation
;   rdx: int digits :  maximum number of digits the output buffer can hold
;                      if digits is negative, empty space on the left is
;                      filled with '0' to all -digits characters of the
;                      output buffer
;
; Return Value:
;   rax: number of digits used
;
; Notes:
;   The output buffer will not be zero-terminated
;-----------------------------------------------------------------------------
        global uint64_to_ascii:function
uint64_to_ascii:
        push    rbp
        mov     rbp, rsp
        mov     QWORD [rbp-24], rdi
        mov     QWORD [rbp-32], rsi
        mov     DWORD [rbp-36], edx
        mov     DWORD [rbp-4], 15
        jmp     .L2
.L3:
        mov     rcx, QWORD [rbp-32]
        movabs  rdx, -3689348814741910323
        mov     rax, rcx
        mul     rdx
        shr     rdx, 3
        mov     rax, rdx
        sal     rax, 2
        add     rax, rdx
        add     rax, rax
        sub     rcx, rax
        mov     rdx, rcx
        mov     BYTE [rbp-5], dl
        movzx   eax, BYTE [rbp-5]
        lea     ecx, [rax+48]
        mov     eax, DWORD [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD [rbp-24]
        add     rax, rdx
        mov     edx, ecx
        mov     BYTE [rax], dl
        mov     rax, QWORD [rbp-32]
        movabs  rdx, -3689348814741910323
        mul     rdx
        mov     rax, rdx
        shr     rax, 3
        mov     QWORD [rbp-32], rax
        sub     DWORD [rbp-4], 1
.L2:
        cmp     DWORD [rbp-4], 0
        jns     .L3
        mov     eax, 0
        pop     rbp
        ret
