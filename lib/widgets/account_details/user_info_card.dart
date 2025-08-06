import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  Widget _buildTextField({
    required String label,
    required String value,
    bool isReadOnly = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final Color textSecondary = const Color(0xFF637488);
    final Color inputBackground = const Color(0xFFf3f4f6);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textSecondary,
            ),
          ),
        ),
        TextFormField(
          initialValue: value,
          readOnly: isReadOnly,
          keyboardType: keyboardType,
          style: TextStyle(
            color: isReadOnly ? textSecondary : const Color(0xFF111418),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: isReadOnly ? Colors.grey.shade200 : inputBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(label: 'Full name', value: 'Sophia Carter'),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Phone number',
              value: '(123) 456-7890',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Email',
              value: 'sophia.carter@email.com',
              isReadOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
