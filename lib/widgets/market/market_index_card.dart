import 'package:flutter/material.dart';

class MarketIndexCard extends StatelessWidget {
  final String name;
  final String value;
  final String change;
  final bool isPositive;

  const MarketIndexCard({
    super.key,
    required this.name,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color changeColor = isPositive
        ? const Color(0xFF22c55e)
        : const Color(0xFFef4444);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        value,
                        style: TextStyle(fontSize: 14, color: textSecondary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        change,
                        style: TextStyle(fontSize: 14, color: changeColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Placeholder for a mini-chart
            Container(
              width: 96,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: changeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
