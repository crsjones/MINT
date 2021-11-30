;------------
; StartUp.asm
;------------
.if ROM = 1
.if BITBANG = 1

;ROM Startup 

        .ORG ROMSTART
;reset
RSTVEC:
        JP	RESET
;RST 1
    	.ORG	ROMSTART+$08
    	PUSH	HL
    	LD	HL,(RST08)
    	JP	(HL)
    
;RST 2
        .ORG ROMSTART+$10
    	PUSH	HL
    	LD	HL,(RST10)
    	JP	(HL)

;RST 3
        .ORG ROMSTART+$18 
    	PUSH	HL
    	LD	HL,(RST18)
    	JP	(HL)
    
;RST 4
        .ORG ROMSTART+$20
    	PUSH	HL
    	LD	HL,(RST20)
    	JP	(HL)

;RST 5
    	.ORG ROMSTART+$28
    	PUSH	HL
    	LD	HL,(RST28)
    	JP	(HL)

;RST 6
    	.ORG ROMSTART+$30
        PUSH	HL
    	LD	HL,(RST30)
    	JP	(HL)

;RST 7 Interrupt
    	.ORG	ROMSTART+$38
    	PUSH	HL
    	LD	HL,(INTVEC)
    	JP	(HL)
        RETI

;---------------
; BIT TIME DELAY
;---------------
;DELAY FOR ONE SERIAL BIT TIME
;ENTRY : HL = DELAY TIME
; NO REGISTERS MODIFIED
;
        .ORG    ROMSTART+$50
PWRUP:   
        LD    hl,$2000
BITIME:
        PUSH  HL
        PUSH  DE
        LD    DE,0001H
BITIM1:  
        SBC   HL,DE
        JP    NC,BITIM1
        POP   DE
        POP   HL
        
IntRet:  
        RET
        
;RST 8  Non Maskable Interrupt
        .ORG ROMSTART+$66
        PUSH	HL
        LD	HL,(NMIVEC)
        JP	(HL)

RESET:   
        ld SP,stack
        LD HL,IntRet
    	LD (RST08),HL
    	LD (RST10),HL
    	LD (RST18),HL
    	LD (RST20),HL
    	LD (RST28),HL
    	LD (RST30),HL
        LD (INTVEC),HL
        LD (NMIVEC),HL

        LD HL,RXDATA
        LD (GETCVEC),HL
        LD HL,TXDATA
        LD (PUTCVEC),HL

        call PWRUP
        IM  1
        EI

;inline bitbang serial initialisation
        LD    A,$40
        LD    C,SCAN
        OUT   (C),A
        LD    HL,B4800
        LD    (BAUD),HL

.endif  ;BITBANG
.endif  ; ROM


;ROM Startup 

.if ROM=1
.if ACIA6850 = 1

        .ORG ROMSTART
;reset
RSTVEC:
        JP	RESET
;RST 1
    	.ORG	ROMSTART+$08
    	PUSH	HL
    	LD	HL,(RST08)
    	JP	(HL)
    
;RST 2
        .ORG ROMSTART+$10
    	PUSH	HL
    	LD	HL,(RST10)
    	JP	(HL)

;RST 3
        .ORG ROMSTART+$18 
    	PUSH	HL
    	LD	HL,(RST18)
    	JP	(HL)
    
;RST 4
        .ORG ROMSTART+$20
    	PUSH	HL
    	LD	HL,(RST20)
    	JP	(HL)

;RST 5
    	.ORG ROMSTART+$28
    	PUSH	HL
    	LD	HL,(RST28)
    	JP	(HL)

;RST 6
    	.ORG ROMSTART+$30
        PUSH	HL
    	LD	HL,(RST30)
    	JP	(HL)

;RST 7 Interrupt
    	.ORG	ROMSTART+$38
    	PUSH	HL
    	LD	HL,(INTVEC)
    	JP	(HL)
        RETI

;---------------
; BIT TIME DELAY
;---------------
;DELAY FOR ONE SERIAL BIT TIME
;ENTRY : HL = DELAY TIME
; NO REGISTERS MODIFIED
;
        .ORG    ROMSTART+$50
PWRUP:   
        LD    hl,$2000
BITIME:
        PUSH  HL
        PUSH  DE
        LD    DE,0001H
BITIM1:  
        SBC   HL,DE
        JP    NC,BITIM1
        POP   DE
        POP   HL
        
IntRet:  
        RET
        
;RST 8  Non Maskable Interrupt
        .ORG ROMSTART+$66
        PUSH	HL
        LD	HL,(NMIVEC)
        JP	(HL)

RESET:   
        ld SP,stack
        LD HL,IntRet
    	LD (RST08),HL
    	LD (RST10),HL
    	LD (RST18),HL
    	LD (RST20),HL
    	LD (RST28),HL
    	LD (RST30),HL
        LD (INTVEC),HL
        LD (NMIVEC),HL

        LD HL,RXDATA
        LD (GETCVEC),HL
        LD HL,TXDATA
        LD (PUTCVEC),HL

        ld    a,MRESET
        out   (CONTROL),a           ;reset the ACIA
;initialise ACIA  8 bit word, No parity 2 stop divide by 64 for 115200 baud
        ld     a,RTSLID+F8N2+DIV_64
        out   (CONTROL),a

        call PWRUP
        IM  1
        EI

.endif ACIA6850
.endif ROM

