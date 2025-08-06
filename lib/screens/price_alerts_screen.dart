// lib/screens/price_alerts_screen.dart

import 'package:flutter/material.dart';
import 'package:investtrack/models/alert.dart';
import 'package:investtrack/widgets/alerts/alert_list_item.dart';
import 'package:investtrack/widgets/common/common_nav_bar.dart';

class PriceAlertsScreen extends StatelessWidget {
  PriceAlertsScreen({super.key});

  // Combined mock data for all alerts
  final List<Alert> allAlerts = [
    Alert(
      title: 'BTC price drops below \$25,000',
      ticker: 'Bitcoin',
      type: AlertType.priceBelow,
    ),
    Alert(
      title: 'ETH price rises above \$2,000',
      ticker: 'Ethereum',
      type: AlertType.priceAbove,
    ),
    Alert(
      title: 'TSLA price changes by 5%',
      ticker: 'Tesla',
      type: AlertType.percentageChange,
      isActive: true,
    ),
    Alert(
      title: 'BTC price dropped below \$25,000',
      ticker: 'Bitcoin',
      type: AlertType.triggeredBelow,
      isActive: false,
      triggeredTime: '2d ago',
    ),
    Alert(
      title: 'ETH price rose above \$2,000',
      ticker: 'Ethereum',
      type: AlertType.triggeredAbove,
      isActive: false,
      triggeredTime: '1w ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color backgroundColor = const Color(0xFFf9f9f9);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Price Alerts',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
        leading: const SizedBox(width: 48),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: allAlerts.length,
            itemBuilder: (context, index) {
              return AlertListItem(alert: allAlerts[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: const CommonNavBar(currentIndex: 1),
    );
  }
}
