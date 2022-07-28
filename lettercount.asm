;-----------------------------------------------------------------------------
;
; DHBW Ravensburg - Campus Friedrichshafen
;
; Vorlesung Systemnahe Programmierung (SNP)
;
;----------------------------------------------------------------------------

%include "syscall.inc"  ; OS-specific system call macros
%include "asciitable.inc"

extern  asciitable
extern  uint64_to_ascii
extern  frac_to_ascii

;-----------------------------------------------------------------------------
; CONSTANTS
;-----------------------------------------------------------------------------

%define BUFFER_SIZE          80 ; max buffer size
%define CHR_LF               10 ; line feed (LF) character
%define CHR_CR               13 ; carriage return (CR) character

%define UINT64_DIGITS        16
%define FRAC_DIGITS           6


;-----------------------------------------------------------------------------
; Section DATA
;-----------------------------------------------------------------------------
SECTION .data

chcateg:    times 7 dq 0
chtotal:    dq 0
chprint:    dq 0
chalpha:    times 26 dq 0
chaltot:    dq 0

outstr1:
            db "DIG:   "
.dig        times UINT64_DIGITS db " "
            db "  "
.dig_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "LOW:   "
.low        times UINT64_DIGITS db " "
            db "  "
.low_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "SPC:   "
.spc        times UINT64_DIGITS db " "
            db "  "
.spc_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "UPP:   "
.upp        times UINT64_DIGITS db " "
            db "  "
.upp_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "PCT:   "
.pct        times UINT64_DIGITS db " "
            db "  "
.pct_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "CTL:   "
.ctl        times UINT64_DIGITS db " "
            db "  "
.ctl_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "OTH:   "
.oth        times UINT64_DIGITS db " "
            db "  "
.oth_frac   times FRAC_DIGITS db " "
            db CHR_LF
            db "ALPHA: "
.alpha      times UINT64_DIGITS db " "
            db "  "
.alpha_frac times FRAC_DIGITS db " "
            db CHR_LF
            db "PRINT: "
.print      times UINT64_DIGITS db " "
            db "  "
.print_frac times FRAC_DIGITS db " "
            db CHR_LF
            db "TOTAL: "
.total      times UINT64_DIGITS db " "
            db "  "
.total_frac times FRAC_DIGITS db " "
            db CHR_LF, CHR_LF
outstr1_len equ $-outstr1

outstr2:
.char_left  db "a:     "
.dec_left   times UINT64_DIGITS db " "
            db "  "
.frac_left  times FRAC_DIGITS db " "
            db " |  "
.char_right db "n: "
.dec_right  times UINT64_DIGITS db " "
            db "  "
.frac_right times FRAC_DIGITS db " "
            db CHR_LF
outstr2_len equ $-outstr2

cntstr:
            dq outstr1.dig
            dq outstr1.low
            dq outstr1.spc
            dq outstr1.upp
            dq outstr1.pct
            dq outstr1.ctl
            dq outstr1.oth
cntstr_num  equ ($-cntstr)/8


;-----------------------------------------------------------------------------
; Section BSS
;-----------------------------------------------------------------------------
SECTION .bss

buffer          resb BUFFER_SIZE


;-----------------------------------------------------------------------------
; SECTION TEXT
;-----------------------------------------------------------------------------
SECTION .text

        ;-----------------------------------------------------------
        ; PROGRAM'S START ENTRY
        ;-----------------------------------------------------------
        global _start:function  ; make label available to linker
_start:
        nop

        ; YOUR CODE HERE: read and process input

finished:

        ; YOUR CODE HERE: print result

        ; EXAMPLE: print total number of input characters
        mov     r14,[chtotal]

        mov     rdi,outstr1.total
        mov     rsi,r14
        mov     edx,UINT64_DIGITS
        call    uint64_to_ascii

        mov     rdi,outstr1.total_frac
        mov     rsi,r14
        mov     rdx,r14
        call    frac_to_ascii

        ;-----------------------------------------------------------
        ; print output string
        ;-----------------------------------------------------------
        SYSCALL_4 SYS_WRITE, FD_STDOUT, outstr1, outstr1_len

        ; EXAMPLE: print count for each character a-z in two columns
        xor     ebx,ebx
        mov     r14,[chtotal]
.outloop2:
        lea     rdi,[outstr2.dec_left]
        mov     rsi,[chalpha+rbx*8]
        mov     edx,UINT64_DIGITS
        ; COMPLETE LOOP BODY

        ;-----------------------------------------------------------
        ; print output string
        ;-----------------------------------------------------------
        SYSCALL_4 SYS_WRITE, FD_STDOUT, outstr2, outstr2_len
        inc     byte [outstr2.char_left]
        inc     byte [outstr2.char_right]
        inc     ebx
        cmp     ebx,13
        jne     .outloop2

        ;-----------------------------------------------------------
        ; call system exit and return to operating system / shell
        ;-----------------------------------------------------------
_exit:  SYSCALL_2 SYS_EXIT, 0
        ;-----------------------------------------------------------
        ; END OF PROGRAM
        ;-----------------------------------------------------------
