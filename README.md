M. Samsu Dhuha  - 05111840000155

Yulia Niza      - 05111840000043

Kelompok D12

## #Soal 1
### Pertanyaan :

Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

a. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit

b. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
sedikit berdasarkan hasil poin a

c. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
sedikit berdasarkan 2 negara bagian (state) hasil poin b
Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut.

*Gunakan Awk dan Command pendukung

### Jawaban :
```
  #! bin/bash

	a=$(awk -F "	" '
	{ if( $13 != "Region" ) arr[$13]+=$21;}
	END {for (res in arr) printf res "\n" }
	' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | head -1 )
	echo "$a"
	
	b=$(awk -F "	" -v a="$a" '
	{ if ($13 == a && $11!=State) arr[$11]+=$21;}
	END {for (res in arr)
		print arr[res],res
	     }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk '(NR <=2) {print $2}' ) 
	echo "$b"

	awk -F "	" 'BEGIN { OFS= "\t"}
	{ if ($13 == "Central" && ( $11 == "Illinois" || "Texas" ) && $17 != "Product Name" )
	 arr[$17]+=$21;}
	END {for (res in arr) print arr[res] , res }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk 'BEGIN {FS="\t"} (NR <=10) {print $2}'
```
[code nomor 1](https://github.com/Samsudhuha/SoalShiftSISOP20_modul1_D12/blob/master/soal1/soal1.sh)

**a.** Menampilkan region dengan profit paling sedikit

```
#! bin/bash

awk -F "	" '
{ if( $13 != "Region" ) arr[$13]+=$21;}
END {for (res in arr) printf res "\n" }
' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | head -1
```
#### penjelasan :
```
awk -F "	" '
```
- Memisahkan "	" diantara kolom
```
{ if( $13 != "Region" ) arr[$13]+=$21;}
```
- Menampilkan kolom ke 13 tanpa ada kata "Region"
- Untuk kolom ke 13 yang memiliki kata sama, maka kolom pada 21 dijumlah
```
END {for (res in arr) printf res "\n" }
```
- Mengeprint hasil
```
' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | head -1
```
- `sort -g` Sorting untuk nilai dari yang terkecil ke besar
- `head -1` Hanya menampilkan baris pertama

**b.** Menampilkan 2 negara bagian dengan profit paling sedikit berdasarkan hasil poin a
```
#! bin/bash

	b=$(awk -F "	" -v a="$a" '
	{ if ($13 == a && $11!=State) arr[$11]+=$21;}
	END {for (res in arr)
		print arr[res],res
	     }
       ' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk '(NR <=2) {print $2}' ) 
	echo "$b"
```
#### penjelasan :
```
awk -F "	" '
```
- Memisahkan "	" diantara kolom
```
{ if ($13 == a && $11!=State) arr[$11]+=$21;}
```
- Menampilkan kolom ke 11 yang memiliki "State" tidak sama dan yang memiliki hasil kata sesuai poin a pada kolom 13
- Untuk kolom ke 11 yang memiliki kata sama, maka kolom pada 21 dijumlah
```
END {for (res in arr) print arr[res] , res  }
```
- Mengeprint hasil
```
' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk '(NR <=2) {print $2}'
```
- `sort -g` Sorting untuk nilai dari yang terkecil ke besar
- `(NR <=2)` Hanya menampilkan baris pertama dan kedua
- `{print $2}` Hanya menampilkan kolom kedua

**c.** menampilkan 10 product name dengan profit paling sedikit berdasarkan hasil poin b
```
#! bin/bash

awk -F "	" 'BEGIN { OFS= "\t"}
{ if ($13 == "Central" && ( $11 == "Illinois" || "Texas" ) && $17 != "Product Name" )
  arr[$17]+=$21;}
	END {for (res in arr) print arr[res] , res }
' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk 'BEGIN {FS="\t"} (NR <=10) {print $2}'

```
#### penjelasan :
```
awk -F "	" 'BEGIN { OFS= "\t"}
```
- Memisahkan "	" diantara kolom
- `OFS` (Output field separator) dibangun dalam variabel untuk bahasa awk, secara default diatur ke ruang dan biasanya digunakan untuk memformat output file.
```
{ if ($13 == "Central" && ( $11 == "Illinois" || "Texas" ) && $17 != "Product Name" )
  arr[$17]+=$21;}
```
- Menampilkan kolom ke 17 yang memiliki "Product Name" tidak sama dan yang memiliki kata "Central" pada kolom 13 dan kata "Illinois" atau "Texas" pada kolom ke 11
- Untuk kolom ke 17 yang memiliki kata sama, maka kolom pada 21 dijumlah
```
END {for (res in arr) print arr[res] , res }
```
- Mengeprint hasil
```
' ~/Documents/M1/Shift/Sample-Superstore.tsv | sort -g | awk 'BEGIN {FS="\t"} (NR <=10) {print $2}'
```
- `sort -g` Sorting untuk nilai dari yang terkecil ke besar
- `(NR <=10)` Hanya menampilkan baris pertama hingga ke sepuluh
- `{print $2}` Hanya menampilkan kolom kedua
- `BEGIN {FS="\t"}` untuk pemisah hasil yang diprint

## #Soal 2
### Pertanyaan :

Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan
data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka
meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide.
Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide
tersebut cepat diselesaikan. Idenya adalah kalian 

a. membuat sebuah script bash yang
dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. 

b. Password acak tersebut disimpan pada file berekstensi
.txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.

c. Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di
enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal:
password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt
dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan
file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula
seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28,
maka akan menjadi huruf b.) dan 

