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
        mov     rbp,rsp

        test    rdi,rdi
        jz      .func_end

        ; YOUR CODE HERE

.func_end:
        mov     eax,6
        mov     rsp,rbp
        pop     rbp
        ret
