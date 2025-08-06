import 'package:flutter/material.dart';

class AssetListItem extends StatelessWidget {
  final String name;
  final String percentage;
  final Color color;
  final Color textPrimary;

  const AssetListItem({
    super.key,
    required this.name,
    required this.percentage,
    required this.color,
    required this.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
              const SizedBox(width: 8),
              Text(name, style: TextStyle(fontSize: 16, color: textPrimary)),
            ],
          ),
          Text(percentage, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
