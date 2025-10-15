import 'package:flutter/material.dart';
import 'package:rent_a_field/success.dart';
// Tambahin package kalau mau generate QR sendiri:
// import 'package:qr_flutter/qr_flutter.dart';

class QrisPage extends StatelessWidget {
  final String title;
  final String type;
  final int duration;
  final int price;

  const QrisPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QRIS Payment"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Payment Amount
            const Text(
              "Payment Amount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              formatPrice(price),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // QR Code
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/images/QR.png", // ganti dengan asset QR-mu
                height: 180,
                width: 180,
              ),
              // kalau mau pakai package:
              // child: QrImageView(
              //   data: "ORDER-$title-$price",
              //   size: 180,
              // ),
            ),
            const SizedBox(height: 20),

            // Scan to Pay
            const Text(
              "Scan to Pay",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              "Point your camera at the QR code\n"
              "Open your mobile banking or e-wallet app\n"
              "and scan the QR code above to complete your payment",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const Spacer(),

            // Button I Have Paid
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Arahkan ke success page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessPage(
                        title: title,
                        type: type,
                        duration: duration,
                        price: price,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check, color: Colors.white, size: 18),
                label: const Text(
                  "I Have Paid",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Share & Save
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.share, size: 16, color: Colors.red),
                  label: const Text(
                    "Share",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(width: 20),
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(
                    Icons.download,
                    size: 16,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    "Save",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