d. jangan lupa untuk membuat dekripsinya supaya
nama file bisa kembali.

**HINT :** enkripsi yang digunakan adalah caesar cipher.

*Gunakan Bash Script

### Jawaban :
**a.** Membuat random value

[code random value](https://github.com/Samsudhuha/SoalShiftSISOP20_modul1_D12/blob/master/soal2/soal2_Password.sh)
```
#!/bin/sh

in="$(echo $* | awk -F " " '{print $1}')"

random="$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c28)" || true

printf "$random" >> "$in"
```
#### penjelasan :
```
in="$(echo $* | awk -F " " '{print $1}')"
```
- Mengambil nama file
```
random="$(LC_CTYPE=C tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c28)" || true
```
- Membuat nilai random
- `'a-zA-Z0-9'` Hanya mengeluarkan alphanumeric
- `/dev/urandom | head -c28` Hanya mengeluarkan 28 character

**b.** Membuat Enkripsi

[code enkripsi](https://github.com/Samsudhuha/SoalShiftSISOP20_modul1_D12/blob/master/soal2/soal2_Enkripsi.sh)
```
#!/bin/sh

in="$(echo $* | awk -F "." '{print $1}')"
if [[ $in =~ ^[a-zA-Z]+$ ]]
then

waktu="$( date +"%H" )"

besar=({A..Z})
kecil=({a..z})
posisiawalbesar=${besar[$waktu]}
posisiawalkecil=${kecil[$waktu]}
posisiakhirbesar=${besar[$waktu-1]}
posisiakhirkecil=${kecil[$waktu-1]}

enkripsi="$(echo "$in" | tr [A-Z] ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] | tr [a-z] ["$posisiawalkecil"-za-"$posisiakhirkecil"])"

printf " " >> "$enkripsi".txt

else echo "error"
fi
```
#### penjelasan :
```
if [[ $in =~ ^[a-zA-Z]+$ ]]
```
- `^[a-zA-Z]+$` Hanya bisa input character
```
waktu="$( date +"%H" )"
```
- Melihat waktu sekarang
```
besar=({A..Z})
kecil=({a..z})
posisiawalbesar=${besar[$waktu]}
posisiawalkecil=${kecil[$waktu]}
posisiakhirbesar=${besar[$waktu-1]}
posisiakhirkecil=${kecil[$waktu-1]}
```
- Menentukan pengubah huruf dari semula menjadi huruf setelahnya
- `({A..Z})` `({a..z})` membuat array dari A-Z dan a-z
```
enkripsi="$(echo "$file" | tr [A-Z] ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] | tr [a-z] ["$posisiawalkecil"-za-"$posisiakhirkecil"])"
```
- Menentukan enkripsi

**b.** Membuat Dekripsi

[code Dekripsi](https://github.com/Samsudhuha/SoalShiftSISOP20_modul1_D12/blob/master/soal2/soal2_Dekripsi.sh)
```
#!/bin/sh

in="$(echo $* | awk -F "." '{print $1}')"

waktu="$( date +"%H" )"

besar=({A..Z})
kecil=({a..z})
posisiawalbesar=${besar[$waktu]}
posisiawalkecil=${kecil[$waktu]}
posisiakhirbesar=${besar[$waktu-1]}
posisiakhirkecil=${kecil[$waktu-1]}

dekripsi="$(echo "$in" | tr ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] [A-Z] | tr ["$posisiawalkecil"-za-"$posisiakhirkecil" [a-z]])"

mv $1 "$dekripsi".txt
```
#### penjelasan :
```
dekripsi="$(echo "$file" | tr ["$posisiawalbesar"-ZA-"$posisiakhirbesar"] [A-Z] | tr ["$posisiawalkecil"-za-"$posisiakhirkecil" [a-z]])"
```
- Menentukan dekripsi
```
mv $1 "$dekripsi".txt
```
- Mengubah nama file menjadi seperti semula
## #Soal 3
### Pertanyaan :
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing. 

a. Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan.

b. setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu Karena gambar yang didownload dari link tersebut bersifat random, maka ada kemungkinan gambar yang terdownload itu identik. Supaya gambar yang identik tidak dikira Kusuma sebagai spam, maka diperlukan sebuah script untuk memindahkan salah satu gambar identik. Setelah memilah gambar yang identik, maka dihasilkan gambar yang berbeda antara satu dengan yang lain. Gambar yang berbeda tersebut, akan kalian kirim ke Kusuma supaya hatinya kembali ceria. Setelah semua gambar telah dikirim, kalian akan selalu menghibur Kusuma, jadi gambar yang telah terkirim tadi akan kalian simpan kedalam folder /kenangan dan kalian bisa mendownload gambar baru lagi.

c. Maka dari itu buatlah sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor" (contoh: kenangan_252, kenangan_253). Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

### Jawaban :
```
#bagian a
for ((i=1; i<=28; i=i+1))
do 
 wget -a "wget.log" https://loremflickr.com/320/240/cat -O "pdkt_kusuma_$i"
done

#bagian b
5 6-23/8 * * 0-5 bash /home/yulia/Documents/M1/Shift/no3/no3.sh

#bagian c
mkdir kenangan
mkdir duplicate

cat wget.log | grep Location: > location.log

a=$(awk '{ a++
	print a " " $2 }' location.log )
echo "$a"

```
[code Nomor 3](https://github.com/Samsudhuha/SoalShiftSISOP20_modul1_D12/blob/master/soal3/soal3.sh)
#### penjelasan :
```
wget -a "wget.log" https://loremflickr.com/320/240/cat -O "pdkt_kusuma_$i"
```
- mendownload file yang terdapat di web dengan `wget`
- `wget.log` untuk menyimpan file yang didownload
- `-a` berfungsi untuk mengappend
- `-O` berfungsi untuk mengubah nama file
```
5 6-23/8 * * 0-5
```
- `5`      : menit ke 5
- `6-23/8` : setiap 8 jam dari jam 06.00-23.00
- `0-5`    : setiap hari kecuali hari sabtu

# Kendala
#### No.1
- Kendala : tidak tahu cara memasukkan hasil dari soal 1b ke 1c karena memiliki nilai lebih dari satu, untuk itu saya langsung memanggil hasil dari no1b ke no1c sebagai kondisi

#### No.3 bagian c
- hasil dari a dihitung apakah ada yang sama atau tidak, jika iya maka jumlahnya bertambah
- jika jumlahnya lebih dari satu, maka file tersebut akan dipindahkan ke folder duplicate
- jika jumlahnya tidak bertambah atau 1 maka file tersebut dipindahkan ke folder kenangan

#### secara umum
- syntax sukar dipahami

# Materi :
## **AWK**

`awk` adalah bahasa scripting yang digunakan untuk memanipulasi data dan menghasilkan laporan. `awk` berfungsi untuk menentukan pola teks yang harus dicari di setiap baris dokumen dan tindakan yang harus diambil ketika kecocokan ditemukan dalam suatu baris.

**Syntax**
```
awk options 'selection _criteria {action }' input-file > output-file
```
**Option**

`-f` : Membaca sumber program AWK dari file, bukan dari Argumen baris perintah pertama.

`-F` : Digunakan untuk pemisah bidang input

**Built In Variables In Awk**
1. `NF` : menyimpan hitungan jumlah bidang dalam catatan input saat ini.
2. `FS` : berisi karakter pemisah bidang yang digunakan untuk membagi bidang pada baris input. Standarnya adalah "ruang putih", yang berarti ruang dan karakter tab. FS dapat dipindahkan ke karakter lain (biasanya dalam BEGIN) untuk mengubah pemisah bidang.
3. `RS` : menyimpan karakter pemisah rekaman saat ini. Karena, secara default jalur input adalah catatan input, karakter pemisah rekaman default adalah baris baru.
4. `OFS`: menyimpan pemisah bidang keluaran, yang memisahkan bidang saat Awk mencetaknya. Defaultnya adalah ruang kosong. Setiap kali cetak memiliki beberapa parameter yang dipisahkan dengan koma, itu akan mencetak nilai OFS di antara setiap parameter.
5. `ORS`: menyimpan pemisah catatan keluaran, yang memisahkan garis keluaran saat Awk mencetaknya. Standarnya adalah karakter baris baru. cetak secara otomatis menampilkan konten ORS pada akhir apa pun yang diberikan untuk dicetak.

**Print the lines which matches with the given pattern**
```
$ awk '/Name/ {print}' test.txt
```
- print nama dengan baris yang terdapat kata "Name" pada file test.txt

**Splitting a Line Into Fields**
```
$ awk '{print $1,$4}' file.txt 
```
- print pada kolom 1 dan 4 pada file test.txt

## **SORT**

`sort` digunakan untuk mengurutkan file, mengatur catatan dalam urutan tertentu.

**Options with sort function**
1. `-o` : Menggunakan opsi `-o` secara fungsional sama dengan mengarahkan output ke file.
2. `-r` : Mengurutkan Dalam Urutan Terbalik
3. `-n` : Untuk mengurutkan file secara numerik string
4. `-nr`: Untuk mengurutkan file dengan data numerik dalam urutan terbalik
5. `-k` : Untuk mengurutkan pada kolom tertentu
6. `-c` : Untuk memeriksa apakah file yang diberikan sudah diurutkan atau belum
7. `-u` : Untuk mengurutkan dan menghapus duplikat
8. `-m` : Untuk mengurutkan berdasarkan bulan
9. `-g` : Untuk mengurutkan file secara numerik

## **DATE**

perintah `date` digunakan untuk menampilkan tanggal dan waktu sistem. perintah `date` juga digunakan untuk mengatur tanggal dan waktu sistem.

**List of Format specifiers used with date command**
1. `% D` : Tampilkan tanggal sebagai mm / hh / tttt.
2. `% d` : Menampilkan hari dalam sebulan (01 hingga 31).
3. `% a` : Menampilkan nama singkatan untuk hari kerja (Minggu hingga Sabtu).
4. `% A` : Menampilkan hari kerja penuh (Minggu hingga Sabtu).
5. `% h` : Menampilkan nama bulan yang disingkat (Jan to Dec).
6. `% b` : Menampilkan nama bulan yang disingkat (Jan to Dec).
7. `% B` : Menampilkan nama bulan penuh (Januari hingga Desember).
8. `% m` : Menampilkan bulan dalam setahun (01 hingga 12).
9. `% y` : Menampilkan dua digit terakhir tahun ini (00 hingga 99).
10.`% Y` : Menampilkan tahun empat digit.
11.`% T` : Menampilkan waktu dalam format 24 jam sebagai HH: MM: SS.
12.`% H` : Menampilkan jam.
13.`% M` : Menampilkan menit.
14.`% S` : Menampilkan detik.

## **CIPHER CAESAR**

#### Caesar cipher encoding
```
echo "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG" | tr '[A-Z]' '[X-ZA-W]'
# output: QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD
```
#### Caesar cipher decoding
```
echo "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD" | tr '[X-ZA-W]' '[A-Z]'
# output: THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG
```

Cipher Caesar menggeser plaintext tiga huruf ke kiri untuk membuat ciphertext.

Dalam hal ini, `tr '[AZ]' '[X-ZA-W]'`, `tr` menerjemahkan semua kemunculan `'A'` ke `'X'`, `'B'` ke `'Y'`, `'C'` ke `'Z'`, `' D` ke `'A'`, dll.

`[X-ZA-W]` hanya berarti bahwa output Anda dimulai dengan huruf `X` dan berlanjut melalui huruf `Z`, kemudian dilanjutkan dengan huruf `A` hingga huruf `W`.

## **WGET**

`Wget` adalah pengunduh jaringan non-interaktif yang digunakan untuk mengunduh file dari server bahkan ketika pengguna belum masuk ke sistem dan dapat bekerja di latar belakang tanpa menghalangi proses saat ini.

#### Option
1. `-v` : untuk menampilkan versi wget yang tersedia di sistem Anda.
#### Syntax
```
$wget -v
```
2. `-h` : untuk mencetak pesan bantuan yang menampilkan semua opsi perintah baris yang tersedia dengan opsi baris perintah wget
#### Syntax
```
$wget -h [URL]
```
3. `-o` : untuk mengarahkan semua pesan yang dihasilkan oleh sistem ke file log yang ditentukan oleh opsi dan ketika proses selesai semua pesan yang dihasilkan tersedia dalam file log
#### Syntax
```
$wget -o logfile [URL]
```
4. `-b` : untuk mengirim proses ke latar belakang segera setelah proses dimulai sehingga proses lain dapat dilakukan.
#### Syntax
```
$wget -b [URL]
```
5. `-a` : untuk menambahkan pesan keluaran ke file log keluaran saat ini tanpa menimpa file
#### Syntax
```
$wget -a logfile [URL]
```
6. `-i` : untuk membaca URL dari file.
#### Syntax
```
$wget -i inputfile
$wget -i inputfile [URL]
```
7. `-t` : untuk mengatur jumlah percobaan ulang ke beberapa kali yang ditentukan.
#### Syntax
```
$wget -t number [URL]
```
8. `-c` :  untuk melanjutkan file yang diunduh sebagian
#### Syntax
```
$wget -c [URL]
```
9. `-w` : untuk mengatur sistem untuk menunggu jumlah detik yang ditentukan di antara pengambilan
#### Syntax
```
$wget -w number in seconds [URL]
```
10. `-r` : untuk mengaktifkan pengambilan rekursif dari tautan yang ditentukan jika terjadi kesalahan fatal juga.
#### Syntax
```
$wget -r [URL]
```

# Refrensi
- geeksforgeeks
- stackoverflow
- github
