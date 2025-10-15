import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  Widget _buildHistoryCard({
    required String title,
    required String type,
    required int courtprice,
    required String imagePath,
    required double rating,
    required String status,
  }) {
    // Tentukan warna status biar beda tergantung jenisnya
    Color statusColor = status.contains("QRIS")
        ? Colors.green
        : Colors.orange;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 352,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                imagePath,
                height: 192,
                width: 352,
                fit: BoxFit.cover,
              ),
            ),

            // Isi card
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Type
                  Text(
                    type,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Harga + Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${formatPrice(courtprice)}/hour",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: statusColor, width: 1),
                        ),
                        child: Text(
                          status,
                          style: GoogleFonts.poppins(
                            color: statusColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Booking History",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHistoryCard(
                title: "Futsal Court A",
                type: "Indoor • Air Conditioned",
                courtprice: 50000,
                imagePath: 'assets/images/futsal.png',
                rating: 4.8,
                status: "Booked | Paid via QRIS",
              ),
              _buildHistoryCard(
                title: "Basketball Court B",
                type: "Outdoor • Premium Flooring",
                courtprice: 75000,
                imagePath: 'assets/images/basketball.png',
                rating: 4.7,
                status: "Booked | Paid on Location",
              ),
              _buildHistoryCard(
                title: "Badminton Court C",
                type: "Indoor • Wooden Flooring",
                courtprice: 45000,
                imagePath: 'assets/images/badminton.png',
                rating: 4.9,
                status: "Booked | Paid via QRIS",
              ),
            ],
          ),
        ),
      ),
    );
  }
}