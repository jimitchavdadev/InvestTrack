import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool isDatePicker;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isDatePicker = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0d78f2);
    final Color textSecondary = const Color(0xFF637488);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          keyboardType: keyboardType,
          onTap: isDatePicker ? () => _showDatePicker(context) : null,
          readOnly: isDatePicker,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey.shade400)
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xFFd1d5db)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xFFd1d5db)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: primaryColor, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    // TODO: Handle the picked date
  }
}
