#make_exe#    ;Berfungsi agar hasil file yang dicompile emu8086 bertipe exe (executable) sehingga dapat di run oleh IC 8086 di Proteus.
DATA SEGMENT        ;Inisialisasi alamat I/O pada port-port yang ada.
PORTA EQU 00H
PORTB EQU 02H
PORTC EQU 04H
PORT_CON EQU 06H
DATA ENDS

CODE SEGMENT
MOV AX,DATA         ;Mengisi register AX dengan DATA untuk sementara waktu.
MOV DS, AX         ;Memindahkan data dari Register AX ke DS/Data Segment.
MOV DX, PORT_CON     ;Mengisi register DX dengan data dari PORT_CON.
MOV AL, 10000010B     ;Port A sebagai output mode 0, Port B sebagai input mode 0, dan Port C sebagai output (pengaturan IC 8255A).
MOV SI,0     ;Memberi variabel SI nilai 0, SI digunakan sebagai counter satuan hingga puluhan.
Tombolhidup:     ;Mengindikasikan program Tombolhidup. Tombolhidup sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV DX,PORTB         ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX             ;Mengisi register AL dengan data dari register DX.
CMP AL,11111110b     ;Untuk testing apakah button pada port pertama di bagian Port B ditekan atau tidak.
JE GO     ;Apabila button pada port pertama di bagian Port B ditekan, maka akan dilakukan lompatan ke GO.
JMP Tombolhidup     ;Bila button tersebut tidak ditekan, maka akan dilakukan lompatan tanpa syarat kembali ke Tombolhidup.


GO:     ;Mengindikasikan program GO. GO sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL,11000000B     ;Mengisi AL dengan binary-binary penyusun angka 0 pada Seven Segment.
MOV DX,PORTC        ;Mengisi DX dengan data alamat PORTC.
OUT DX,AX     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 0.


START:     ;Mengindikasikan program START. START sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S0:     ;Mengindikasikan program S0. S0 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11000000B     ;Mengisi register AL dengan binary-binary penyusun angka 0 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 0.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX            ;Mengisi register AL dengan data dari register DX.
CMP AL,11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP0     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan STOP0.
LOOP S0     ;Sebagai pengulangan kembali ke S0. Bila register CX = 0, maka pengulangan tidak terjadi dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama
S1:          ;Mengindikasikan program S1. S1 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11111001B      ;Mengisi register AL dengan binary-binary penyusun angka 1 pada Seven Segment
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL      ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 1.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP1    ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP1.
LOOP S1     ;Sebagai pengulangan kembali ke S1. Bila register CX = 0, pengulangan tidak terjadi dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan  2FFFH sebagai waktu counter yang sangat lama.
S2:       ;Mengindikasikan program S0. S0 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10100100B     ;Mengisi register AL dengan kumpulan binary penyusun angka 2 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL      ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 2.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP2     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP2.
LOOP S2     ;Sebagai pengulangan kembali ke S2. Apabila register CX = 0, maka pengulangan tidak akan dilakukan dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S3:     ;Mengindikasikan program S3. S3 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10110000B     ;Mengisi register AL dengan kumpulan binary penyusun angka 3 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL      ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 3.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP3     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dialkukan lompatan ke STOP3
LOOP S3     ;Sebagai pengulangan kembali ke S3. Apabila register CX = 0, maka pengulangan tidak akan dilakukan dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama
S4:     ;Mengindikasikan program S4. S4 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10011001B     ;Mengisi register AL dengan kumpulan binary penyusun angka 4 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 4
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP4     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP4.
LOOP S4     ;Sebagai pengulangan kembali ke S4. Apabila register CX = 0, maka pengulangan tidak akan terjadi dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S5:     ;Mengindikasikan program S5. S5 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10010010B    ;Mengisi register AL dengan kumpulan binary penyusun angka 5 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 5.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP5     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP5.
LOOP S5     ;Sebagai pengulangan kembali ke S5. Apabila CX = 0, maka pengulangan tidak akan terjadi dan akan dijalankan perintah selanjutnya.

MOV CX,2FFFH     ;Sebagai waktu counter yang sangat lama.
S6:     ;Mengindikasikan program S6. S6 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10000010B     ;Mengisi register AL dengan kumpulan binary penyusun angka 6 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 6.
MOV DX,PORTB     ;Mengisi register DX dengan data PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP6    ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP6.
LOOP S6     ;Sebagai pengulangan kembali ke S6. Apabila register CX = 0, maka pengulangan tidak akan terjadi dan akan dilakukan perintah selanjutnya.


