import 'package:flutter/material.dart';
import 'package:rent_a_field/qris.dart';
import 'package:rent_a_field/success.dart';

class PaymentMethodPage extends StatefulWidget {
  final String title;
  final String type;
  final int duration;
  final int price;

  const PaymentMethodPage({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.price,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose Payment",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Select your preferred payment method",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Pay on Location
            _buildPaymentOption(
              method: "Pay on Location",
              subtitle: "Pay with cash when you arrive at the location",
              icon: Icons.store,
            ),
            const SizedBox(height: 12),

            // Pay via QRIS
            _buildPaymentOption(
              method: "Pay via QRIS",
              subtitle: "Scan QR code to pay instantly with your e-wallet",
              icon: Icons.qr_code_2,
            ),
            const SizedBox(height: 20),

            // Booking Policy
            Container(
              padding: const EdgeInsets.all(12),
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
                      "Booking Policy\nYour payment method can't be changed after completing the order",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Tombol I Have Paid (muncul setelah pilih metode)
            if (selectedMethod != null)
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
                    if (selectedMethod == "Pay via QRIS") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrisPage(
                            title: widget.title,
                            type: widget.type,
                            duration: widget.duration,
                            price: widget.price,
                          ),
                        ),
                      );
                    } else if (selectedMethod == "Pay on Location") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(
                            title: widget.title,
                            type: widget.type,
                            duration: widget.duration,
                            price: widget.price,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.check, color: Colors.white, size: 18),
                  label: const Text(
                    "I Have Paid",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption({
    required String method,
    required String subtitle,
    required IconData icon,
  }) {
    final bool isSelected = selectedMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = method;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.black),
          ],
        ),
      ),
    );
  }
}