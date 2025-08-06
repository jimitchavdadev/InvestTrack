// lib/screens/market_screen.dart
import 'package:flutter/material.dart';
import 'package:investtrack/widgets/common/common_nav_bar.dart';
import 'package:investtrack/widgets/market/market_index_card.dart';
import 'package:investtrack/widgets/market/news_card.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  // Function to open URLs
  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);

      // Try different launch modes
      bool launched = false;

      // Try external application first
      try {
        launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (e) {
        print('External application launch failed: $e');
      }

      // If external app fails, try platform default
      if (!launched) {
        try {
          launched = await launchUrl(uri, mode: LaunchMode.platformDefault);
        } catch (e) {
          print('Platform default launch failed: $e');
        }
      }

      // If still not launched, try in-app web view
      if (!launched) {
        try {
          launched = await launchUrl(uri, mode: LaunchMode.inAppWebView);
        } catch (e) {
          print('In-app web view launch failed: $e');
        }
      }

      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open $url'),
            action: SnackBarAction(
              label: 'Copy',
              onPressed: () {
                // You can implement clipboard copy here
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening link: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    final Color textSecondary = const Color(0xFF637488);
    final Color backgroundColor = const Color(0xFFf9f9f9);
    final Color primaryColor = const Color(0xFF0d78f2);

    // Hardcoded links for Yahoo Finance
    const sp500Url = 'https://finance.yahoo.com/quote/%5EGSPC?p=%5EGSPC';
    const dowJonesUrl = 'https://finance.yahoo.com/quote/%5EDJI?p=%5EDJI';
    const nasdaqUrl = 'https://finance.yahoo.com/quote/%5EIXIC?p=%5EIXIC';

    // Hardcoded links for news articles
    const newsUrl1 = 'https://www.yahoo.com/finance/news/tech-stocks-surge';
    const newsUrl2 =
        'https://www.yahoo.com/finance/news/energy-sector-faces-challenges';
    const newsUrl3 =
        'https://www.yahoo.com/finance/news/consumer-spending-remains';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Market',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Indices',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launchURL(sp500Url),
              child: const MarketIndexCard(
                name: 'S&P 500',
                value: '5,431.60',
                change: '(+0.77%)',
                isPositive: true,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _launchURL(dowJonesUrl),
              child: const MarketIndexCard(
                name: 'Dow Jones',
                value: '39,134.76',
                change: '(+0.67%)',
                isPositive: true,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _launchURL(nasdaqUrl),
              child: const MarketIndexCard(
                name: 'Nasdaq',
                value: '17,667.56',
                change: '(+0.90%)',
                isPositive: true,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Latest News',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launchURL(newsUrl1),
              child: const NewsCard(
                headline: 'Tech Stocks Surge as AI Investments Increase',
                source: 'Tech News',
                imageUrl: 'https://picsum.photos/300/200?random=1',
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _launchURL(newsUrl2),
              child: const NewsCard(
                headline:
                    'Energy Sector Faces Challenges Amidst Policy Changes',
                source: 'Energy Today',
                imageUrl: 'https://picsum.photos/300/200?random=2',
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => _launchURL(newsUrl3),
              child: const NewsCard(
                headline: 'Consumer Spending Remains Strong Despite Inflation',
                source: 'Finance Weekly',
                imageUrl: 'https://picsum.photos/300/200?random=3',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CommonNavBar(currentIndex: 2),
    );
  }
}
