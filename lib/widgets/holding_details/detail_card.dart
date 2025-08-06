import 'package:flutter/material.dart';

// Helper widget for a single detail row
class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: textSecondary)),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// The main Details Card component
class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const DetailRow(label: 'Shares Owned', value: '100'),
            const DetailRow(label: 'Average Cost', value: '\$150.00'),
            const DetailRow(label: 'Total Cost', value: '\$15,000.00'),
            const DetailRow(label: 'Current Price', value: '\$155.00'),
            const DetailRow(label: 'Market Cap', value: '\$2.5B'),
            const DetailRow(label: 'P/E Ratio', value: '18.5'),
          ],
        ),
      ),
    );
  }
}
