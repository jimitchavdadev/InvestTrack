import 'dart:math';
import 'package:flutter/material.dart';

class PriceChartCard extends StatelessWidget {
  const PriceChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0d78f2);
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color green600 = Colors.green.shade600;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1Y Return',
                      style: TextStyle(fontSize: 14, color: textSecondary),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$190.00 ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                          TextSpan(
                            text: '+10.5%',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: green600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 4,
                  children: ['1D', '1W', '1M', '1Y', 'All'].map((range) {
                    final isSelected = range == '1Y';
                    return ChoiceChip(
                      label: Text(range),
                      selected: isSelected,
                      onSelected: (selected) {},
                      selectedColor: primaryColor,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      backgroundColor: const Color(0xFFe0e7ff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      showCheckmark: false,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 192,
              child: CustomPaint(painter: LineChartPainter()),
            ),
          ],
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  // A mock function to generate a list of random data points
  List<double> _generateMockData(int count) {
    final random = Random();
    return List<double>.generate(count, (index) => random.nextDouble() * 150);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final List<double> dataPoints = _generateMockData(20);
    final double maxData = dataPoints.reduce(max);
    final double minData = dataPoints.reduce(min);
    final double range = maxData - minData;
    final double stepX = size.width / (dataPoints.length - 1);
    final double stepY = size.height / range;

    // Create a path for the line graph
    Path path = Path();
    path.moveTo(0, size.height - (dataPoints.first - minData) * stepY);
    for (int i = 1; i < dataPoints.length; i++) {
      path.lineTo(stepX * i, size.height - (dataPoints[i] - minData) * stepY);
    }

    // Paint the line
    final Paint linePaint = Paint()
      ..color = const Color(0xFF0d78f2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawPath(path, linePaint);

    // Create a path for the gradient fill
    final Path fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    // Paint the gradient
    final Paint fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF0d78f2).withOpacity(0.2),
          const Color(0xFFf9f9f9).withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Return true to redraw on every hot reload
  }
}
