        .ORG RAMSTART
        
            DS DSIZE
stack:
dStack:        

            DS RSIZE
rStack:        

TIB:        
            DS TIBSIZE

; ****************************************************************
; USER variables
; ****************************************************************

userVars:
knownVars:
EXCLUDE equ 1
.if EXCLUDE = 1

cS0:            DS 2        ; 0     \00  
cTIB:           DS 2        ; 1     \01
cDefs:          DS 2        ; 2     \02
cVars:          DS 2        ; 3     \03
cUserVars:      DS 2        ; 4     \04
                DS 2        ; 5     \05
                DS 2        ; 6     \06
                DS 2        ; 7     \07
                DS 2        ; 8     \08
vTemp:          DS 2        ; 9     \09
vHeapPtr:       DS 2        ; 10
vBase16:        DS 2        ; 11
vTIBPtr:        DS 2        ; 12
vAlt:           DS 2        ; 13
vByteMode:      DS 2        ; 14
vFlags:         DS 2        ; 15

GETCVEC:        DS 2        ; 16  
PUTCVEC:        DS 2        ; 17  
INTVEC:         DS 2        ; 18
NMIVEC:         DS 2        ; 19
BAUD            DS 2        ; 20
RST08:          DS 2        ; 21
RST10:          DS 2        ; 22
RST18:          DS 2        ; 23
RST20:          DS 2        ; 24
RST28:          DS 2        ; 25
RST30:          DS 2        ; 26
                DS 2        ; 27
                DS 2        ; 28
                DS 2        ; 29
                DS 2        ; 30
                DS 2        ; 31
.endif
.if EXCLUDE = 0
cS0:        DW 0                ; 0     \00                   
cTIB        DW 0                ; 1     \01
cDefs:      DW 0                ; 2     \02
cVars:      DW 0                ; 3     \03
cUserVars:  DW 0                ; 4     \04
            DW 0                ; 5     \05
            DW 0                ; 6     \06
            DW 0                ; 7     \07
            DW 0                ; 8     \08
vTemp:      DW 0                ; 9     \09

vHeapPtr:   DW 0                ; 10
vBase16:    DW 0                ; 11
vTIBPtr:    DW 0                ; 12
vAlt:       DW 0                ; 13
vByteMode:  DW 0                ; 14
vFlags      DW 0                ; 15

GETCVEC:    DW 0                ; 16  
PUTCVEC:    DW 0                ; 17  
INTVEC:     DW 0                ; 18
NMIVEC:     DW 0                ; 19
BAUD        DW 0                ; 20
RST08:      DW 0                ; 21
RST10:      DW 0                ; 22
RST18:      DW 0                ; 23
RST20:      DW 0                ; 24
RST28:      DW 0                ; 25
RST30:      DW 0                ; 26
            DW 0                ; 27
            DW 0                ; 28
            DW 0                ; 29
            DW 0                ; 30
            DW 0                ; 31
.endif
; ****************************************************************
; VARS Table - holds 26 16-bit user variables
; ****************************************************************
vars:       DS 26 * 2

; ****************************************************************
; DEFS Table - holds 26 addresses of user routines
; ****************************************************************
defs:       DS 26 * 2

tbPtr:      equ  $                ; reserved for tests

HEAP:         
