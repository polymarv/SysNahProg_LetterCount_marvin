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
        mov     rax, rsi ;schreibe input in rax register
        mov     ecx, 15 ;schreibe 15 in kleinen Teil des rcx register
        mov     esi, 10 ; schreibe 10 in kleinen teil des rsi register
.L2:
        xor     edx, edx ;verhindere Fehler bei nachfolgender Division = clear rdx
        div     rsi ;Teile rax/rsi => teile input / 10 | rax=ergebnis und rdx=rest
        add     edx, 48 ;adde zum rest 48 (48 ascii= '0') = Konvertiere Zahl zu ascii
        mov     BYTE [rdi+rcx], dl ;schreibe Wert von rdx in output buffer an Stelle 15
        cmp rax, 0  ; vergleich von rax (input) und 0
        je .finish ; wenn rax leer, dann verlasse unterprogramm
        sub     rcx, 1 ;verringere rcx um eins um von rechts nach links das Buffer zu füllen => |    12345  |
        jnb     .L2 ;loope bis 0 erreicht. Also von 16 -1 -1 -1 -...-> 0 erreicht
        jmp .finish

.finish:       
        xor     eax, eax ;clear rax register
        ret

