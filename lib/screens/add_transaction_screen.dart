import 'package:flutter/material.dart';
import 'package:investtrack/widgets/add_transaction/transaction_type_toggle.dart';
import 'package:investtrack/widgets/add_transaction/custom_form_field.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0d78f2);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add Transaction',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111418),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color(0xFF637488)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TransactionTypeToggle(),
            const SizedBox(height: 24),
            Form(
              child: Column(
                children: [
                  const CustomFormField(
                    label: 'Ticker/Fund Name',
                    hintText: 'e.g. AAPL',
                    suffixIcon: Icons.search,
                  ),
                  const SizedBox(height: 16),
                  const CustomFormField(
                    label: 'Quantity',
                    hintText: '0.00',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  const CustomFormField(
                    label:
                        'Purchase Price', // This label will need to change for Sell
                    hintText: '\$0.00',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  const CustomFormField(
                    label: 'Date',
                    hintText: 'Select a date',
                    suffixIcon: Icons.calendar_today,
                    isDatePicker: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Color(0xFFd1d5db)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xFF111418)),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
