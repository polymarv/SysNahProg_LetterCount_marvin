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
.LC0:
        .string "You entered: %d"
frac_to_ascii:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     QWORD PTR [rbp-48], rsi
        mov     QWORD PTR [rbp-56], rdx
        cmp     QWORD PTR [rbp-56], 0
        je      .L2
        mov     rax, QWORD PTR [rbp-48]
        cmp     QWORD PTR [rbp-56], rax
        jnb     .L3
.L2:
        mov     DWORD PTR [rbp-4], 0
        jmp     .L4
.L5:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     BYTE PTR [rax], 35
        add     DWORD PTR [rbp-4], 1
.L4:
        cmp     DWORD PTR [rbp-4], 5
        jle     .L5
        jmp     .L6
.L3:
        mov     rax, QWORD PTR [rbp-48]
        imul    rax, rax, 10000
        mov     edx, 0
        div     QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-48]
        cmp     rax, QWORD PTR [rbp-56]
        jne     .L7
        mov     rax, QWORD PTR [rbp-40]
        mov     BYTE PTR [rax], 49
        jmp     .L8
.L7:
        mov     rax, QWORD PTR [rbp-40]
        mov     BYTE PTR [rax], 48
.L8:
        mov     DWORD PTR [rbp-20], 5
        jmp     .L9
.L10:
        mov     DWORD PTR [rbp-24], 15
        mov     eax, DWORD PTR [rbp-24]
        mov     edx, eax
        mov     rax, QWORD PTR [rbp-16]
        and     eax, edx
        mov     BYTE PTR [rbp-25], al
        movzx   eax, BYTE PTR [rbp-25]
        lea     ecx, [rax+48]
        mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, ecx
        mov     BYTE PTR [rax], dl
        movzx   eax, BYTE PTR [rbp-25]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    printf
        shr     QWORD PTR [rbp-16], 4
        sub     DWORD PTR [rbp-20], 1
.L9:
        cmp     DWORD PTR [rbp-20], 1
        jg      .L10
.L6:
        mov     rax, QWORD PTR [rbp-40]
        add     rax, 1
        mov     BYTE PTR [rax], 46
        mov     eax, 6
        leave
        ret
