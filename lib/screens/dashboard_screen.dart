import 'package:flutter/material.dart';
import 'package:investtrack/screens/account_details_screen.dart'; // Import the Account Details screen
import 'package:investtrack/widgets/common/common_nav_bar.dart';
import 'package:investtrack/widgets/dashboard/asset_breakdown_card.dart';
import 'package:investtrack/widgets/dashboard/holdings_list_card.dart';
import 'package:investtrack/widgets/dashboard/portfolio_summary_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime? lastPressed;

  Future<bool> onWillPop() async {
    final now = DateTime.now();
    final difference = now.difference(lastPressed ?? DateTime(2000));
    lastPressed = now;

    if (difference >= const Duration(seconds: 2)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false; // Do not exit
    } else {
      return true; // Exit the app
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color textPrimary = const Color(0xFF111418);
    const String userProfileUrl = 'https://picsum.photos/200';

    return PopScope(
      canPop: false, // Prevent the default back button behavior
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        final now = DateTime.now();
        final difference = now.difference(lastPressed ?? DateTime(2000));
        lastPressed = now;

        if (difference >= const Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFf9f9f9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white.withOpacity(0.8),
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textPrimary,
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountDetailsScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(userProfileUrl),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none, color: textPrimary),
              onPressed: () {
                // ... navigation logic
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const PortfolioSummaryCard(),
              const SizedBox(height: 16),
              const AssetBreakdownCard(),
              const SizedBox(height: 16),
              const HoldingsListCard(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const CommonNavBar(currentIndex: 0),
      ),
    );
  }
}
