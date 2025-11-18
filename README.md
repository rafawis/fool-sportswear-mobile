RAFA PRADIPTA ALI WISNUTOMO 2406496290
FOOL SPORTSWEAR

TUGAS 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget. 
   Widget tree adalah struktur hirarki untuk semua widget, struktur hirarki ini dalam buntuk tree, dimana setiap parent memiliki child, dan setiap parent akan membungkus childnya
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - MaterialApp: root widget yang menyediakan tema, title, dll.
    - ThemeData and ColorScheme: mengatur tema visual
    - scaffold: kerangka dasar halaman
    - AppBar: Toolbar
    - Text: menampilkan teks
    - padding: menyediakan jarak disekitar widget
    - column: menyusun widget secara vertikal
    - row: menyusun widget secara horizontal
    - sizedbox: membuat ruang kosong antar widget
    - Center: menempatkan widget anaknya ditengah area
    - gridview.count: menampilkan beberapa item didalam grid
    - Card; menampilkan kotak yang berisi informasi
    - Container: widget untuk mengatur padding, size, margin, background color
    - Icon: menampilkan icon
    - Material: membuat anaknya memiliki efek, seperti
    - inkwell: memberi efek ketika menekan button
    - snackbar: menampilkan pesan setelah menekan button
    - ScaffoldMessenger: menampilkan snackbar di scaffold

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    MaterialApp adalah root widget yang berfungsi untuk membungkus widget dan memastikan bahwa widget-widget yang dia membungkusi mengikuti styling material design, dan materialapp mengasih context dan konfigurasi agar widget-widget lain bisa bekerja dengan benar, karena itu materialapp serig digunakan sebagai root
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
   Stateless widget tidak memilki state -> jadi data didalamnya tidak bisa berubah, jadi widget ini bagus untuk menampilkan hal-hal statis, misalnya mau menampilkan teks yang gak pernah berubah
   Stateful widget memiliki state -> data bisa berubah selama runtime, jadi dinamis.
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    BuildContext menyimpan informasi tentang lokasi widget, akan menghubungkan widget dengan parentnya di widget tree. ini penting agar saat build, flutter mengetahui dimana widget berada.
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    Hot Reload -> memperbarui kode tetapi tidak menghapus state
    Hot restart -> membuat aplikasi dari awal, sehingga state juga dihapus.

TUGAS 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
   Navigator.push() dipakai untuk menambahkan halaman baru diatas stack halaman, sehingga pengguna bisa kembali ke halamn sebelumnya, tetapi untuk pushReplacement mengganti halaman sekarang dengan halaman baru, sehingga tidak bisa balik ke halaman sebelumnya
   navigator.push di sebuah app football shop bisa dipakai saat pengguna mau melihat detail produk, dan setelahnya mau balik the productlist
   pushReplacement dipakai kalau misalnya user login/logout, jadi user tidak bisa balik ke halaman login setelah berhasil login dan blm logout, atau kalau setelah save product baru, gabisa balik ke halaman form yang sudah dibuat.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
   drawer dipakai untuk navigasi utama di aplikasi, scaffold sebagai kerangka halaman untuk menyediakan struktur dasar, dan appbar sebagai header halaman yang menampilkan judul dan aksi penting. Dengan menggunakan tiga widget ini secara konsisten di setiap halaman, pengguna bisa menavigasi aplikasi dan mengenali struktur halaman dengan mudah.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
   padding: memastikan ada jarak antara elemen form yang konsisten, dipakai di produklistform untuk memisahkan input field.
   singlechildscrollview: memungkinkan pengguna untuk skrol halaman jika konten melebihi layar, ini mencegahkan overflow, ini dipakai di halaman form penambahan produk, kalau user ingin menginput, dan keyboardnya popup, ini memungkinkan untuk scroll
   listview: menampilkan daftar elemen form yang bisa di scroll, misalnya di leftdrawer untuk menampilkan menu navigasi

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
   Contohnya dari item homepage, kita membuatnya jadi itemnya memiliki atribut color, jadi kita bisa kustomisasi warna button jadi biru, merah, hijau. selain itu dipake untuk font-color, dan background color di scaffold, sehingga seluruh aplikasi memiliki warna yang konsisten sesuai brand toko.

TUGAS 9

1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
   dapat validasi datatype, null safety, dan maintainability kode lebih baik. Kalau hanya memakai map, tidak ada validasi tipedata, harus selalu makai null check, dan sulit untuk refactor code

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
   http hanya untuk request HTTP biasa, sedangkan cookierequest untuk request yang membutuhkan session management, seperti autentikasi dengan cookie.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
   Instance cookierequest harus dibagikan agar sesi penggunaan tetap konsisten di seluruh aplikasi, sehingga user tidak perlu login berulang kali di setiap halaman.
   
4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
   - menambah 10.0.2.2 kepada allowed hosts agar server django bisa diakses dari emulator android
   - mengaktifkan CORS agar permintaan dari domain berbeda (flutter app) diizinkan untuk mengakses sumber daya di server django
   - pengaturan samesite/cookie agar cookie yang ada di server django bisa dikirimkan dengan benar ke aplikasi flutter
   - menambahkan izin akses internet di android agar aplikasi flutter bisa mengakses internet
   kalau konfigurasi ini tidak dilakukan, aplikasi flutter tidak akan bisa berkomunikasi dengan server django, jadi fitur-fitur yang bergantung pada komunikasi server tidak bisa berfungsi.
5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    - user menginput data di form di aplikasi flutter
    - data tsb dimasukkin kedalam model dart
    - model dart diubah menjadi json
    - json dikirim ke server django dengan http/cookierequest
    - views di django menerima data, memprosesnya, dan menyimpan ke database kalau valid
    - ketika data berhasil disimpan, server mengirim respon balik ke aplikasi flutter
    - aplikasi flutter menerima respon, mengubahnya kembali ke model dart
    - data ditampilkan di UI flutter
6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
   - Register
     - Input data
     - Data dikirim ke django dengan cookierequest
     - django validasikan data, kalau valid, simpan ke database
     - django kirim respon balik ke flutter
   - Login
     - input data
     - data dikirim ke django dengan cookierequest
     - django memverifikasi data, kalau valid, buat session dan kirim cookie balik ke flutter
     - flutter menyimpan cookie untuk sesi autentikasi
   - Logout
     - mengirim request ke django untuk logout
     - django menghapus session dan cookie
     - flutter menghapus cookie dari penyimpanan dengan cookierequest
     - 
7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
   - membuat app baru di django buat authentication
   - install app corsheaders di django agar bisa share resource cross-origin
   - konfigurasi settings django untuk corsheaders, allowed hosts, samesite/cookie
   - buat fungsi login,register, dan logout di django dan buat url routingnya
   - add provider dan pbp django di flutter 
   - add cookierequest di main agar menyimpan session
   - buat model custom dengan json agar bisa mapping data dari json ke dart
   - mengintegrasi list product dengan flutter dengan membuat dart file baru untuk fetch dan show products
   - mengintegrasi detail product dengan flutter dengan membuat dart file baru untuk fetch dan show detail product
   - mengintegrasi form input product dengan flutter dengan membuat views baru didjango untuk menagnani menerima data post dari flutter