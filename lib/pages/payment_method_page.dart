import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/property.dart';
import 'qris_payment_page.dart';

class PaymentMethodPage extends StatelessWidget {
  final Property property;
  final int durationHours;
  final double totalPrice;

  const PaymentMethodPage({
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
        title: Text('Payment Method', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.black87)),
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
            Text('Pilih metode pembayaran', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            _tile(
              context: context,
              title: 'QRIS (Disarankan)',
              subtitle: 'Scan QR dan konfirmasi "Have Paid"',
              icon: Icons.qr_code,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrisPaymentPage(
                      property: property,
                      durationHours: durationHours,
                      totalPrice: totalPrice,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            _tile(
              context: context,
              title: 'Kartu Kredit (Nonaktif)',
              subtitle: 'Demo UI saja',
              icon: Icons.credit_card,
              disabled: true,
            ),
            const SizedBox(height: 8),
            _tile(
              context: context,
              title: 'Transfer Bank (Nonaktif)',
              subtitle: 'Demo UI saja',
              icon: Icons.account_balance,
              disabled: true,
            ),
            const Spacer(),
            _totalBar(),
          ],
        ),
      ),
    );
  }

  Widget _tile({required BuildContext context, required String title, required String subtitle, required IconData icon, bool disabled = false, VoidCallback? onTap}) {
    return Opacity(
      opacity: disabled ? 0.5 : 1,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Colors.grey[200]!)),
        leading: CircleAvatar(backgroundColor: Colors.blue[50], child: Icon(icon, color: Colors.blue[700])),
        title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
        onTap: disabled ? null : onTap,
      ),
    );
  }

  Widget _totalBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total', style: GoogleFonts.poppins()),
          Text('Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: Colors.blue[700])),
        ],
      ),
    );
  }
}
