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
        mov     rcx, rdi
        mov     rdi, rdx
        test    rdx, rdx
        je      .L9
        cmp     rdx, rsi
        jnb     .L2
.L9:
        test    rsi, rsi
        jne     .L4
        mov     DWORD [rcx], 808464432
        mov     WORD [rcx+4], 12336
        jmp     .L5
.L4:
        mov     DWORD [rcx], 589505315
        mov     WORD [rcx+4], 8995
        jmp     .L5
.L2:
        imul    rax, rsi, 10000
        xor     edx, edx
        div     rdi
        cmp     rdi, rsi
        mov     esi, 5
        mov     edi, 10
        sete    dl
        add     edx, 48
        mov     BYTE [rcx], dl
.L7:
        xor     edx, edx
        div     rdi
        add     edx, 48
        mov     BYTE [rcx+rsi], dl
        dec     rsi
        cmp     rsi, 1
        jne     .L7
.L5:
        mov     BYTE [rcx+1], 46
        mov     eax, 6
        ret
