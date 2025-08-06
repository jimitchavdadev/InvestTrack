import 'package:flutter/material.dart';
import 'package:investtrack/models/alert.dart';

class AlertListItem extends StatelessWidget {
  final Alert alert;

  const AlertListItem({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color primaryColor = const Color(0xFF0d78f2);

    IconData iconData;
    Color iconColor;
    Color iconBgColor;

    switch (alert.type) {
      case AlertType.priceBelow:
        iconData = Icons.arrow_downward;
        iconColor = Colors.orange.shade500;
        iconBgColor = Colors.orange.shade100;
        break;
      case AlertType.priceAbove:
        iconData = Icons.arrow_upward;
        iconColor = Colors.indigo.shade500;
        iconBgColor = Colors.indigo.shade100;
        break;
      case AlertType.percentageChange:
        iconData = Icons.trending_up;
        iconColor = Colors.cyan.shade500;
        iconBgColor = Colors.cyan.shade100;
        break;
      case AlertType.triggeredBelow:
        iconData = Icons.info_outline;
        iconColor = Colors.red.shade500;
        iconBgColor = Colors.red.shade100;
        break;
      case AlertType.triggeredAbove:
        iconData = Icons.check_circle_outline;
        iconColor = Colors.green.shade500;
        iconBgColor = Colors.green.shade100;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                  ),
                ),
                Text(
                  alert.ticker,
                  style: TextStyle(fontSize: 12, color: textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Display a status text instead of a toggle
          Text(
            alert.isActive ? 'Active' : (alert.triggeredTime ?? ''),
            style: TextStyle(fontSize: 12, color: textSecondary),
          ),
        ],
      ),
    );
  }
}
