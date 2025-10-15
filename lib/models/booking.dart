// Model untuk pemesanan
class Booking {
  final String id;
  final String propertyId;
  final String propertyName;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final DateTime startDate;
  final DateTime endDate;
  final int duration; // dalam jam atau hari tergantung properti
  final double totalPrice;
  final BookingStatus status;
  final DateTime createdAt;
  final String? notes;
  final Map<String, dynamic> additionalInfo;

  Booking({
    required this.id,
    required this.propertyId,
    required this.propertyName,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    this.notes,
    this.additionalInfo = const {},
  });

  // Format tanggal untuk ditampilkan
  String get formattedDateRange {
    final start = '${startDate.day}/${startDate.month}/${startDate.year}';
    final end = '${endDate.day}/${endDate.month}/${endDate.year}';
    return '$start - $end';
  }

  // Format waktu untuk ditampilkan
  String get formattedTimeRange {
    final start = '${startDate.hour.toString().padLeft(2, '0')}:${startDate.minute.toString().padLeft(2, '0')}';
    final end = '${endDate.hour.toString().padLeft(2, '0')}:${endDate.minute.toString().padLeft(2, '0')}';
    return '$start - $end';
  }

  // Format harga total
  String get formattedTotalPrice {
    return 'Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  // Copy dengan perubahan
  Booking copyWith({
    String? id,
    String? propertyId,
    String? propertyName,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    DateTime? startDate,
    DateTime? endDate,
    int? duration,
    double? totalPrice,
    BookingStatus? status,
    DateTime? createdAt,
    String? notes,
    Map<String, dynamic>? additionalInfo,
  }) {
    return Booking(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      propertyName: propertyName ?? this.propertyName,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      duration: duration ?? this.duration,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      notes: notes ?? this.notes,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }
}

// Enum untuk status pemesanan
enum BookingStatus {
  pending('Menunggu Konfirmasi', '⏳'),
  confirmed('Dikonfirmasi', '✅'),
  active('Aktif', '🟢'),
  completed('Selesai', '🏁'),
  cancelled('Dibatalkan', '❌');

  const BookingStatus(this.displayName, this.emoji);
  
  final String displayName;
  final String emoji;
}