MOV CX,2FFFH    ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S7:     ;Mengindikasikan program S7. S7 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11111000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 7 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 7.
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP7     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP7.
LOOP S7     ;Sebagai pengulangan kembali ke S7. Apabila CX = 0, maka pengulangan tidak akan terjadi dan akan dilakukan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S8:     ;Mengindikasikan program S8. S8 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10000000B     ;Mengisi register AL dengan kumpulan binary penyusun angka 8 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 8
MOV DX,PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b     ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP8     ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP8
LOOP S8     ;Sebagai pengulangan kembali ke S8. Apabila CX = 0, maka pengulangan tidak akan terjadi dan akan dijalankan perintah selanjutnya.


MOV CX,2FFFH     ;Mengisi register CX dengan 2FFFH sebagai waktu counter yang sangat lama.
S9:     ;Mengindikasikan program S9. S9 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10010000B     ;Mengisi register AL dengan kumpulan binary penyusun angka 9 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 9.
MOV DX,PORTB    ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX        ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111101b    ;Untuk testing apakah button pada port kedua di bagian Port B ditekan atau tidak.
JE STOP9    ;Apabila button pada port kedua di bagian Port B ditekan, maka akan dilakukan lompatan ke STOP9.
LOOP S9      ;Sebagai pengulangan kembali ke S9. Apabila register CX = 0, maka pengulangan tidak akan terjadi dan akan dijalankan perintah selanjutnya.


INC SI            ;Si ditambah dengan 1.
CMP SI,1            ;Nilai SI dibandingkan dengan 1.
JE S11            ;Menuju ke S11 bila SI = 1.
JNE S12            ;Menuju ke S12 bila S1 tidak sama dengan 1.


S11:    ;Mengindikasikan program S11. S11 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11111001B    ;Mengisi register AL dengan kumpulan binary penyusun angka 1 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 1
JMP START         ;Menuju ke START untuk looping Seven Segment 1 lagi



S12:    ;Mengindikasikan program S12. S12 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,2         ;Nilai SI dibandingkan dengan 2.
JNE S13         ;Menuju ke S13 bila SI tidak sama dengan 2.
MOV AL, 10100100B    ;Mengisi register AL dengan kumpulan binary penyusun angka 2 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 2.
JMP START         ;Menuju ke START untuk looping Seven Segment 1 lagi.


S13:     ;Mengindikasikan program S13. S13 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,3        ;Nilai SI dibandingkan dengan 3.
JNE S14         ;Menuju ke S14 bila SI tidak sama dengan 3.
MOV AL, 10110000B     ;Mengisi register AL dengan kumpulan binary penyusun angka 3 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 3.
JMP START         ;Menuju ke START untuk looping Seven Segment 1 lagi.


S14:     ;Mengindikasikan program S14. S14 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,4         ;Nilai SI dibandingkan dengan 4.
JNE S15         ;Menuju ke S15 bila SI tidak sama dengan 4.
MOV AL, 10011001B     ;Mengisi register AL dengan kumpulan binary penyusun angka 4 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 4.
JMP START        ;Menuju ke START untuk looping Seven Segment 1 lagi


S15:     ;Mengindikasikan program S15. S15 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,5         ;Nilai SI dibandingkan dengan 5.
JNE S16         ;Menuju ke S16 bila SI tidak sama dengan 5.
MOV AL, 10010010B    ;Mengisi register AL dengan kumpulan binary penyusun angka 5 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 5.
JMP START         ;Menuju ke START untuk looping Seven Segment 1 lagi.


S16:    ;Mengindikasikan program S16. S16 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,6        ;Nilai SI dibandingkan dengan 6.
JNE S17         ;Menuju ke S17 bila SI tidak sama dengan 6.
MOV AL, 10000010B    ;Mengisi register AL dengan kumpulan binary penyusun angka 6 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 6.
JMP START         ;Menuju ke START untuk looping Seven Segment 1 lagi.


S17:    ;Mengindikasikan program S17. S17 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,7         ;Nilai SI dibandingkan dengan 7.
JNE S18        ;Menuju ke S18 bila SI tidak sama dengan 7.
MOV AL, 11111000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 7 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 7.
JMP START        ;Menuju ke START untuk looping Seven Segment 1 lagi.


S18:     ;Mengindikasikan program S18. S18 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,8         ;Nilai SI dibandingkan dengan 8.
JNE S19        ;Menuju ke S19 bila SI tidak sama dengan 8.
MOV AL, 10000000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 8 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 8.
JMP START        ;Menuju ke START untuk looping Seven Segment 1 lagi.


