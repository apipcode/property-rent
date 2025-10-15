import 'package:flutter/material.dart';
import 'package:rent_a_field/payment.dart';

class DurationPage extends StatefulWidget {
  final String title;
  final String type;
  final int courtprice; 

  const DurationPage({
    super.key,
    required this.title,
    required this.type,
    required this.courtprice,
  });

  @override
  State<DurationPage> createState() => _DurationPageState();
}

class _DurationPageState extends State<DurationPage> {
  @override
  Widget build(BuildContext context) {
    // list packages dibuat di dalam build supaya bisa akses widget.courtprice
    final packages = [
      {
        "duration": 1,
        "subtitle": "Perfect for training",
        "price": widget.courtprice,
      },
      {
        "duration": 2,
        "subtitle": "Best value for groups",
        "price": widget.courtprice + 40000,
      },
      {
        "duration": 3,
        "subtitle": "Great for tournaments",
        "price": widget.courtprice + 80000,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Package Duration",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          final int duration = package["duration"] as int;
          final int price = package["price"] as int;

          return GestureDetector(
            onTap: () {
              // Data dilempar ke page lain
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    title: widget.title,
                    type: widget.type,
                    duration: duration,
                    price: price,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // durasi + subtitle
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$duration Hour${duration > 1 ? 's' : ''}", // tampilkan hrs pakai string
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        package["subtitle"] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  // harga
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Rp $price",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "per session",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
