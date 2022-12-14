%include "asciitable.inc"

SECTION .rodata
    align 8
    global asciitable:data

asciitable:
    db (CHR_CTL<<1)+0  ;   0 0x00 '.'
    db (CHR_CTL<<1)+0  ;   1 0x01 '.'
    db (CHR_CTL<<1)+0  ;   2 0x02 '.'
    db (CHR_CTL<<1)+0  ;   3 0x03 '.'
    db (CHR_CTL<<1)+0  ;   4 0x04 '.'
    db (CHR_CTL<<1)+0  ;   5 0x05 '.'
    db (CHR_CTL<<1)+0  ;   6 0x06 '.'
    db (CHR_CTL<<1)+0  ;   7 0x07 '.'
    db (CHR_CTL<<1)+0  ;   8 0x08 '.'
    db (CHR_SPC<<1)+0  ;   9 0x09 '.'
    db (CHR_SPC<<1)+0  ;  10 0x0a '.'
    db (CHR_SPC<<1)+0  ;  11 0x0b '.'
    db (CHR_SPC<<1)+0  ;  12 0x0c '.'
    db (CHR_SPC<<1)+0  ;  13 0x0d '.'
    db (CHR_CTL<<1)+0  ;  14 0x0e '.'
    db (CHR_CTL<<1)+0  ;  15 0x0f '.'
    db (CHR_CTL<<1)+0  ;  16 0x10 '.'
    db (CHR_CTL<<1)+0  ;  17 0x11 '.'
    db (CHR_CTL<<1)+0  ;  18 0x12 '.'
    db (CHR_CTL<<1)+0  ;  19 0x13 '.'
    db (CHR_CTL<<1)+0  ;  20 0x14 '.'
    db (CHR_CTL<<1)+0  ;  21 0x15 '.'
    db (CHR_CTL<<1)+0  ;  22 0x16 '.'
    db (CHR_CTL<<1)+0  ;  23 0x17 '.'
    db (CHR_CTL<<1)+0  ;  24 0x18 '.'
    db (CHR_CTL<<1)+0  ;  25 0x19 '.'
    db (CHR_CTL<<1)+0  ;  26 0x1a '.'
    db (CHR_CTL<<1)+0  ;  27 0x1b '.'
    db (CHR_CTL<<1)+0  ;  28 0x1c '.'
    db (CHR_CTL<<1)+0  ;  29 0x1d '.'
    db (CHR_CTL<<1)+0  ;  30 0x1e '.'
    db (CHR_CTL<<1)+0  ;  31 0x1f '.'
    db (CHR_SPC<<1)+1  ;  32 0x20 ' '
    db (CHR_PCT<<1)+1  ;  33 0x21 '!'
    db (CHR_PCT<<1)+1  ;  34 0x22 '"'
    db (CHR_PCT<<1)+1  ;  35 0x23 '#'
    db (CHR_PCT<<1)+1  ;  36 0x24 '$'
    db (CHR_PCT<<1)+1  ;  37 0x25 '%'
    db (CHR_PCT<<1)+1  ;  38 0x26 '&'
    db (CHR_PCT<<1)+1  ;  39 0x27 '''
    db (CHR_PCT<<1)+1  ;  40 0x28 '('
    db (CHR_PCT<<1)+1  ;  41 0x29 ')'
    db (CHR_PCT<<1)+1  ;  42 0x2a '*'
    db (CHR_PCT<<1)+1  ;  43 0x2b '+'
    db (CHR_PCT<<1)+1  ;  44 0x2c ','
    db (CHR_PCT<<1)+1  ;  45 0x2d '-'
    db (CHR_PCT<<1)+1  ;  46 0x2e '.'
    db (CHR_PCT<<1)+1  ;  47 0x2f '/'
    db (CHR_DIG<<1)+1  ;  48 0x30 '0'
    db (CHR_DIG<<1)+1  ;  49 0x31 '1'
    db (CHR_DIG<<1)+1  ;  50 0x32 '2'
    db (CHR_DIG<<1)+1  ;  51 0x33 '3'
    db (CHR_DIG<<1)+1  ;  52 0x34 '4'
    db (CHR_DIG<<1)+1  ;  53 0x35 '5'
    db (CHR_DIG<<1)+1  ;  54 0x36 '6'
    db (CHR_DIG<<1)+1  ;  55 0x37 '7'
    db (CHR_DIG<<1)+1  ;  56 0x38 '8'
    db (CHR_DIG<<1)+1  ;  57 0x39 '9'
    db (CHR_PCT<<1)+1  ;  58 0x3a ':'
    db (CHR_PCT<<1)+1  ;  59 0x3b ';'
    db (CHR_PCT<<1)+1  ;  60 0x3c '<'
    db (CHR_PCT<<1)+1  ;  61 0x3d '='
    db (CHR_PCT<<1)+1  ;  62 0x3e '>'
    db (CHR_PCT<<1)+1  ;  63 0x3f '?'
    db (CHR_PCT<<1)+1  ;  64 0x40 '@'
    db (CHR_UPP<<1)+1  ;  65 0x41 'A'
    db (CHR_UPP<<1)+1  ;  66 0x42 'B'
    db (CHR_UPP<<1)+1  ;  67 0x43 'C'
    db (CHR_UPP<<1)+1  ;  68 0x44 'D'
    db (CHR_UPP<<1)+1  ;  69 0x45 'E'
    db (CHR_UPP<<1)+1  ;  70 0x46 'F'
    db (CHR_UPP<<1)+1  ;  71 0x47 'G'
    db (CHR_UPP<<1)+1  ;  72 0x48 'H'
    db (CHR_UPP<<1)+1  ;  73 0x49 'I'
    db (CHR_UPP<<1)+1  ;  74 0x4a 'J'
    db (CHR_UPP<<1)+1  ;  75 0x4b 'K'
    db (CHR_UPP<<1)+1  ;  76 0x4c 'L'
    db (CHR_UPP<<1)+1  ;  77 0x4d 'M'
    db (CHR_UPP<<1)+1  ;  78 0x4e 'N'
    db (CHR_UPP<<1)+1  ;  79 0x4f 'O'
    db (CHR_UPP<<1)+1  ;  80 0x50 'P'
    db (CHR_UPP<<1)+1  ;  81 0x51 'Q'
    db (CHR_UPP<<1)+1  ;  82 0x52 'R'
    db (CHR_UPP<<1)+1  ;  83 0x53 'S'
    db (CHR_UPP<<1)+1  ;  84 0x54 'T'
    db (CHR_UPP<<1)+1  ;  85 0x55 'U'
    db (CHR_UPP<<1)+1  ;  86 0x56 'V'
    db (CHR_UPP<<1)+1  ;  87 0x57 'W'
    db (CHR_UPP<<1)+1  ;  88 0x58 'X'
    db (CHR_UPP<<1)+1  ;  89 0x59 'Y'
    db (CHR_UPP<<1)+1  ;  90 0x5a 'Z'
    db (CHR_PCT<<1)+1  ;  91 0x5b '['
    db (CHR_PCT<<1)+1  ;  92 0x5c '\'
    db (CHR_PCT<<1)+1  ;  93 0x5d ']'
    db (CHR_PCT<<1)+1  ;  94 0x5e '^'
    db (CHR_PCT<<1)+1  ;  95 0x5f '_'
    db (CHR_PCT<<1)+1  ;  96 0x60 '`'
    db (CHR_LOW<<1)+1  ;  97 0x61 'a'
    db (CHR_LOW<<1)+1  ;  98 0x62 'b'
    db (CHR_LOW<<1)+1  ;  99 0x63 'c'
    db (CHR_LOW<<1)+1  ; 100 0x64 'd'
    db (CHR_LOW<<1)+1  ; 101 0x65 'e'
    db (CHR_LOW<<1)+1  ; 102 0x66 'f'
    db (CHR_LOW<<1)+1  ; 103 0x67 'g'
    db (CHR_LOW<<1)+1  ; 104 0x68 'h'
    db (CHR_LOW<<1)+1  ; 105 0x69 'i'
    db (CHR_LOW<<1)+1  ; 106 0x6a 'j'
    db (CHR_LOW<<1)+1  ; 107 0x6b 'k'
    db (CHR_LOW<<1)+1  ; 108 0x6c 'l'
    db (CHR_LOW<<1)+1  ; 109 0x6d 'm'
    db (CHR_LOW<<1)+1  ; 110 0x6e 'n'
    db (CHR_LOW<<1)+1  ; 111 0x6f 'o'
    db (CHR_LOW<<1)+1  ; 112 0x70 'p'
    db (CHR_LOW<<1)+1  ; 113 0x71 'q'
    db (CHR_LOW<<1)+1  ; 114 0x72 'r'
    db (CHR_LOW<<1)+1  ; 115 0x73 's'
    db (CHR_LOW<<1)+1  ; 116 0x74 't'
    db (CHR_LOW<<1)+1  ; 117 0x75 'u'
    db (CHR_LOW<<1)+1  ; 118 0x76 'v'
    db (CHR_LOW<<1)+1  ; 119 0x77 'w'
    db (CHR_LOW<<1)+1  ; 120 0x78 'x'
    db (CHR_LOW<<1)+1  ; 121 0x79 'y'
    db (CHR_LOW<<1)+1  ; 122 0x7a 'z'
    db (CHR_PCT<<1)+1  ; 123 0x7b '{'
    db (CHR_PCT<<1)+1  ; 124 0x7c '|'
    db (CHR_PCT<<1)+1  ; 125 0x7d '}'
    db (CHR_PCT<<1)+1  ; 126 0x7e '~'
    db (CHR_CTL<<1)+0  ; 127 0x7f '.'
    db (CHR_OTH<<1)+0  ; 128 0x80 '.'
