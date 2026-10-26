# MyInventory: Simple Stock Management

Aplikasi mobile sederhana untuk mengelola persediaan barang. Pengguna dapat menambah, melihat, memperbarui, dan menghapus data barang beserta jumlah stoknya.

## Fitur
- Tambah data barang beserta jumlah stok
- Lihat daftar barang
- Ubah data barang
- Hapus data barang
- Data tersimpan lokal di perangkat (offline)

## Teknologi
- Flutter
- Dart
- SQLite (paket `sqflite`)

## Struktur Kode
- `lib/db/database_helper.dart`: pengelolaan database SQLite
- `lib/models/item.dart`: model data barang
- `lib/screens/home_screen.dart`: halaman daftar barang
- `lib/screens/add_edit_item_screen.dart`: form tambah dan ubah barang

## Cara Menjalankan
1. Pastikan Flutter SDK sudah terpasang (`flutter doctor`)
2. Clone repository:
   ```
   git clone https://github.com/arkannz/MyInventory-Flutter.git
   ```
3. Masuk ke folder proyek:
   ```
   cd MyInventory-Flutter
   ```
4. Instal dependensi:
   ```
   flutter pub get
   ```
5. Jalankan aplikasi:
   ```
   flutter run
   ```

## Pembuat
Muhammad Fitra Arkansyah