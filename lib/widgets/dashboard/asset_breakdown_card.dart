// lib/widgets/dashboard/asset_breakdown_card.dart

import 'package:flutter/material.dart';
import 'package:investtrack/models/asset_list_item.dart'; // <-- Add this import

class AssetBreakdownCard extends StatelessWidget {
  const AssetBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);

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
              'Asset Breakdown',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 192,
                height: 192,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 192,
                      height: 192,
                      child: CircularProgressIndicator(
                        value: 0.95,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue.shade500,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 192,
                      height: 192,
                      child: CircularProgressIndicator(
                        value: 0.35,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green.shade500,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(
                      width: 192,
                      height: 192,
                      child: CircularProgressIndicator(
                        value: 0.10,
                        strokeWidth: 10,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.yellow.shade500,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$154k',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                          ),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(fontSize: 14, color: textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Now you can use the AssetListItem widget directly
            AssetListItem(
              name: 'Stocks',
              percentage: '60%',
              color: Colors.blue.shade500,
              textPrimary: textPrimary,
            ),
            AssetListItem(
              name: 'ETFs',
              percentage: '25%',
              color: Colors.green.shade500,
              textPrimary: textPrimary,
            ),
            AssetListItem(
              name: 'Crypto',
              percentage: '10%',
              color: Colors.yellow.shade500,
              textPrimary: textPrimary,
            ),
            AssetListItem(
              name: 'Cash',
              percentage: '5%',
              color: Colors.grey.shade300,
              textPrimary: textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
