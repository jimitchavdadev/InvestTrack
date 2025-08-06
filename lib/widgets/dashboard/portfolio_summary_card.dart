import 'package:flutter/material.dart';

class PortfolioSummaryCard extends StatelessWidget {
  const PortfolioSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color green500 = Colors.green.shade500;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Portfolio Value',
              style: TextStyle(fontSize: 14, color: textSecondary),
            ),
            const SizedBox(height: 4),
            Text(
              '\$154,321.78',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.arrow_drop_up, color: green500, size: 24),
                Text(
                  '+\$2,450.12 (1.61%)',
                  style: TextStyle(
                    color: green500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                Text('Today', style: TextStyle(color: textSecondary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
