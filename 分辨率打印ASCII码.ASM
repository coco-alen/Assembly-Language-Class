.386
data segment use16
hex db 10 dup(0)   ;用于存储ascii码的16进制数字，1是高位 0是地位。
a_line_data db 1 dup(0)  ;用于储存所在行的点颜色数据。（需要的asc数组中的对应值）

asc db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,07Eh,081h,0A5h,081h,081h,0BDh
    db 099h,081h,081h,07Eh,000h,000h,000h,000h
    db 000h,000h,07Ch,0FEh,0FEh,0D6h,0FEh,0FEh
    db 0BAh,0C6h,0FEh,07Ch,000h,000h,000h,000h
    db 000h,000h,000h,06Ch,0EEh,0FEh,0FEh,0FEh
    db 0FEh,07Ch,038h,010h,000h,000h,000h,000h
    db 000h,000h,000h,010h,038h,07Ch,0FEh,07Ch
    db 038h,010h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,010h,038h,038h,010h,06Ch
    db 0EEh,06Ch,010h,038h,000h,000h,000h,000h
    db 000h,000h,010h,038h,07Ch,07Ch,0FEh,0FEh
    db 0FEh,06Ch,010h,038h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,018h,03Ch,03Ch
    db 03Ch,018h,000h,000h,000h,000h,000h,000h
    db 0FFh,0FFh,0FFh,0FFh,0FFh,0E7h,0C3h,0C3h
    db 0C3h,0E7h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
    db 000h,000h,000h,000h,018h,03Ch,066h,066h
    db 066h,03Ch,018h,000h,000h,000h,000h,000h
    db 0FFh,0FFh,0FFh,0FFh,0E7h,0C3h,099h,099h
    db 099h,0C3h,0E7h,0FFh,0FFh,0FFh,0FFh,0FFh
    db 000h,000h,01Eh,00Eh,01Eh,036h,078h,0CCh
    db 0CCh,0CCh,0CCh,078h,000h,000h,000h,000h
    db 000h,000h,03Ch,066h,066h,066h,03Ch,018h
    db 07Eh,018h,018h,018h,000h,000h,000h,000h
    db 000h,000h,01Eh,01Ah,01Eh,018h,018h,018h
    db 018h,078h,0F8h,070h,000h,000h,000h,000h
    db 000h,000h,03Eh,036h,03Eh,036h,036h,076h
    db 0F6h,066h,00Eh,01Eh,00Ch,000h,000h,000h
    db 000h,000h,018h,0DBh,07Eh,03Ch,066h,066h
    db 03Ch,07Eh,0DBh,018h,000h,000h,000h,000h
    db 000h,000h,000h,080h,0E0h,0F0h,0FCh,0FEh
    db 0FCh,0F0h,0E0h,080h,000h,000h,000h,000h
    db 000h,000h,000h,002h,00Eh,03Eh,07Eh,0FEh
    db 07Eh,03Eh,00Eh,002h,000h,000h,000h,000h
    db 000h,000h,018h,03Ch,07Eh,018h,018h,018h
    db 018h,07Eh,03Ch,018h,000h,000h,000h,000h
    db 000h,000h,066h,066h,066h,066h,066h,066h
    db 066h,000h,066h,066h,000h,000h,000h,000h
    db 000h,000h,07Fh,0DBh,0DBh,0DBh,0DBh,07Bh
    db 01Bh,01Bh,01Bh,01Bh,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,060h,07Ch,0F6h
    db 0DEh,07Ch,00Ch,0C6h,0C6h,07Ch,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 0FEh,0FEh,0FEh,0FEh,000h,000h,000h,000h
    db 000h,000h,018h,03Ch,07Eh,018h,018h,018h
    db 07Eh,03Ch,018h,07Eh,000h,000h,000h,000h
    db 000h,000h,018h,03Ch,07Eh,018h,018h,018h
    db 018h,018h,018h,018h,000h,000h,000h,000h
    db 000h,000h,018h,018h,018h,018h,018h,018h
    db 018h,07Eh,03Ch,018h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,00Ch,00Eh,0FFh
    db 00Eh,00Ch,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,030h,070h,0FEh
    db 070h,030h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,0C0h,0C0h
    db 0C0h,0FEh,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,024h,066h,0FFh
    db 066h,024h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,010h,038h,038h,038h,07Ch
    db 07Ch,0FEh,0FEh,000h,000h,000h,000h,000h
    db 000h,000h,000h,0FEh,0FEh,07Ch,07Ch,07Ch
    db 038h,038h,010h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,018h,03Ch,03Ch,03Ch,03Ch,018h
    db 018h,000h,018h,018h,000h,000h,000h,000h
    db 000h,036h,036h,036h,036h,014h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,06Ch,06Ch,06Ch,0FEh,06Ch,06Ch
    db 0FEh,06Ch,06Ch,06Ch,000h,000h,000h,000h
    db 000h,000h,018h,018h,07Ch,0C6h,0C0h,078h
    db 03Ch,006h,0C6h,07Ch,018h,018h,000h,000h
    db 000h,000h,000h,000h,000h,062h,066h,00Ch
    db 018h,030h,066h,0C6h,000h,000h,000h,000h
    db 000h,000h,038h,06Ch,038h,030h,076h,07Eh
    db 0CCh,0CCh,0CCh,076h,000h,000h,000h,000h
    db 000h,00Ch,00Ch,00Ch,018h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,00Ch,018h,030h,030h,030h,030h
    db 030h,030h,018h,00Ch,000h,000h,000h,000h
    db 000h,000h,030h,018h,00Ch,00Ch,00Ch,00Ch
    db 00Ch,00Ch,018h,030h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,06Ch,038h,0FEh
    db 038h,06Ch,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,018h,018h,07Eh
    db 018h,018h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,00Ch,00Ch,00Ch,018h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,0FEh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,018h,018h,000h,000h,000h,000h
    db 000h,000h,000h,000h,002h,006h,00Ch,018h
    db 030h,060h,0C0h,080h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0CEh,0DEh,0F6h
    db 0E6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,018h,078h,018h,018h,018h,018h
    db 018h,018h,018h,07Eh,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,006h,00Ch,018h
    db 030h,060h,0C6h,0FEh,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,006h,006h,03Ch,006h
    db 006h,006h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,00Ch,01Ch,03Ch,06Ch,0CCh,0CCh
    db 0FEh,00Ch,00Ch,01Eh,000h,000h,000h,000h
    db 000h,000h,0FEh,0C0h,0C0h,0C0h,0FCh,006h
    db 006h,006h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C0h,0C0h,0FCh,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0FEh,0C6h,006h,00Ch,018h,030h
    db 030h,030h,030h,030h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,07Ch,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,0C6h,07Eh
    db 006h,006h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,00Ch,00Ch,000h
    db 000h,00Ch,00Ch,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,00Ch,00Ch,000h
    db 000h,00Ch,00Ch,00Ch,018h,000h,000h,000h
    db 000h,000h,000h,00Ch,018h,030h,060h,0C0h
    db 060h,030h,018h,00Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,0FEh,000h
    db 0FEh,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,060h,030h,018h,00Ch,006h
    db 00Ch,018h,030h,060h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,00Ch,018h,018h
    db 018h,000h,018h,018h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,0DEh,0DEh
    db 0DEh,0DCh,0C0h,07Eh,000h,000h,000h,000h
    db 000h,000h,038h,06Ch,0C6h,0C6h,0C6h,0FEh
    db 0C6h,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,0FCh,066h,066h,066h,07Ch,066h
    db 066h,066h,066h,0FCh,000h,000h,000h,000h
    db 000h,000h,03Ch,066h,0C2h,0C0h,0C0h,0C0h
    db 0C0h,0C2h,066h,03Ch,000h,000h,000h,000h
    db 000h,000h,0F8h,06Ch,066h,066h,066h,066h
    db 066h,066h,06Ch,0F8h,000h,000h,000h,000h
    db 000h,000h,0FEh,066h,060h,064h,07Ch,064h
    db 060h,060h,066h,0FEh,000h,000h,000h,000h
    db 000h,000h,0FEh,066h,060h,064h,07Ch,064h
    db 060h,060h,060h,0F0h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C0h,0C0h,0C0h
    db 0CEh,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0C6h,0C6h,0FEh,0C6h
    db 0C6h,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,03Ch,018h,018h,018h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,000h,03Ch,018h,018h,018h,018h,018h
    db 018h,0D8h,0D8h,070h,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0CCh,0D8h,0F0h,0F0h
    db 0D8h,0CCh,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,0F0h,060h,060h,060h,060h,060h
    db 060h,062h,066h,0FEh,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0EEh,0EEh,0FEh,0D6h
    db 0D6h,0D6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0E6h,0E6h,0F6h,0DEh
    db 0CEh,0CEh,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0FCh,066h,066h,066h,066h,07Ch
    db 060h,060h,060h,0F0h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0D6h,0D6h,07Ch,006h,000h,000h,000h
    db 000h,000h,0FCh,066h,066h,066h,07Ch,078h
    db 06Ch,066h,066h,0E6h,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C0h,0C0h,070h,01Ch
    db 006h,006h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,07Eh,05Ah,018h,018h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,06Ch,038h,010h,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0C6h,0D6h,0D6h,0D6h
    db 0FEh,0EEh,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,0C6h,0C6h,0C6h,06Ch,038h,038h
    db 06Ch,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,066h,066h,066h,066h,066h,03Ch
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,000h,0FEh,0C6h,086h,00Ch,018h,030h
    db 060h,0C2h,0C6h,0FEh,000h,000h,000h,000h
    db 000h,000h,07Ch,060h,060h,060h,060h,060h
    db 060h,060h,060h,07Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,080h,0C0h,060h,030h
    db 018h,00Ch,006h,002h,000h,000h,000h,000h
    db 000h,000h,07Ch,00Ch,00Ch,00Ch,00Ch,00Ch
    db 00Ch,00Ch,00Ch,07Ch,000h,000h,000h,000h
    db 000h,010h,038h,06Ch,0C6h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0FFh,000h,000h
    db 000h,018h,018h,018h,00Ch,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,000h,0E0h,060h,060h,07Ch,066h,066h
    db 066h,066h,066h,0FCh,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Ch,0C6h,0C0h
    db 0C0h,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,01Ch,00Ch,00Ch,07Ch,0CCh,0CCh
    db 0CCh,0CCh,0CCh,07Eh,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Ch,0C6h,0C6h
    db 0FEh,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,01Ch,036h,030h,030h,0FCh,030h
    db 030h,030h,030h,078h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,076h,0CEh,0C6h
    db 0C6h,0CEh,076h,006h,0C6h,07Ch,000h,000h
    db 000h,000h,0E0h,060h,060h,07Ch,066h,066h
    db 066h,066h,066h,0E6h,000h,000h,000h,000h
    db 000h,000h,018h,018h,000h,038h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,000h,00Ch,00Ch,000h,01Ch,00Ch,00Ch
    db 00Ch,00Ch,00Ch,0CCh,0CCh,078h,000h,000h
    db 000h,000h,0E0h,060h,060h,066h,066h,06Ch
    db 078h,06Ch,066h,0E6h,000h,000h,000h,000h
    db 000h,000h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,01Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,06Ch,0FEh,0D6h
    db 0D6h,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0DCh,066h,066h
    db 066h,066h,066h,066h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Ch,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0DCh,066h,066h
    db 066h,066h,07Ch,060h,060h,0F0h,000h,000h
    db 000h,000h,000h,000h,000h,076h,0CCh,0CCh
    db 0CCh,0CCh,07Ch,00Ch,00Ch,01Eh,000h,000h
    db 000h,000h,000h,000h,000h,0DCh,066h,060h
    db 060h,060h,060h,0F0h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Ch,0C6h,0C0h
    db 07Ch,006h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,030h,030h,030h,0FCh,030h,030h
    db 030h,030h,036h,01Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0CCh,0CCh,0CCh
    db 0CCh,0CCh,0CCh,076h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0C6h,0C6h,0C6h
    db 0C6h,06Ch,038h,010h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0C6h,0C6h,0D6h
    db 0D6h,0D6h,0FEh,06Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0C6h,0C6h,06Ch
    db 038h,06Ch,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0C6h,0C6h,0C6h
    db 0C6h,0CEh,076h,006h,0C6h,07Ch,000h,000h
    db 000h,000h,000h,000h,000h,0FEh,086h,00Ch
    db 018h,030h,062h,0FEh,000h,000h,000h,000h
    db 000h,000h,00Eh,018h,018h,018h,070h,018h
    db 018h,018h,018h,00Eh,000h,000h,000h,000h
    db 000h,000h,018h,018h,018h,018h,000h,018h
    db 018h,018h,018h,018h,000h,000h,000h,000h
    db 000h,000h,070h,018h,018h,018h,00Eh,018h
    db 018h,018h,018h,070h,000h,000h,000h,000h
    db 000h,000h,076h,0DCh,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,010h,038h,038h
    db 06Ch,06Ch,0FEh,000h,000h,000h,000h,000h
    db 000h,000h,03Ch,066h,0C0h,0C0h,0C0h,0C6h
    db 066h,03Ch,018h,00Ch,0CCh,038h,000h,000h
    db 000h,000h,0C6h,000h,000h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0CEh,076h,000h,000h,000h,000h
    db 000h,00Ch,018h,030h,000h,07Ch,0C6h,0C6h
    db 0FEh,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,030h,078h,0CCh,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,000h,0CCh,000h,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,060h,030h,018h,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,038h,06Ch,038h,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,000h,000h,000h,07Ch,0C6h,0C0h,0C0h
    db 0C6h,07Ch,018h,00Ch,06Ch,038h,000h,000h
    db 000h,030h,078h,0CCh,000h,07Ch,0C6h,0C6h
    db 0FEh,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0CCh,000h,000h,07Ch,0C6h,0C6h
    db 0FEh,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,030h,018h,00Ch,000h,07Ch,0C6h,0C6h
    db 0FEh,0C0h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,066h,000h,000h,038h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,018h,03Ch,066h,000h,038h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,038h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,0C6h,000h,038h,06Ch,0C6h,0C6h,0C6h
    db 0FEh,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 038h,06Ch,038h,000h,038h,06Ch,0C6h,0C6h
    db 0FEh,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 00Ch,018h,030h,000h,0FEh,060h,060h,07Ch
    db 060h,060h,060h,0FEh,000h,000h,000h,000h
    db 000h,000h,000h,000h,066h,0DBh,01Bh,07Fh
    db 0D8h,0D8h,0DFh,076h,000h,000h,000h,000h
    db 000h,000h,07Eh,0D8h,0D8h,0D8h,0D8h,0FEh
    db 0D8h,0D8h,0D8h,0DEh,000h,000h,000h,000h
    db 000h,030h,078h,0CCh,000h,07Ch,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,0C6h,000h,000h,07Ch,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,030h,018h,00Ch,000h,07Ch,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,030h,078h,0CCh,000h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0CEh,076h,000h,000h,000h,000h
    db 000h,060h,030h,018h,000h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0CEh,076h,000h,000h,000h,000h
    db 000h,018h,000h,03Ch,018h,018h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,0C6h,000h,07Ch,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,0C6h,000h,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,018h,018h,07Ch,0C6h,0C0h,0C0h
    db 0C6h,07Ch,018h,018h,000h,000h,000h,000h
    db 000h,038h,06Ch,060h,060h,0F0h,060h,060h
    db 060h,066h,0F6h,06Ch,000h,000h,000h,000h
    db 000h,066h,066h,066h,066h,03Ch,018h,07Eh
    db 018h,03Ch,018h,018h,000h,000h,000h,000h
    db 000h,000h,03Eh,063h,063h,030h,01Ch,006h
    db 063h,063h,03Eh,000h,01Ch,000h,000h,000h
    db 000h,000h,000h,000h,000h,03Eh,063h,038h
    db 00Eh,063h,03Eh,000h,01Ch,000h,000h,000h
    db 000h,00Ch,018h,030h,000h,078h,00Ch,07Ch
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,00Ch,018h,030h,000h,038h,018h,018h
    db 018h,018h,018h,03Ch,000h,000h,000h,000h
    db 000h,00Ch,018h,030h,000h,07Ch,0C6h,0C6h
    db 0C6h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,018h,030h,060h,000h,0CCh,0CCh,0CCh
    db 0CCh,0CCh,0DCh,076h,000h,000h,000h,000h
    db 000h,000h,076h,0DCh,000h,0BCh,066h,066h
    db 066h,066h,066h,0E6h,000h,000h,000h,000h
    db 000h,076h,0DCh,000h,0C6h,0C6h,0E6h,0F6h
    db 0DEh,0CEh,0C6h,0C6h,000h,000h,000h,000h
    db 000h,021h,01Eh,000h,01Eh,033h,060h,060h
    db 067h,063h,033h,01Dh,000h,000h,000h,000h
    db 000h,042h,03Ch,000h,03Bh,066h,066h,066h
    db 03Eh,006h,066h,03Ch,000h,000h,000h,000h
    db 000h,000h,030h,030h,000h,030h,030h,030h
    db 060h,0C6h,0C6h,07Ch,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,07Eh
    db 060h,060h,060h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,07Eh
    db 006h,006h,006h,000h,000h,000h,000h,000h
    db 000h,060h,060h,062h,066h,06Ch,018h,030h
    db 060h,0DCh,036h,00Ch,018h,03Eh,000h,000h
    db 000h,060h,060h,062h,066h,06Ch,018h,036h
    db 06Eh,0DEh,036h,07Eh,006h,006h,000h,000h
    db 000h,000h,018h,018h,000h,018h,018h,03Ch
    db 03Ch,03Ch,03Ch,018h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,036h,06Ch,0D8h
    db 06Ch,036h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0D8h,06Ch,036h
    db 06Ch,0D8h,000h,000h,000h,000h,000h,000h
    db 011h,044h,011h,044h,011h,044h,011h,044h
    db 011h,044h,011h,044h,011h,044h,011h,044h
    db 0AAh,055h,0AAh,055h,0AAh,055h,0AAh,055h
    db 0AAh,055h,0AAh,055h,0AAh,055h,0AAh,055h
    db 0DDh,077h,0DDh,077h,0DDh,077h,0DDh,077h
    db 0DDh,077h,0DDh,077h,0DDh,077h,0DDh,077h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,0F8h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,0F8h,018h,0F8h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 036h,036h,036h,036h,036h,036h,036h,0F6h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 000h,000h,000h,000h,000h,000h,000h,0FEh
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 000h,000h,000h,000h,000h,0F8h,018h,0F8h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 036h,036h,036h,036h,036h,0F6h,006h,0F6h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 000h,000h,000h,000h,000h,0FEh,006h,0F6h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,0F6h,006h,0FEh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 036h,036h,036h,036h,036h,036h,036h,0FEh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 018h,018h,018h,018h,018h,0F8h,018h,0F8h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,0F8h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,01Fh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 018h,018h,018h,018h,018h,018h,018h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,0FFh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,01Fh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 000h,000h,000h,000h,000h,000h,000h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 018h,018h,018h,018h,018h,018h,018h,0FFh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,01Fh,018h,01Fh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 036h,036h,036h,036h,036h,036h,036h,037h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,037h,030h,03Fh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,03Fh,030h,037h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,0F7h,000h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0FFh,000h,0F7h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,037h,030h,037h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 000h,000h,000h,000h,000h,0FFh,000h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 036h,036h,036h,036h,036h,0F7h,000h,0F7h
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 018h,018h,018h,018h,018h,0FFh,000h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 036h,036h,036h,036h,036h,036h,036h,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0FFh,000h,0FFh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 000h,000h,000h,000h,000h,000h,000h,0FFh
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,036h,036h,03Fh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 018h,018h,018h,018h,018h,01Fh,018h,01Fh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,01Fh,018h,01Fh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 000h,000h,000h,000h,000h,000h,000h,03Fh
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 036h,036h,036h,036h,036h,036h,036h,0FFh
    db 036h,036h,036h,036h,036h,036h,036h,036h
    db 018h,018h,018h,018h,018h,0FFh,018h,0FFh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,0F8h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,01Fh
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
    db 0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h
    db 0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h,0F0h
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh
    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,076h,0DCh,0D8h,0D8h
    db 0D8h,0D8h,0DCh,076h,000h,000h,000h,000h
    db 000h,000h,078h,0CCh,0CCh,0D8h,0FCh,0C6h
    db 0C6h,0C6h,0C6h,0CCh,000h,000h,000h,000h
    db 000h,000h,0FEh,066h,062h,060h,060h,060h
    db 060h,060h,060h,060h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,0FEh,06Ch,06Ch
    db 06Ch,06Ch,06Ch,06Ch,000h,000h,000h,000h
    db 000h,000h,0FEh,0C6h,062h,030h,018h,018h
    db 030h,062h,0C6h,0FEh,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Eh,0D8h,0CCh
    db 0CCh,0CCh,0D8h,070h,000h,000h,000h,000h
    db 000h,000h,000h,000h,066h,066h,066h,066h
    db 066h,07Ch,060h,0C0h,080h,000h,000h,000h
    db 000h,000h,000h,000h,000h,076h,0DCh,018h
    db 018h,018h,018h,018h,000h,000h,000h,000h
    db 000h,000h,0FEh,038h,038h,06Ch,0C6h,0C6h
    db 06Ch,038h,038h,0FEh,000h,000h,000h,000h
    db 000h,000h,000h,038h,06Ch,0C6h,0C6h,0FEh
    db 0C6h,0C6h,06Ch,038h,000h,000h,000h,000h
    db 000h,000h,038h,06Ch,0C6h,0C6h,0C6h,0C6h
    db 06Ch,06Ch,06Ch,0EEh,000h,000h,000h,000h
    db 000h,000h,03Eh,060h,060h,03Ch,066h,0C6h
    db 0C6h,0C6h,0CCh,078h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Eh,0DBh,0DBh
    db 0DBh,07Eh,000h,000h,000h,000h,000h,000h
    db 000h,000h,002h,006h,07Ch,0CEh,0DEh,0F6h
    db 0F6h,07Ch,060h,0C0h,000h,000h,000h,000h
    db 000h,000h,000h,01Ch,030h,060h,060h,07Ch
    db 060h,060h,030h,01Ch,000h,000h,000h,000h
    db 000h,000h,07Ch,0C6h,0C6h,0C6h,0C6h,0C6h
    db 0C6h,0C6h,0C6h,0C6h,000h,000h,000h,000h
    db 000h,000h,000h,000h,0FEh,000h,000h,0FEh
    db 000h,000h,0FEh,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,018h,018h,07Eh,018h
    db 018h,000h,000h,07Eh,000h,000h,000h,000h
    db 000h,000h,030h,018h,00Ch,006h,00Ch,018h
    db 030h,000h,000h,07Eh,000h,000h,000h,000h
    db 000h,000h,00Ch,018h,030h,060h,030h,018h
    db 00Ch,000h,000h,07Eh,000h,000h,000h,000h
    db 000h,000h,000h,000h,00Ch,01Eh,01Ah,018h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,018h,018h,018h,018h,018h,018h
    db 018h,018h,058h,078h,030h,000h,000h,000h
    db 000h,000h,000h,000h,018h,018h,000h,07Eh
    db 000h,018h,018h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,076h,0DCh
    db 000h,076h,0DCh,000h,000h,000h,000h,000h
    db 000h,000h,078h,0CCh,0CCh,078h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,018h
    db 018h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 018h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,01Fh,018h,018h,018h,018h,018h
    db 0D8h,0D8h,078h,038h,018h,000h,000h,000h
    db 000h,000h,0D8h,06Ch,06Ch,06Ch,06Ch,06Ch
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,070h,0D8h,018h,030h,060h,0F8h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,07Eh,07Eh,07Eh
    db 07Eh,07Eh,07Eh,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
    db 000h,000h,000h,000h,000h,000h,000h,000h
