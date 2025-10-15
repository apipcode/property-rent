import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/property.dart';
import 'payment_method_page.dart';

class OrderSummaryPage extends StatelessWidget {
  final Property property;
  final int durationHours;
  final double totalPrice;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final String? notes;

  const OrderSummaryPage({
    super.key,
    required this.property,
    required this.durationHours,
    required this.totalPrice,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.startDateTime,
    required this.endDateTime,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Order Summary', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black87)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _card(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      property.images.first,
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(width: 72, height: 72, color: Colors.grey[300], child: const Icon(Icons.image_not_supported)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(property.name, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(property.location, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _card(
              child: Column(
                children: [
                  _row('Nama', customerName),
                  _row('Telepon', customerPhone),
                  _row('Email', customerEmail),
                  _row('Mulai', _fmtDate(startDateTime) + ' ${_fmtTime(startDateTime)}'),
                  _row('Selesai', _fmtDate(endDateTime) + ' ${_fmtTime(endDateTime)}'),
                  _row('Durasi', '$durationHours jam'),
                  if (notes != null && notes!.isNotEmpty) _row('Catatan', notes!),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _card(
              child: Column(
                children: [
                  _row('Harga per jam', _rp(property.price)),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                      Text(_rp(totalPrice), style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: Colors.blue[700])),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(
                        property: property,
                        durationHours: durationHours,
                        totalPrice: totalPrice,
                        customerName: customerName,
                        customerEmail: customerEmail,
                        customerPhone: customerPhone,
                        startDateTime: startDateTime,
                        endDateTime: endDateTime,
                        notes: notes,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Payment Method', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: child,
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: GoogleFonts.poppins(color: Colors.grey[600])),
          Flexible(
            child: Text(value, textAlign: TextAlign.right, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  String _rp(double n) => 'Rp ${n.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';
  String _fmtDate(DateTime d) => '${d.day}/${d.month}/${d.year}';
  String _fmtTime(DateTime d) => '${d.hour.toString().padLeft(2, '0')}:${d.minute.toString().padLeft(2, '0')}';
}
