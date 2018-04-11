  ; minimum os

  ; Boot information
  CYLS EQU 0x0ff0
  LEDS EQU 0x0ff1
  VMODE EQU 0x0ff2 ; Color
  SCRNX EQU 0x0ff4 ; Screen X
  SCRNY EQU 0x0ff6 ; Screen Y
  VRAM EQU 0x0ff8 ; Start number of graphic buffer
  
  ORG 0xc200 ; Where to read this code

  MOV AL, 0x13 ; VGA graphic 320x200x8bit color
  MOV AH, 0x00
  INT 0x10
  MOV BYTE [VMODE], 8 ; Memo of image mode
  MOV WORD [SCRNX], 320
  MOV WORD [SCRNY], 200
  MOV DWORD [VRAM], 0x000a0000

  ; The status of keyborad LEDS
  MOV AH, 0x02
  INT 0x16 ; Keyboard BIOS
  MOV [LEDS], AL

fin:
  HLT
  JMP fin
