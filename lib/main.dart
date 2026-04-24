import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Library System',
      // Requirement: Set Orange Theme globally
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
        // Making the background and fields match the professional orange look
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2.0),
          ),
        ),
      ),
      initialRoute: '/',
      // Requirement 1.9: Named Routes
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
