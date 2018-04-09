; helloos.asm

  ORG 0x7c00 ; The place of a memory to read at first
; For FAT12 format
  JMP entry
  DB 0x90

  DB "HELLOIPL"
  DW 512 ; Size of a sector
  DB 1
  DW 1
  DB 2
  DW 224
  DW 2880
  DB 0xf0
  DW 9
  DW 18
  DW 2
  DD 0
  DD 2880
  DB 0, 0, 0x29
  DD 0xffffffff
  DB "HELLO-OS   " ; Disk name 11 byte
  DB "FAT12   " ; Format name 8 byte
  RESB 18

; Main program
entry:
  MOV AX, 0
  MOV SS, AX
  MOV SP, 0x7c00
  MOV DS, AX
  MOV ES, AX
  MOV SI, msg

  ; Load disk
  MOV AX, 0x0820
  MOV ES, AX
  MOV CH, 0
  MOV DH, 0
  MOV CL, 2

readloop:
  MOV SI, 0

putloop:
  MOV AL, [SI]
  ADD SI, 1
  CMP AL, 0
  JE fin
  MOV AH, 0x0e
  MOV BX, 15
  INT 0x10
  JMP putloop

fin:
  HLT
  JMP fin

msg:
  DB 0x0a, 0x0a
  DB "hello, world"
  DB 0x0a
  DB 0

  RESB 0x1fe-($-$$)

  DB 0x55, 0xaa

  ; DB 0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
  ; RESB 4600
  ; DB 0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
  ; RESB 1469432

retry:
  MOV AH, 0x02 ; Failing count
  MOV AL, 1
  MOV EX, 0
  MOV DL, 0x00
  INT 0x13 ; Call disk BIOS
  JNC next ; Move next if error isn't happened
  ADD SI, 1
  CMP SI, 5 ; Compare SI and 5
  JAE error ; Move error if SI >= 5
  MOV AH, 0x00
  MOV DL, 0x00
  INT 0x13
  JMP retry

next:
  MOV AX, ES ; Move 0x200 addresses
  ADD AX, 0x0020
  MOV ES, AX
  ADD CL, 1
  CMP CL, 18
  JBE readloop ; Move readloop if CL <= 18