input db 0
data ends


code segment use16
assume cs:code, ds:data

main:
   mov ax, data ;存入data中的数据
   mov ds, ax  
   

;again部分主要把输入的字符处理为数字，其中不符合16进制数字的字符被处理为0。
;回车停止输入，输入超过两个字符时只有前面两个字符有效（不能超过10个字符，否则溢出）。

again:
   mov ah, 1
   int 21h      ;  AL=getchar()，输入

   cmp al, 0Dh  ;如果输入回车，跳转到打印图形的next部分。
   je next

   cmp al, 'a'           ;判断是不是小写的a-f
   jae maybe_lower
   cmp al, 'A'
   jae maybe_higher      ;判断是不是大写的A-F
   jmp maybe_number      ;判断是不是数字

maybe_lower:
   cmp al, 'f'           ;如果符合要求，是小写的a-f
   jbe is_lower          ;跳转到处理小写的a-f
   jmp not_regular       ;否则是不合规的字符，跳转到处理不合规的字符

maybe_higher:
   cmp al, 'F'          ;如果符合要求，是大写的A-F
   jbe is_higher        ;跳转到处理大写的A-F
   jmp not_regular      ;否则是不合规的字符，跳转到处理不合规的字符

maybe_number:
   cmp al, '9'          ;如果符合要求，是数字，跳转到处理数字
   jbe is_number
   jmp not_regular      ;否则是不合规的字符，跳转到处理不合规的字符

