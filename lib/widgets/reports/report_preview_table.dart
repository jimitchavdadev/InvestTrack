import 'package:flutter/material.dart';

// Mock data for the table
final List<Map<String, String>> mockTransactions = [
  {
    'date': 'Jan 1, 2024',
    'ticker': 'AAPL',
    'type': 'Buy',
    'amount': '\$150.00',
    'color': 'green',
  },
  {
    'date': 'Jan 15, 2024',
    'ticker': 'MSFT',
    'type': 'Sell',
    'amount': '\$200.00',
    'color': 'red',
  },
  {
    'date': 'Feb 1, 2024',
    'ticker': 'TSLA',
    'type': 'Buy',
    'amount': '\$120.00',
    'color': 'green',
  },
  {
    'date': 'Feb 15, 2024',
    'ticker': 'AMZN',
    'type': 'Sell',
    'amount': '\$180.00',
    'color': 'red',
  },
];

class ReportPreviewTable extends StatelessWidget {
  const ReportPreviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 16,
        dataRowMinHeight: 48,
        dataRowMaxHeight: 48,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFf9f9f9)),
        columns: const [
          DataColumn(
            label: Text(
              'Date',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF637488),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Ticker',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF637488),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Type',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF637488),
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Amount',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF637488),
              ),
            ),
          ),
        ],
        rows: mockTransactions.map((transaction) {
          final isGreen = transaction['color'] == 'green';
          return DataRow(
            cells: [
              DataCell(
                Text(
                  transaction['date']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                  ),
                ),
              ),
              DataCell(
                Text(
                  transaction['ticker']!,
                  style: TextStyle(color: textSecondary),
                ),
              ),
              DataCell(
                Text(
                  transaction['type']!,
                  style: TextStyle(color: textSecondary),
                ),
              ),
              DataCell(
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    transaction['amount']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isGreen
                          ? Colors.green.shade600
                          : Colors.red.shade600,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
