# Rent A Property - Flutter Mobile App

Aplikasi mobile Flutter untuk menyewa berbagai jenis properti seperti lapangan olahraga, villa, ruang acara, dan jenis tempat sewa lainnya.

## 🚀 Fitur Utama

### ✅ Fitur yang Sudah Diimplementasi

1. **Halaman Utama dengan Kategori**
   - Daftar properti dengan berbagai kategori (Lapangan Olahraga, Villa, Ruang Acara, dll.)
   - Filter berdasarkan kategori
   - Pencarian properti berdasarkan nama dan lokasi
   - UI/UX yang responsif dan modern

2. **Halaman Detail Properti**
   - Foto properti dengan carousel
   - Deskripsi lengkap properti
   - Daftar fasilitas yang tersedia
   - Informasi harga dan rating
   - Informasi pemilik properti

3. **Formulir Pemesanan**
   - Form data pelanggan dengan validasi
   - Pilih tanggal dan waktu pemesanan
   - Kalkulasi harga otomatis
   - Validasi ketersediaan properti
   - Simpan data pemesanan di memori lokal

4. **Riwayat Pemesanan**
   - Daftar semua pemesanan
   - Filter berdasarkan status pemesanan
   - Detail lengkap setiap pemesanan
   - Timeline status pemesanan

5. **State Management**
   - Menggunakan Provider untuk state management
   - Data pemesanan tersimpan di memori lokal
   - Update status pemesanan real-time

## 📱 Kategori Properti

- 🏟️ **Lapangan Olahraga** - Futsal, Basket, Badminton, Tennis, Volleyball
- 🏖️ **Villa** - Villa pantai, villa gunung dengan fasilitas lengkap
- 🎉 **Ruang Acara** - Ballroom, garden party venue
- 💼 **Ruang Meeting** - Executive meeting room
- 🎬 **Studio** - Photo studio, recording studio
- 🅿️ **Parkir** - Area parkir aman
- 🏭 **Gudang** - Warehouse untuk penyimpanan

## 🛠️ Teknologi yang Digunakan

- **Flutter** - Framework mobile development
- **Provider** - State management
- **Google Fonts** - Typography (Poppins)
- **Material Design 3** - UI/UX design system

## 📁 Struktur Proyek

```
lib/
├── models/
│   ├── property.dart          # Model data properti
│   └── booking.dart           # Model data pemesanan
├── data/
│   └── mock_data.dart         # Data mock properti
├── providers/
│   └── booking_provider.dart  # State management pemesanan
├── pages/
│   ├── home_page.dart         # Halaman utama
│   ├── property_detail_page.dart  # Detail properti
│   ├── booking_form_page.dart     # Form pemesanan
│   ├── booking_success_page.dart  # Konfirmasi berhasil
│   ├── booking_history_page.dart  # Riwayat pemesanan
│   └── booking_detail_page.dart   # Detail pemesanan
├── landingpage.dart           # Halaman landing
└── main.dart                  # Entry point aplikasi
```

## 🚀 Cara Menjalankan

1. **Install Dependencies**
   ```bash
   flutter pub get
   ```

2. **Jalankan Aplikasi**
   ```bash
   flutter run
   ```

3. **Build untuk Production**
   ```bash
   # Android
   flutter build apk --release
   
   # iOS
   flutter build ios --release
   ```

## 📋 Fitur yang Tersedia

### Halaman Utama
- ✅ Daftar properti dengan kategori
- ✅ Filter berdasarkan kategori
- ✅ Pencarian properti
- ✅ Navigasi ke detail properti

### Detail Properti
- ✅ Tampilan foto properti
- ✅ Informasi lengkap properti
- ✅ Daftar fasilitas
- ✅ Tombol pemesanan

### Form Pemesanan
- ✅ Input data pelanggan
- ✅ Pilih tanggal dan waktu
- ✅ Validasi form
- ✅ Kalkulasi harga
- ✅ Simpan pemesanan

### Riwayat Pemesanan
- ✅ Daftar pemesanan
- ✅ Filter status
- ✅ Detail pemesanan
- ✅ Timeline status

## 🎨 Design System

- **Primary Color**: Blue (#1976D2)
- **Typography**: Poppins font family
- **Material Design 3** components
- **Responsive layout** untuk berbagai ukuran layar
- **Consistent spacing** dan padding

## 📱 Screenshots

Aplikasi ini memiliki UI/UX yang modern dengan:
- Card-based design untuk properti
- Smooth animations dan transitions
- Intuitive navigation
- Clean dan minimal design
- Mobile-first approach

## 🔮 Fitur Future (Belum Diimplementasi)

- [ ] Backend integration
- [ ] Real-time notifications
- [ ] Payment gateway
- [ ] Chat dengan pemilik
- [ ] Rating dan review
- [ ] Push notifications
- [ ] Offline support
- [ ] Multi-language support

## 📄 Lisensi

Aplikasi ini dibuat untuk demonstrasi dan pembelajaran. Silakan gunakan sesuai kebutuhan.

## 👨‍💻 Developer

Dibuat dengan ❤️ menggunakan Flutter framework.

---

**Note**: Aplikasi ini adalah prototipe frontend tanpa backend. Semua data disimpan di memori lokal dan akan hilang saat aplikasi ditutup.