is_lower:
   sub al, 'a'          ;处理小写字符，把字符变为对应的值
   add al, 10
   jmp put_num_in
  
is_higher:
   sub al, 'A'          ;处理大写字符，把字符变为对应的值
   add al, 10
   jmp put_num_in

is_number:
   sub al, '0'          ;处理数字字符，把字符变为对应的值
   jmp put_num_in

not_regular:
   mov al, 0            ;不符合16进制表达规定的一律变为0
   jmp put_num_in

put_num_in:
   mov hex[di], al      ;把数字存入hex数组
   add di, 1
   jmp again            ;继续输入

;next的部分主要处理打印。
next:
   ;设置为320*200*256色图形模式
   mov ah, 0  	; 其中AH=0表示int 10h的子功能号为0
   mov al, 13h; 其中AL=13h代表图形模式编号
   int 10h     ; int 10h是与显示相关的bios中断
   mov ax, 0A000h
   mov es, ax

;处理ascii码，al中存放处理好的ascii码。
   mov bl, hex[0]
   shl bl, 4     ;对高位左移后放入
   mov al, bl
   add al, hex[1]
   

;开始进行打印
;di用于16 行*320 循环。
;dx用于16行循环，行坐标y
;bx用于8列循环，列坐标x。
;ah用于存储一行的数据值。
;si存储al*16的数据
;cl用于循环和循环移动
;al用于存储要打印的ascii码数值，在之后用于存储要打印的颜色。

