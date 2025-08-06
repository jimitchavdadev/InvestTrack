import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:investtrack/screens/login_screen.dart';
import 'package:investtrack/screens/dashboard_screen.dart';
import 'package:investtrack/services/auth_service.dart';
import 'package:investtrack/services/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'InvestTrack',
            theme: ThemeService.lightTheme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF0d78f2),
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeService.darkTheme,
            themeMode: themeService.themeMode,
            home: const InitialCheckScreen(),
          );
        },
      ),
    );
  }
}

class InitialCheckScreen extends StatefulWidget {
  const InitialCheckScreen({super.key});

  @override
  State<InitialCheckScreen> createState() => _InitialCheckScreenState();
}

class _InitialCheckScreenState extends State<InitialCheckScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final authService = AuthService();
    final credentials = await authService.getCredentials();
    final email = credentials['email'];

    if (mounted) {
      if (email != null) {
        // User is logged in, navigate to Dashboard
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        // No saved credentials, navigate to Login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // A simple splash screen while checking login status
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
