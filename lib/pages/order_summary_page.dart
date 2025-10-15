import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/property.dart';
import 'payment_method_page.dart';

class OrderSummaryPage extends StatelessWidget {
  final Property property;
  final int durationHours;
  final double totalPrice;

  const OrderSummaryPage({
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
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Durasi', style: GoogleFonts.poppins(color: Colors.grey[600])),
                      Text('$durationHours jam', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Harga per jam', style: GoogleFonts.poppins(color: Colors.grey[600])),
                      Text('Rp ${property.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
                      Text('Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, color: Colors.blue[700])),
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
}
