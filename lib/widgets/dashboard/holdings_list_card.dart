// lib/widgets/dashboard/holdings_list_card.dart

import 'package:flutter/material.dart';
import 'package:investtrack/models/holding_list_item.dart';

class HoldingsListCard extends StatelessWidget {
  const HoldingsListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color green500 = Colors.green.shade500;
    final Color red500 = Colors.red.shade500;

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
              'Holdings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            // Pass the context to each HoldingListItem widget
            HoldingListItem(
              name: 'Tech Innovators Inc.',
              shares: '100 Shares',
              value: '\$15,500.00',
              change: '+\$500.00',
              changeColor: green500,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              context: context, // Pass context here
            ),
            HoldingListItem(
              name: 'Global Energy Fund',
              shares: '50 Shares',
              value: '\$8,800.00',
              change: '-\$200.00',
              changeColor: red500,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              context: context, // Pass context here
            ),
            HoldingListItem(
              name: 'BioMed Solutions Corp.',
              shares: '200 Shares',
              value: '\$22,750.00',
              change: '+\$750.00',
              changeColor: green500,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              context: context, // Pass context here
            ),
            HoldingListItem(
              name: 'Digital Commerce Group',
              shares: '100 Shares',
              value: '\$12,300.00',
              change: '+\$300.00',
              changeColor: green500,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              context: context, // Pass context here
            ),
            HoldingListItem(
              name: 'Sustainable Resources ETF',
              shares: '50 Shares',
              value: '\$4,850.00',
              change: '-\$150.00',
              changeColor: red500,
              textPrimary: textPrimary,
              textSecondary: textSecondary,
              context: context, // Pass context here
            ),
          ],
        ),
      ),
    );
  }
}
