// lib/widgets/common/common_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:investtrack/screens/dashboard_screen.dart';
import 'package:investtrack/screens/price_alerts_screen.dart';
import 'package:investtrack/screens/market_screen.dart';
import 'package:investtrack/screens/settings_screen.dart';

class CommonNavBar extends StatelessWidget {
  final int currentIndex;
  const CommonNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF0d78f2);
    final Color textSecondary = const Color(0xFF637488);

    void _onItemTapped(int index) {
      if (index == currentIndex) return;

      Widget screenToNavigate;
      switch (index) {
        case 0:
          screenToNavigate = const DashboardScreen();
          break;
        case 1:
          screenToNavigate = PriceAlertsScreen();
          break;
        case 2:
          screenToNavigate = const MarketScreen();
          break;
        case 3:
          screenToNavigate = const SettingsScreen();
          break;
        default:
          return;
      }

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screenToNavigate),
        (route) => route.isFirst,
      );
    }

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: textSecondary,
      backgroundColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Market'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
