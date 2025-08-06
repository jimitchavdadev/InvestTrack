// lib/widgets/dashboard/holding_list_item.dart

import 'package:flutter/material.dart';
import 'package:investtrack/screens/holding_details_screen.dart';

class HoldingListItem extends StatelessWidget {
  final String name;
  final String shares;
  final String value;
  final String change;
  final Color changeColor;
  final Color textPrimary;
  final Color textSecondary;
  final BuildContext context; // Add BuildContext to the constructor

  const HoldingListItem({
    super.key,
    required this.name,
    required this.shares,
    required this.value,
    required this.change,
    required this.changeColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.context, // Make it a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HoldingDetailsScreen(holdingName: name),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
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
                      fontWeight: FontWeight.w500,
                      color: textPrimary,
                    ),
                  ),
                  Text(
                    shares,
                    style: TextStyle(fontSize: 14, color: textSecondary),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textPrimary,
                  ),
                ),
                Text(
                  change,
                  style: TextStyle(fontSize: 14, color: changeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