S19:     ;Mengindikasikan program S19. S19 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
CMP SI,9         ;Nilai SI dibandingkan dengan 9.
JNE S10        ;Menuju ke S10 bila SI tidak sama dengan 9.
MOV AL, 10010000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 9 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 9.
JMP START        ;Menuju ke START untuk looping Seven Segment 1 lagi.


S10:     ;Mengindikasikan program S10. S10 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV SI,0         ;Memberi nilai SI kembali menjadi 0.
MOV AL, 11000000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 0 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL    ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 0.
JMP START        ;Menuju ke START untuk looping Seven Segment 1 lagi.


STOP0:    ;Mengindikasikan program STOP0. STOP0 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11000000B ;Mengisi register AL dengan kumpulan binary penyusun angka 0 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 0.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL,11111011b     ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP0     ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP0.


STOP1:     ;Mengindikasikan program STOP1. STOP1 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11111001B    ;Mengisi register AL dengan kumpulan binary penyusun angka 1 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 1.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP1     ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP1.


STOP2:    ;Mengindikasikan program STOP2. STOP2 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.

MOV AL, 10100100B    ;Mengisi register AL dengan kumpulan binary penyusun angka 2 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 2.
MOV DX, PORTB    ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX        ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP2    ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP2.


STOP3:    ;Mengindikasikan program STOP3. STOP3 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10110000B     ;Untuk mengisi register AL dengan kumpulan binary penyusun angka 3 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 3.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP3     ;Apabila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP3.


STOP4:    ;Mengindikasikan program STOP4. STOP4 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10011001B ;Mengisi register AL dengan kumpulan binary penyusun angka 4 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 4.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dijalankan lompatan ke RESET.
JMP STOP4     ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP4.

STOP5:     ;Mengindikasikan program S8. S8 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10010010B    ;Mengisi register AL dengan kumpulan binary penyusun angka 5 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 5.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX        ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b     ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET     ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP5    ;Bila terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP5.


STOP6:     ;Mengindikasikan program STOP6. STOP6 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10000010B     ;Mengisi register AL dengan kumpulan binary penyusun angka 6 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 6.
MOV DX, PORTB    ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET     ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP6    ;Apabila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP6.


STOP7:     ;Mengindikasikan program STOP7. STOP7 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 11111000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 7 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 7.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP7    ;Apabila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP7.


STOP8:     ;Mengindikasikan program STOP8. STOP8 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10000000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 8 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 8.
MOV DX, PORTB    ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b    ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET    ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP8    ;Apabila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP8.


STOP9:     ;Mengindikasikan program STOP9. STOP9 sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV AL, 10010000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 9 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL     ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 9.
MOV DX, PORTB     ;Mengisi register DX dengan data alamat PORTB.
IN AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL, 11111011b     ;Untuk testing apakah button pada port ketiga di bagian Port B ditekan atau tidak.
JE RESET     ;Apabila button pada port ketiga di bagian Port B ditekan, maka akan dilakukan lompatan ke RESET.
JMP STOP9     ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke STOP9.


RESET:     ;Mengindikasikan program RESET. RESET sendiri merupakan suatu label program yang menjalankan sekumpulan perintah tertentu.
MOV SI,0         ;Mengisi SI dengan 0.
MOV AL, 11000000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 0 pada Seven Segment.
MOV DX, PORTA    ;Mengisi register DX dengan data alamat PORTA.
OUT DX,AL    ;Keluaran dari Port A akan menghidupkan Seven Segment 1 dengan angka 0.
MOV AL, 11000000B    ;Mengisi register AL dengan kumpulan binary penyusun angka 0 pada Seven Segment.
MOV DX, PORTC    ;Mengisi register DX dengan data alamat PORTC.
OUT DX,AL     ;Keluaran dari Port C akan menghidupkan Seven Segment 2 dengan angka 0.
MOV DX,PORTB    ;Mengisi register DX dengan data alamat PORTB.
IN  AL,DX         ;Mengisi register AL dengan data dari register DX.
CMP AL,11111110b     ;Untuk testing apakah button pada port pertama di bagian Port B ditekan atau tidak.
JE GO     ;Apabila button pada port pertama di bagian Port B ditekan, maka akan dilakukan lompatan ke GO.
JMP RESET     ;Bila tidak terjadi penekanan, maka akan dilakukan lompatan kembali ke RESET.

CODE ENDS
END


