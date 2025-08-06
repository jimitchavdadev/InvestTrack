import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String holdingName;
  final String currentValue;
  final String dailyChange;
  final String dailyChangePercentage;

  const SummaryCard({
    super.key,
    required this.holdingName,
    required this.currentValue,
    required this.dailyChange,
    required this.dailyChangePercentage,
  });

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color green500 = Colors.green.shade500;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              holdingName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Value',
                      style: TextStyle(fontSize: 14, color: textSecondary),
                    ),
                    Text(
                      currentValue,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: textPrimary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Today\'s Change',
                      style: TextStyle(fontSize: 14, color: textSecondary),
                    ),
                    Text(
                      '$dailyChange ($dailyChangePercentage)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: green500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
