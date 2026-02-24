# PBW
# Project Shopping Cart Flutter

Nama  : Asriah Ainun Fazah  
NIM   : 2409116068  
Kelas : Pemrograman Aplikasi Bergerak  

## Deskripsi
Aplikasi Shopping Cart sederhana menggunakan Flutter dan Provider.
Aplikasi ini menampilkan daftar produk, menambahkan produk ke keranjang,
mengatur jumlah item, dan menghitung total harga secara otomatis.

## Fitur
Fitur Wajib (Core Features)
- **Add to Cart from Product List:** Pengguna dapat menambahkan produk langsung dari halaman utama ke dalam keranjang.

- **Show Cart Items with Quantity:** Menampilkan daftar item di dalam keranjang lengkap dengan jumlah (kuantitas) tiap barang.

- **Update Quantity (+/-):** Tersedia tombol untuk menambah atau mengurangi jumlah barang secara reaktif di halaman keranjang.

- **Remove Items from Cart:** Fitur untuk menghapus produk tertentu dari keranjang belanja.

- **Display Total Price Correctly:** Perhitungan total harga dilakukan secara otomatis dan akurat berdasarkan jumlah barang yang dipilih.

Fitur Bonus (Extra Features)
- **Search/Filter:** Pengguna dapat mencari produk berdasarkan nama menggunakan fitur search bar.

- **Categories:** Filter produk berdasarkan kategori tertentu (Electronics, Gadget, Accessories) menggunakan dropdown.

- **Checkout Page:** Halaman khusus untuk meninjau ringkasan pesanan (order summary) dan pengisian formulir data diri sebelum melakukan pemesanan.

Dokumentasi Implementasi Kode
Berikut adalah poin-poin teknis pengerjaan yang diimplementasikan:

**- State Management:** Menggunakan **ChangeNotifierProvider** di level aplikasi (main.dart) agar data keranjang dapat diakses secara global oleh seluruh halaman.

<img width="249" height="49" alt="image" src="https://github.com/user-attachments/assets/1b24ded2-295f-48d3-b2af-546f2e144727" />


**- Data Consistency:** Menggunakan **notifyListeners()** pada CartModel untuk memastikan UI selalu terupdate setiap kali ada perubahan pada data keranjang (tambah/kurang/hapus).

<img width="154" height="31" alt="image" src="https://github.com/user-attachments/assets/aff0f0f3-029c-46ff-80f2-74b14d5151da" />


**- Validation:** Implementasi logika di mana jika kuantitas barang dikurangi hingga angka 0, maka produk tersebut otomatis terhapus dari keranjang.

<img width="533" height="196" alt="image" src="https://github.com/user-attachments/assets/f88bfd4d-ca5e-4ff9-9f82-77811476c457" />

**- Navigation:** Penggunaan Navigator.push untuk perpindahan antar halaman dari daftar produk ke keranjang hingga ke proses checkout.

<img width="331" height="82" alt="image" src="https://github.com/user-attachments/assets/6398c1fb-603e-4e9a-9caa-f65fa686c5da" />



**Dokumentasi Hasil Pengerjaan:**

<img width="397" height="542" alt="image" src="https://github.com/user-attachments/assets/a7008f05-2a94-4ca3-9ee2-32ff51e545d3" />

- Kategori Elektronik

<img width="401" height="541" alt="image" src="https://github.com/user-attachments/assets/6551500e-b55c-4e80-bed5-da78ba96160b" />

- Kategori Gadget

<img width="398" height="543" alt="image" src="https://github.com/user-attachments/assets/70a17d11-1ca9-41b1-8209-e14f1cbdb60d" />

- Kategori Aksesoris

<img width="395" height="536" alt="image" src="https://github.com/user-attachments/assets/16134947-7fb9-4318-90b3-55716471eed9" />

**Halaman Keranjang:**

<img width="394" height="535" alt="image" src="https://github.com/user-attachments/assets/2b9cfbcd-a4ab-43f0-befd-82bb153153b1" />

**Halaman Checkout:**

<img width="393" height="532" alt="image" src="https://github.com/user-attachments/assets/16cb2ceb-7c7f-4e4f-b719-cca3a1e13b44" />



