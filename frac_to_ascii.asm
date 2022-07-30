;----------------------------------------------------------------------------
;
; DHBW Ravensburg - Campus Friedrichshafen
;
; Vorlesung Systemnahe Programmierung (SNP)
;
;----------------------------------------------------------------------------

;-----------------------------------------------------------------------------
; SECTION TEXT
;-----------------------------------------------------------------------------
SECTION .text

;-----------------------------------------------------------------------------
; FUNCTION: frac_to_ascii:
;
; C-Prototype:
;   int frac_to_ascii(char *s, uint64_t a, uint64_t b);
;
; Purpose:
;   Calculates the quotient of a/b and prints it in the format d.dddd if
;   b != 0 and a <= b, otherwise prints "#.####"
;
; Parameters:
;   rdi: char *s    :  output buffer
;   rsi: uint64_t a :  dividend
;   rdx: uint64_t b :  divisor
;
; Return Value:
;   rax: number of digits used
;
; Notes:
;   The output buffer will not be zero-terminated
;-----------------------------------------------------------------------------
        global frac_to_ascii:function
frac_to_ascii:
        push    rbp
        mov     rbp, rsp
        mov     QWORD [rbp-40], rdi
        mov     QWORD [rbp-48], rsi
        mov     QWORD [rbp-56], rdx
        cmp     QWORD [rbp-56], 0
        je      .L2
        mov     rax, QWORD [rbp-48]
        cmp     QWORD [rbp-56], rax
        jnb     .L3
.L2:
        cmp     QWORD [rbp-48], 0
        jne     .L4
        mov     DWORD [rbp-4], 0
        jmp     .L5
.L6:
        mov     eax, DWORD [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD [rbp-40]
        add     rax, rdx
        mov     BYTE [rax], 48
        add     DWORD [rbp-4], 1
.L5:
        cmp     DWORD [rbp-4], 5
        jle     .L6
        jmp     .L10
.L4:
        mov     DWORD [rbp-8], 0
        jmp     .L8
.L9:
        mov     eax, DWORD [rbp-8]
        movsx   rdx, eax
        mov     rax, QWORD [rbp-40]
        add     rax, rdx
        mov     BYTE [rax], 35
        add     DWORD [rbp-8], 1
.L8:
        cmp     DWORD [rbp-8], 5
        jle     .L9
        jmp     .L10
.L3:
        mov     rax, QWORD [rbp-48]
        imul    rax, rax, 10000
        mov     edx, 0
        div     QWORD [rbp-56]
        mov     QWORD [rbp-16], rax
        mov     rax, QWORD [rbp-48]
        cmp     rax, QWORD [rbp-56]
        jne     .L11
        mov     rax, QWORD [rbp-40]
        mov     BYTE [rax], 49
        jmp     .L12
.L11:
        mov     rax, QWORD [rbp-40]
        mov     BYTE [rax], 48
.L12:
        mov     DWORD [rbp-20], 5
        jmp     .L13
.L14:
        mov     DWORD [rbp-24], 15
        mov     eax, DWORD [rbp-24]
        mov     edx, eax
        mov     rax, QWORD [rbp-16]
        and     eax, edx
        mov     BYTE [rbp-25], al
        movzx   eax, BYTE [rbp-25]
        lea     ecx, [rax+48]
        mov     eax, DWORD [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD [rbp-40]
        add     rax, rdx
        mov     edx, ecx
        mov     BYTE [rax], dl
        shr     QWORD [rbp-16], 4
        sub     DWORD [rbp-20], 1
.L13:
        cmp     DWORD [rbp-20], 1
        jg      .L14
.L10:
        mov     rax, QWORD [rbp-40]
        add     rax, 1
        mov     BYTE [rax], 46
        mov     eax, 6
        pop     rbp
        ret
