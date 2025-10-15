import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/booking.dart';
import '../providers/booking_provider.dart';

class BookingDetailPage extends StatelessWidget {
  final Booking booking;

  const BookingDetailPage({
    super.key,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Detail Pemesanan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (booking.status == BookingStatus.pending)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'cancel') {
                  _showCancelDialog(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'cancel',
                  child: Row(
                    children: [
                      Icon(Icons.cancel, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Batalkan Pemesanan'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _getStatusColor(booking.status).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getStatusIcon(booking.status),
                      size: 32,
                      color: _getStatusColor(booking.status),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    booking.status.displayName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getStatusColor(booking.status),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getStatusDescription(booking.status),
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Booking Information
            Text(
              'Informasi Pemesanan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    icon: Icons.receipt_long,
                    label: 'ID Pemesanan',
                    value: booking.id,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.location_on,
                    label: 'Properti',
                    value: booking.propertyName,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.calendar_today,
                    label: 'Tanggal',
                    value: booking.formattedDateRange,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.access_time,
                    label: 'Waktu',
                    value: booking.formattedTimeRange,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.timer,
                    label: 'Durasi',
                    value: '${booking.duration} jam',
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.payments,
                    label: 'Total Pembayaran',
                    value: booking.formattedTotalPrice,
                    isPrice: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Customer Information
            Text(
              'Informasi Pelanggan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    icon: Icons.person,
                    label: 'Nama',
                    value: booking.customerName,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.email,
                    label: 'Email',
                    value: booking.customerEmail,
                  ),
                  const Divider(),
                  _buildInfoRow(
                    icon: Icons.phone,
                    label: 'Telepon',
                    value: booking.customerPhone,
                  ),
                  if (booking.notes != null) ...[
                    const Divider(),
                    _buildInfoRow(
                      icon: Icons.note,
                      label: 'Catatan',
                      value: booking.notes!,
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Booking Timeline
            Text(
              'Timeline Pemesanan',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTimelineItem(
                    icon: Icons.schedule,
                    title: 'Pemesanan Dibuat',
                    subtitle: '${booking.createdAt.day}/${booking.createdAt.month}/${booking.createdAt.year} ${booking.createdAt.hour.toString().padLeft(2, '0')}:${booking.createdAt.minute.toString().padLeft(2, '0')}',
                    isCompleted: true,
                  ),
                  _buildTimelineItem(
                    icon: Icons.check_circle,
                    title: 'Menunggu Konfirmasi',
                    subtitle: 'Pemilik properti akan mengkonfirmasi pemesanan Anda',
                    isCompleted: booking.status != BookingStatus.pending,
                    isActive: booking.status == BookingStatus.pending,
                  ),
                  _buildTimelineItem(
                    icon: Icons.event,
                    title: 'Pemesanan Aktif',
                    subtitle: 'Properti siap digunakan sesuai jadwal',
                    isCompleted: booking.status == BookingStatus.active || booking.status == BookingStatus.completed,
                    isActive: booking.status == BookingStatus.active,
                  ),
                  _buildTimelineItem(
                    icon: Icons.done_all,
                    title: 'Pemesanan Selesai',
                    subtitle: 'Pemesanan telah selesai',
                    isCompleted: booking.status == BookingStatus.completed,
                    isActive: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Action Buttons
            if (booking.status == BookingStatus.pending) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showCancelDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Batalkan Pemesanan',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],

            if (booking.status == BookingStatus.confirmed || booking.status == BookingStatus.active) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur chat akan segera hadir!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Hubungi Pemilik',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isPrice = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: isPrice ? FontWeight.bold : FontWeight.w500,
                    color: isPrice ? Colors.blue[700] : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.green
                  : isActive
                      ? Colors.blue
                      : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isCompleted || isActive ? Colors.black87 : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.confirmed:
        return Colors.blue;
      case BookingStatus.active:
        return Colors.green;
      case BookingStatus.completed:
        return Colors.grey;
      case BookingStatus.cancelled:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Icons.schedule;
      case BookingStatus.confirmed:
        return Icons.check_circle;
      case BookingStatus.active:
        return Icons.event;
      case BookingStatus.completed:
        return Icons.done_all;
      case BookingStatus.cancelled:
        return Icons.cancel;
    }
  }

  String _getStatusDescription(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return 'Pemesanan Anda sedang menunggu konfirmasi dari pemilik properti';
      case BookingStatus.confirmed:
        return 'Pemesanan telah dikonfirmasi oleh pemilik properti';
      case BookingStatus.active:
        return 'Pemesanan sedang aktif dan properti siap digunakan';
      case BookingStatus.completed:
        return 'Pemesanan telah selesai';
      case BookingStatus.cancelled:
        return 'Pemesanan telah dibatalkan';
    }
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Batalkan Pemesanan',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Apakah Anda yakin ingin membatalkan pemesanan ini? Tindakan ini tidak dapat dibatalkan.',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Batal',
              style: GoogleFonts.poppins(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
              bookingProvider.updateBookingStatus(booking.id, BookingStatus.cancelled);
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pemesanan telah dibatalkan')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red[600]),
            child: Text(
              'Ya, Batalkan',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
