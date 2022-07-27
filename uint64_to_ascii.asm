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
        mov     rbp,rsp

        ; YOUR CODE HERE

.func_end:
        mov     rsp,rbp
        pop     rbp
        ret
