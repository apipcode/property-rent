import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/property.dart';
import '../models/booking.dart';
import '../providers/booking_provider.dart';
import 'booking_success_page.dart';

class QrisPaymentPage extends StatelessWidget {
  final Property property;
  final int durationHours;
  final double totalPrice;

  const QrisPaymentPage({
    super.key,
    required this.property,
    required this.durationHours,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('QRIS Payment', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black87)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Total yang harus dibayar', style: GoogleFonts.poppins(color: Colors.grey[600])),
            const SizedBox(height: 6),
            Text('Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue[700])),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/QR.png', width: 220, height: 220, fit: BoxFit.contain,
                        errorBuilder: (c, e, s) => const Icon(Icons.qr_code, size: 200)),
                      const SizedBox(height: 12),
                      Text('Scan QR di aplikasi e-wallet Anda', style: GoogleFonts.poppins(color: Colors.grey[700])),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Simulasikan pembayaran berhasil, buat Booking dan simpan di provider
                  final provider = Provider.of<BookingProvider>(context, listen: false);
                  final start = DateTime.now();
                  final end = start.add(Duration(hours: durationHours));

                  final booking = Booking(
                    id: provider.generateBookingId(),
                    propertyId: property.id,
                    propertyName: property.name,
                    customerName: 'Guest',
                    customerEmail: 'guest@example.com',
                    customerPhone: '-',
                    startDate: start,
                    endDate: end,
                    duration: durationHours,
                    totalPrice: totalPrice,
                    status: BookingStatus.confirmed,
                    createdAt: DateTime.now(),
                  );

                  provider.addBooking(booking);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingSuccessPage(booking: booking),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Have Paid', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
