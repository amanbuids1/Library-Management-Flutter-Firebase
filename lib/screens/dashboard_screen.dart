
// screens/dashboard_screen.dart

import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library Dashboard"),
        backgroundColor: Colors.orange,
      ),
      body: const Center(child: Text("Welcome to the Book Module!")),
    );
  }
}