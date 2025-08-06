// lib/models/transaction.dart

class Transaction {
  final String date;
  final String ticker;
  final String type;
  final int quantity;
  final double price;
  final double amount;
  final double? capitalGain;

  Transaction({
    required this.date,
    required this.ticker,
    required this.type,
    required this.quantity,
    required this.price,
    required this.amount,
    this.capitalGain,
  });
}

// In a separate file (e.g., lib/services/mock_data_service.dart)

List<Transaction> mockTransactions = [
  Transaction(
    date: 'Jan 1, 2024',
    ticker: 'AAPL',
    type: 'Buy',
    quantity: 10,
    price: 150.00,
    amount: 1500.00,
  ),
  Transaction(
    date: 'Feb 15, 2024',
    ticker: 'GOOGL',
    type: 'Buy',
    quantity: 5,
    price: 1300.00,
    amount: 6500.00,
  ),
  Transaction(
    date: 'Mar 20, 2024',
    ticker: 'AAPL',
    type: 'Sell',
    quantity: 5,
    price: 180.00,
    amount: 900.00,
    capitalGain: 150.00,
  ),
  // Add more mock transactions
];
