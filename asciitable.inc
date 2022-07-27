;-----------------------------------------------------------------------------
; asciitable.inc
;-----------------------------------------------------------------------------
;
; DHBW Ravensburg - Campus Friedrichshafen
;
; Vorlesung Systemnahe Programmierung (SNP)
;
;----------------------------------------------------------------------------
;
; Author: Ralf Reutemann
; Created: 2014-11-21
;
;----------------------------------------------------------------------------


%ifndef ASCIITABLE_INC

;-----------------------------------------------------------------------------
; CONSTANTS
;-----------------------------------------------------------------------------

%define CHR_DIG 0  ; digit 0 through 9
%define CHR_LOW 1  ; lowercase letter
%define CHR_SPC 2  ; white-space letter
%define CHR_UPP 3  ; uppercase character
%define CHR_PCT 4  ; printable character not space or alnum
%define CHR_CTL 5  ; control character
%define CHR_OTH 6  ; non-ascii character (>127)

%endif
