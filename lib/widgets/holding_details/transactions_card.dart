import 'package:flutter/material.dart';

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color green600 = Colors.green.shade600;
    final Color red600 = Colors.red.shade600;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transactions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            _buildTransactionItem(
              'Buy',
              '10 shares @ \$150.00',
              '-\$1,500.00',
              'Oct 10, 2023',
              green600,
              textSecondary,
            ),
            _buildTransactionItem(
              'Buy',
              '20 shares @ \$160.00',
              '-\$3,200.00',
              'Nov 15, 2023',
              green600,
              textSecondary,
            ),
            _buildTransactionItem(
              'Sell',
              '15 shares @ \$180.00',
              '+\$2,700.00',
              'Dec 20, 2023',
              red600,
              textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
    String type,
    String details,
    String amount,
    String date,
    Color amountColor,
    Color detailColor,
  ) {
    final Color textColor = const Color(0xFF111418);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                Text(
                  details,
                  style: TextStyle(fontSize: 14, color: detailColor),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: type == 'Buy' ? Colors.green : Colors.red,
                ),
              ),
              Text(date, style: TextStyle(fontSize: 14, color: detailColor)),
            ],
          ),
        ],
      ),
    );
  }
}
