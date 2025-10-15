import 'package:flutter/foundation.dart';
import '../models/booking.dart';

// Provider untuk mengelola data pemesanan
class BookingProvider with ChangeNotifier {
  List<Booking> _bookings = [];
  Booking? _currentBooking;

  // Getter untuk daftar pemesanan
  List<Booking> get bookings => List.unmodifiable(_bookings);

  // Getter untuk pemesanan saat ini
  Booking? get currentBooking => _currentBooking;

  // Tambah pemesanan baru
  void addBooking(Booking booking) {
    _bookings.add(booking);
    notifyListeners();
  }

  // Update status pemesanan
  void updateBookingStatus(String bookingId, BookingStatus newStatus) {
    final index = _bookings.indexWhere((booking) => booking.id == bookingId);
    if (index != -1) {
      _bookings[index] = _bookings[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }

  // Hapus pemesanan
  void removeBooking(String bookingId) {
    _bookings.removeWhere((booking) => booking.id == bookingId);
    notifyListeners();
  }

  // Set pemesanan saat ini
  void setCurrentBooking(Booking? booking) {
    _currentBooking = booking;
    notifyListeners();
  }

  // Dapatkan pemesanan berdasarkan ID
  Booking? getBookingById(String id) {
    try {
      return _bookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  // Dapatkan pemesanan berdasarkan status
  List<Booking> getBookingsByStatus(BookingStatus status) {
    return _bookings.where((booking) => booking.status == status).toList();
  }

  // Dapatkan pemesanan berdasarkan properti
  List<Booking> getBookingsByProperty(String propertyId) {
    return _bookings.where((booking) => booking.propertyId == propertyId).toList();
  }

  // Clear semua pemesanan (untuk testing)
  void clearAllBookings() {
    _bookings.clear();
    _currentBooking = null;
    notifyListeners();
  }

  // Generate ID unik untuk pemesanan baru
  String generateBookingId() {
    final now = DateTime.now();
    return 'BK${now.millisecondsSinceEpoch}';
  }

  // Validasi ketersediaan properti pada tanggal tertentu
  bool isPropertyAvailable(String propertyId, DateTime startDate, DateTime endDate) {
    final conflictingBookings = _bookings.where((booking) {
      if (booking.propertyId != propertyId) return false;
      if (booking.status == BookingStatus.cancelled) return false;
      
      // Cek apakah ada konflik waktu
      return (startDate.isBefore(booking.endDate) && endDate.isAfter(booking.startDate));
    }).toList();

    return conflictingBookings.isEmpty;
  }
}
