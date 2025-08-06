import 'package:flutter/material.dart';

class TransactionTypeToggle extends StatefulWidget {
  const TransactionTypeToggle({super.key});

  @override
  State<TransactionTypeToggle> createState() => _TransactionTypeToggleState();
}

class _TransactionTypeToggleState extends State<TransactionTypeToggle> {
  String _selectedType = 'Buy';

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0d78f2);
    final Color secondaryColor = const Color(0xFFf0f2f4);
    final Color textSecondary = const Color(0xFF637488);

    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: ['Buy', 'Sell'].map((type) {
          final isSelected = _selectedType == type;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedType = type;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : secondaryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    type,
                    style: TextStyle(
                      color: isSelected ? primaryColor : textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