print_start1:   ;初始化
   mov di, 0
   mov si, 0
   mov bx, 0
   mov cx, 0
   mov dx, 0

deal_ascii:     ;处理ascii码，获取对应ASCII码在asc数组中的位置

   ;完成的功能是si = al*16
   cmp cl, al    ;如果循环数和处理的ASCII码相同，继续打印。否则继续加16
   je print_start2
   add si, 16
   add cl, 1
   jmp deal_ascii

;开始在屏幕上输出颜色。
print_start2:

   cmp dx, 10h   ;如果输出了16行，则退出
   je exit
   
   mov bx, 00h   ;对0-8列循环进行初始化

   push si       ;si存储的是存储al*16的数据，先存储起来，
   add si, dx    ;然后si加上用于0-16行循环的dx，在asc中找到对应行的输出数据
   mov ah, asc[si]
   pop si        ;恢复si = al*16

   mov a_line_data, ah   ;把这一行的输出数据先进行保存。

print_dot:
   mov ah, a_line_data   ;每输出一个点，都要把这一行对应的输出数据拿出来。

   mov cl, 7       ;右移7-bx位，即，右移7-列坐标位x。
   sub cx, bx
   shr ah, cl

   and ah, 00000001B   ;确认对应的值是0还是1 ，1跳到输出红色，0跳到输出蓝色。
   cmp ah, 1
   je draw_red
   jmp draw_blue

draw_red:
   push di    ;存储对应行的首地址，
   add di, bx  ;计算输出点的地址。

   mov al, 0Ch     ;打印红色点
   mov es:[di], al

   pop di    ;恢复di为对应行的首地址

   add bx, 1  ;x坐标+1
   cmp bx, 8h  ;如果x！=8，则继续打印本行的点
   jne print_dot

   add dx, 1     ;否则y坐标+1,对应行的首地址+320
   add di, 0140h
   jmp print_start2   ;跳回从新打印一行
    
draw_blue:
   push di    ;存储对应行的首地址，
   add di, bx  ;计算输出点的地址。

   mov al, 01h     ;打印蓝色点
   mov es:[di], al

   pop di    ;恢复di为对应行的首地址

   add bx, 1  ;x坐标+1
   cmp bx, 8h  ;如果x！=8，则继续打印本行的点
   jne print_dot

   add dx, 1     ;否则y坐标+1,对应行的首地址+320
   add di, 0140h
   jmp print_start2   ;跳回从新打印一行


exit:
   mov ah,0  ;敲任意键
   int 16h
   mov ax, 0003h
   int 10h  ; 切换到80*25文本模式
   mov ah, 4Ch
   int 21h

code ends
end main