import 'package:flutter/material.dart';

class HoldingSummaryCard extends StatelessWidget {
  const HoldingSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textSecondary = const Color(0xFF637488);
    final Color green600 = Colors.green.shade600;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.5, // Adjusts the height of the grid items
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildSummaryItem('Quantity', '100', textSecondary),
            _buildSummaryItem('Avg. Cost', '\$175.00', textSecondary),
            _buildSummaryItem('Market Price', '\$190.00', textSecondary),
            _buildSummaryItem(
              'P/L',
              '+\$1,500.00',
              textSecondary,
              valueColor: green600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
    String label,
    String value,
    Color labelColor, {
    Color? valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: labelColor)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: valueColor ?? const Color(0xFF111418),
          ),
        ),
      ],
    );
  }
}
