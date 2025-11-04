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