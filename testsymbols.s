PTR  = $06
COUT = $FDED

        ORG $1100
BEGIN   LDA #<MEMORY+1 ; 1100
        STA PTR        ; 1102
        LDA #>MEMORY   ; 1104
        STA PTR+1      ; 1106
        LDY #0         ; 1108
LOOP    LDA (PTR),Y    ; 110A
        STA MEMORY     ; 110C
        JSR COUT       ; 110F
        LDA MEMORY     ; 110C
        CMP #$8D       ; 1115
        BEQ Done       ; 1117
        INY            ; 1119
        BNE LOOP       ; 111A
Done    RTS            ; 111C
MEMORY  ASC $8D        ; 111D
        ASC "TEST"     ; 111E
        ASC $8D
; --------------------
        DW  BEGIN      ; 1123: 00 11
        DB  0
        ASC "BEGIN", $00
; --------------------
        DW  LOOP       ; 112C: 0A 11
        DB  0
        ASC "LOOP", $00
; --------------------
        DW PTR         ; 1134: 06 00
        DB $85
        ASC "PTR", $00
; --------------------
        DW MEMORY      ; 113B:1D 11
        DB $01
        ASC "MEMORY", $00
; --------------------
        DW 0
        DB 0
        ASC $00
; --------------------
