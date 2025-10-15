import 'package:flutter/material.dart';
import 'package:rent_a_field/method.dart';

class PaymentPage extends StatefulWidget {
  final String title;
  final String type;
  final int duration; // berapa jam
  final int price; // total harga (sudah kali durasi)

  const PaymentPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    const int serviceFee = 5000;

    // harga per jam = total / durasi
    final int pricePerHour = widget.price ~/ widget.duration;

    // subtotal = total harga (sudah sesuai durasi)
    final int subtotal = widget.price;

    // total + service fee
    final int total = subtotal + serviceFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ===== Card Utama =====
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.type, style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 16),

                  // Date
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 8),
                      const Text("Date"),
                      const Spacer(),
                      Text(
                        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Duration
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 8),
                      const Text("Duration"),
                      const Spacer(),
                      Text("${widget.duration} Hours"),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Price per Hour
                  Row(
                    children: [
                      const Icon(Icons.attach_money, size: 18),
                      const SizedBox(width: 8),
                      const Text("Price per Hour"),
                      const Spacer(),
                      Text(formatPrice(pricePerHour)),
                    ],
                  ),

                  const Divider(height: 32, thickness: 1),

                  // Subtotal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal (${widget.duration} hours)"),
                      Text(formatPrice(subtotal)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Service Fee
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Service Fee"),
                      Text(formatPrice(serviceFee)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formatPrice(total),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== Booking Policy =====
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Free cancellation up to 5 hours before your booking time. Equipment rental available on-site.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ===== Tombol =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(
                        title: widget.title,
                        type: widget.type,
                        duration: widget.duration,
                        price: widget.price,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Choose Payment Method →",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}