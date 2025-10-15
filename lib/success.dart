import 'package:flutter/material.dart';
import 'package:rent_a_field/home.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final String type;
  final int duration;
  final int price;

  const SuccessPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Check icon
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              "Booking Successful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "Your court has been reserved successfully",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Booking details card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Booking Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),

                  _buildDetailRow("Court Name", title),
                  _buildDetailRow(
                    "Date",
                    "Dec 15",
                  ), // nanti bisa diganti dynamic
                  _buildDetailRow("Duration", "$duration hours"),
                  _buildDetailRow("Payment Method", type),
                  const Divider(),
                  _buildDetailRow(
                    "Total Price",
                    "Rp. ${price.toString()}",
                    isBold: true,
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Buttons
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
                onPressed: () {},
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  "Download Receipt",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.grey.shade100,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                icon: const Icon(Icons.home, color: Colors.black),
                label: const Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
