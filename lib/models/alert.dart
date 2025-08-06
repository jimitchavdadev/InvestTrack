enum AlertType {
  priceBelow,
  priceAbove,
  percentageChange,
  triggeredBelow,
  triggeredAbove,
}

class Alert {
  final String title;
  final String ticker;
  final AlertType type;
  final bool isActive;
  final String? triggeredTime;

  Alert({
    required this.title,
    required this.ticker,
    required this.type,
    this.isActive = true,
    this.triggeredTime,
  });
}
