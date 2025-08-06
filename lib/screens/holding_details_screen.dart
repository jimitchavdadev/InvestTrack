// lib/screens/holding_details_screen.dart

import 'package:flutter/material.dart';
import 'package:investtrack/widgets/holding_details/holding_summary_card.dart';
import 'package:investtrack/widgets/holding_details/action_buttons.dart';

import 'package:investtrack/widgets/holding_details/transactions_card.dart';
import 'package:investtrack/widgets/holding_details/price_chart_card.dart';

class HoldingDetailsScreen extends StatelessWidget {
  final String holdingName;

  const HoldingDetailsScreen({super.key, required this.holdingName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf9f9f9),
        elevation: 0,
        foregroundColor: const Color(0xFF111418),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          holdingName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HoldingSummaryCard(), // This will be the first card
            SizedBox(height: 16),
            PriceChartCard(), // The chart card
            SizedBox(height: 16),
            TransactionsCard(), // The transactions list
          ],
        ),
      ),
      bottomNavigationBar: const ActionButtons(),
    );
  }
}
