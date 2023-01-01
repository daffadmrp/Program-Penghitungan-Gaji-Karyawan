.model small
.code
org 100h
start:
    jmp mulai
nama        db 13,10,'Nama  Karyawan : $'
nomor       db 13,10,'Nomor Karyawan : $'
lanjut      db 13,10,'Untuk Memilih Jenis Golongan silahkan tekan y  $'
tampung_nama     db 30,?,30 dup(?)
tampung_nomor   db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar  db 13,10,'                       Daftar Gaji Karyawan                      '
        db 13,10,' NO                Golongan Karyawan                   Gaji Karyawan '  
        db 13,10,' 1.  Golongan A                                          RP.40.000    '
        db 13,10,' 2.  Golongan B                                          RP.60.000    '
        db 13,10,' 3.  Golongan C                                          RP.80.000    '
        db 13,10,' 4.  Golongan D                                          RP.100.OOO   '


error       db 13,10,'Jenis Golongan Karyawan Anda tidak ada !!! $'
pilih       db 13,10,'Masukkan Golongan Karyawan :  $'
success db 13,10,'Anda Berhasil Mengecek Gaji Karyawan (belum bonus Lembur)'

mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx

        mov ah,09h
        lea dx,nomor
        int 21h
        mov ah,0ah
        lea dx,tampung_jenis
        int 21h
        push dx

        mov ah,09h
        mov dx,offset daftar
        int 21h
        mov ah,09h
        mov dx,offset lanjut
        int 21h
        mov ah,01h
        int 21h
        cmp al,'y'
        je proses
        jne error_nsg

error_nsg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h

proses:
    mov ah,09h
    mov dx,offset pilih
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3 
    
    
    cmp bh,'0'
    cmp bl,'4'
    je hasil4



;--------------------------------------------------------------------------

hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h 


hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h 

;--------------------------------------------------------------------------------------------------------

teks1       db 13,10,'                                       '
        db 13,10,'Jenis Golongan Karyawan Yang anda pilih Yaitu A '
        db 13,10,'Gaji yang anda dapatkan yaitu sebesar  : Rp.3.000.00 (Belum Bonus Lembur)'
        db 13,10,'Terima Kasih $'

teks2       db 13,10,'                                       '
        db 13,10,'Jenis Golongan Karyawan Yang anda pilih Yaitu B '
        db 13,10,'Gaji yang anda dapatkan yaitu sebesar  : Rp.2.000.00 (Belum Bonus Lembur)'
        db 13,10,'Terima Kasih $' 

teks3       db 13,10,'                                       '
        db 13,10,'Jenis Golongan Karyawan Yang anda pilih Yaitu C '
        db 13,10,'Gaji yang anda dapatkan yaitu sebesar  : Rp.1.500.00 (Belum Bonus Lembur) '
        db 13,10,'Terima Kasih $' 
        
teks4       db 13,10,'                                       '
        db 13,10,'Jenis Golongan Karyawan Yang anda pilih Yaitu B  '
        db 13,10,'Gaji yang anda dapatkan yaitu sebesar  : Rp.1.000.00 (Belum Bonus Lembur) '
        db 13,10,'Terima Kasih $' 

end start
