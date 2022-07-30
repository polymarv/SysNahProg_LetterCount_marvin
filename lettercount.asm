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

next_string:
        ;-----------------------------------------------------------
        ; read string from standard input (usually keyboard)
        ;-----------------------------------------------------------
        ;TODO Stolen by Floskinner!
        SYSCALL_4 SYS_READ, FD_STDIN, buffer, BUFFER_SIZE
        test    rax, rax                ; check system call return value
        jz      finished             ; exit with error status code if string is empty

        ; rsi: pointer to current character in input_buffer
        lea     rsi, [buffer]     ; load pointer to character buffer
        mov     byte [rsi+rax], 0       ; zero terminate string

        xor     rcx, rcx                ; clear rcx TODO: Why??
        xor     r13, r13                ; clear r13 TODO: Why??

next_sec_char:
        cmp     byte [rsi], 0  
        jne     next_string ; Todo kein erneutes einlesen!
        mov     r12, [chtotal]
        inc     r12
        mov     [chtotal], r12
        ; Syntax
        ; Controll = 0 - 31
        ; Space = 32
        ; printable = 33-47
        ; digits = 48-57
        ; Non-Ascii = >127

        ; printable = all
        ; and
        ; upper = 65 - 90
        ; lower = 97-122

        movzx   edx, byte [rsi]             ; load next character from buffer to edx
        xor     r8, r8                      ; clear r8

        ;lea     r8d, rdx                    ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, 31                     ; check whether character is controll = 0 - 31
        ;jbe     chr_cntl                    ; TODO: edit: yes, then convert seconds to complete number

        ;lea     r8d, rdx                    ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, 32                     ; check whether character is space = 32
        ;je      chr_spc                     ; TODO: edit: yes, then convert seconds to complete number

        ;lea     r8d, [rdx-"!"]              ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, ("/"-"!")              ; check whether character is printable = 33-47
        ;jbe     chr_printable               ; TODO: edit: yes, then convert seconds to complete number

        lea     r8d, [rdx-'0']              ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        cmp     r8b, ('9'-'0')              ; check whether character is digits = 48-57
        jbe     chr_digit                   ; TODO: edit: yes, then convert seconds to complete number

        ;lea     r8d, [rdx]                  ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, 127                    ; check whether character is non-Ascii = >127
        ;jg      char_no_ascii               ; TODO: edit: yes, then convert seconds to complete number

        ;lea     r8d, [rdx-"A"]              ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, ("Z"-"A")              ; check whether character is upper = 65 - 90
        ;jbe     chr_upper                   ; TODO: edit: yes, then convert seconds to complete number

        ;lea     r8d, [rdx-"a"]              ; TODO: edit: number = rdx (ASCII) - '.' (ASCII) saved in r8d
        ;cmp     r8b, ("z"-"a")              ; check whether character is upper = 65 - 90
        ;jbe     chr_upper                   ; TODO: edit: yes, then convert seconds to complete number


clean_next_char:
        inc     rsi             ; increment pointer to next char in string
        cmp     byte [rsi], 0  
        jne     next_sec_char ; Todo kein erneutes einlesen!
        jmp     next_string

chr_digit:
        inc qword [chcateg]
        jmp clean_next_char


finished:

        ; YOUR CODE HERE: print result

        ; EXAMPLE: print total number of input characters
        mov     r14,[chcateg]

        mov     rdi,outstr1.dig
        mov     rsi,r14
        mov     edx,UINT64_DIGITS
        call    uint64_to_ascii

        mov     rdi,outstr1.dig_frac
        mov     rsi,r14
        mov     rdx,r14
        call    frac_to_ascii



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
