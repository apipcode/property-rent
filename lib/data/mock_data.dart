import '../models/property.dart';

// Mock data untuk berbagai kategori properti
class MockData {
  static List<Property> getProperties() {
    return [
      // Lapangan Olahraga
      Property(
        id: '1',
        name: 'Futsal Court Premium',
        description: 'Lapangan futsal indoor dengan lantai sintetis berkualitas tinggi, dilengkapi AC dan pencahayaan LED yang optimal untuk pertandingan malam hari.',
        category: PropertyCategory.sportsField,
        price: 150000,
        priceUnit: 'jam',
        location: 'Jakarta Selatan',
        images: ['assets/images/futsal.png'],
        facilities: [
          'AC',
          'Lantai Sintetis Premium',
          'Pencahayaan LED',
          'Loker',
          'Shower',
          'Parkir Gratis',
          'WiFi',
        ],
        rating: 4.8,
        reviewCount: 127,
        isAvailable: true,
        owner: 'Sports Center Jakarta',
        additionalInfo: {
          'capacity': '10 orang',
          'size': '40m x 20m',
          'surface': 'Sintetis',
        },
      ),
      
      Property(
        id: '2',
        name: 'Basketball Court Elite',
        description: 'Lapangan basket outdoor dengan lantai kayu maple berkualitas internasional, cocok untuk latihan dan pertandingan profesional.',
        category: PropertyCategory.sportsField,
        price: 200000,
        priceUnit: 'jam',
        location: 'Bandung',
        images: ['assets/images/basketball.png'],
        facilities: [
          'Lantai Kayu Maple',
          'Pencahayaan Profesional',
          'Scoreboard Digital',
          'Loker',
          'Shower',
          'Parkir Luas',
          'Café',
        ],
        rating: 4.9,
        reviewCount: 89,
        isAvailable: true,
        owner: 'Elite Sports Complex',
        additionalInfo: {
          'capacity': '20 orang',
          'size': '28m x 15m',
          'surface': 'Kayu Maple',
        },
      ),

      Property(
        id: '3',
        name: 'Badminton Court Pro',
        description: 'Lapangan bulutangkis indoor dengan lantai kayu dan pencahayaan yang memenuhi standar internasional.',
        category: PropertyCategory.sportsField,
        price: 80000,
        priceUnit: 'jam',
        location: 'Surabaya',
        images: ['assets/images/badminton.png'],
        facilities: [
          'Lantai Kayu',
          'AC',
          'Pencahayaan Standar Internasional',
          'Loker',
          'Shower',
          'Parkir',
        ],
        rating: 4.7,
        reviewCount: 156,
        isAvailable: true,
        owner: 'Badminton Center Surabaya',
        additionalInfo: {
          'capacity': '4 orang',
          'size': '13.4m x 6.1m',
          'surface': 'Kayu',
        },
      ),

      // Villa
      Property(
        id: '4',
        name: 'Villa Sunset Beach',
        description: 'Villa mewah di tepi pantai dengan pemandangan sunset yang menakjubkan. Dilengkapi kolam renang pribadi dan fasilitas lengkap untuk liburan keluarga.',
        category: PropertyCategory.villa,
        price: 2500000,
        priceUnit: 'hari',
        location: 'Bali',
        images: ['assets/images/image.png'], // Menggunakan placeholder
        facilities: [
          'Kolam Renang Pribadi',
          'Pemandangan Pantai',
          '3 Kamar Tidur',
          'Dapur Lengkap',
          'AC di Semua Ruangan',
          'WiFi',
          'Parkir',
          'Butler Service',
        ],
        rating: 4.9,
        reviewCount: 45,
        isAvailable: true,
        owner: 'Bali Luxury Villas',
        additionalInfo: {
          'capacity': '8 orang',
          'bedrooms': 3,
          'bathrooms': 3,
          'area': '500 m²',
        },
      ),

      Property(
        id: '5',
        name: 'Villa Mountain View',
        description: 'Villa di ketinggian dengan pemandangan gunung yang menenangkan. Cocok untuk retreat dan liburan santai di alam.',
        category: PropertyCategory.villa,
        price: 1800000,
        priceUnit: 'hari',
        location: 'Puncak, Bogor',
        images: ['assets/images/image.png'],
        facilities: [
          'Pemandangan Gunung',
          'Fireplace',
          '2 Kamar Tidur',
          'Dapur',
          'Teras Luas',
          'WiFi',
          'Parkir',
          'Garden',
        ],
        rating: 4.6,
        reviewCount: 32,
        isAvailable: true,
        owner: 'Mountain Retreat Villas',
        additionalInfo: {
          'capacity': '6 orang',
          'bedrooms': 2,
          'bathrooms': 2,
          'area': '300 m²',
        },
      ),

      // Ruang Acara
      Property(
        id: '6',
        name: 'Grand Ballroom',
        description: 'Ruang acara mewah dengan kapasitas besar, dilengkapi sound system profesional dan lighting yang dapat disesuaikan untuk berbagai jenis acara.',
        category: PropertyCategory.eventSpace,
        price: 5000000,
        priceUnit: 'hari',
        location: 'Jakarta Pusat',
        images: ['assets/images/image.png'],
        facilities: [
          'Sound System Profesional',
          'Lighting System',
          'Panggung',
          'AC',
          'Parkir Luas',
          'Catering Service',
          'WiFi',
          'Security',
        ],
        rating: 4.8,
        reviewCount: 67,
        isAvailable: true,
        owner: 'Grand Event Center',
        additionalInfo: {
          'capacity': '500 orang',
          'area': '800 m²',
          'ceiling_height': '4.5m',
        },
      ),

      Property(
        id: '7',
        name: 'Garden Party Venue',
        description: 'Venue outdoor dengan taman yang indah, cocok untuk acara pernikahan, ulang tahun, dan gathering dengan suasana alam yang asri.',
        category: PropertyCategory.eventSpace,
        price: 3000000,
        priceUnit: 'hari',
        location: 'Depok',
        images: ['assets/images/image.png'],
        facilities: [
          'Taman Luas',
          'Gazebo',
          'Sound System',
          'Lighting',
          'Parkir',
          'Catering',
          'Toilet',
          'Parkir',
        ],
        rating: 4.5,
        reviewCount: 43,
        isAvailable: true,
        owner: 'Garden Events',
        additionalInfo: {
          'capacity': '200 orang',
          'area': '1000 m²',
          'type': 'Outdoor',
        },
      ),

      // Ruang Meeting
      Property(
        id: '8',
        name: 'Executive Meeting Room',
        description: 'Ruang meeting executive dengan fasilitas lengkap untuk presentasi dan rapat penting. Dilengkapi dengan teknologi terbaru.',
        category: PropertyCategory.meetingRoom,
        price: 500000,
        priceUnit: 'jam',
        location: 'Jakarta Selatan',
        images: ['assets/images/image.png'],
        facilities: [
          'Projector 4K',
          'Whiteboard',
          'AC',
          'WiFi',
          'Sound System',
          'Coffee Break',
          'Parkir',
          'Receptionist',
        ],
        rating: 4.7,
        reviewCount: 89,
        isAvailable: true,
        owner: 'Business Center Jakarta',
        additionalInfo: {
          'capacity': '20 orang',
          'area': '50 m²',
          'layout': 'U-Shape',
        },
      ),

      // Studio
      Property(
        id: '9',
        name: 'Photo Studio Premium',
        description: 'Studio foto profesional dengan lighting setup lengkap dan backdrop yang beragam. Cocok untuk photoshoot komersial dan personal.',
        category: PropertyCategory.studio,
        price: 800000,
        priceUnit: 'jam',
        location: 'Jakarta Barat',
        images: ['assets/images/image.png'],
        facilities: [
          'Lighting Setup Profesional',
          'Backdrop Beragam',
          'AC',
          'Makeup Room',
          'Changing Room',
          'WiFi',
          'Parkir',
          'Assistant',
        ],
        rating: 4.9,
        reviewCount: 124,
        isAvailable: true,
        owner: 'Creative Studio Jakarta',
        additionalInfo: {
          'capacity': '10 orang',
          'area': '80 m²',
          'ceiling_height': '4m',
        },
      ),

      // Parkir
      Property(
        id: '10',
        name: 'Secure Parking Lot',
        description: 'Area parkir aman dengan sistem keamanan 24 jam, cocok untuk event atau acara yang membutuhkan parkir dalam jumlah besar.',
        category: PropertyCategory.parking,
        price: 100000,
        priceUnit: 'hari',
        location: 'Jakarta Pusat',
        images: ['assets/images/image.png'],
        facilities: [
          'Security 24 Jam',
          'CCTV',
          'Lighting',
          'Access Control',
          'Cleaning Service',
          'Insurance',
        ],
        rating: 4.4,
        reviewCount: 56,
        isAvailable: true,
        owner: 'Secure Parking Solutions',
        additionalInfo: {
          'capacity': '100 mobil',
          'area': '2000 m²',
          'type': 'Outdoor',
        },
      ),
    ];
  }

  // Filter properti berdasarkan kategori
  static List<Property> getPropertiesByCategory(PropertyCategory category) {
    return getProperties().where((property) => property.category == category).toList();
  }

  // Cari properti berdasarkan nama atau lokasi
  static List<Property> searchProperties(String query) {
    final lowerQuery = query.toLowerCase();
    return getProperties().where((property) {
      return property.name.toLowerCase().contains(lowerQuery) ||
             property.location.toLowerCase().contains(lowerQuery) ||
             property.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  // Dapatkan properti berdasarkan ID
  static Property? getPropertyById(String id) {
    try {
      return getProperties().firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }
}
