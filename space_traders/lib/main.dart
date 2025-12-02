import 'package:flutter/material.dart';
import 'package:space_traders/services/space_trader_service.dart';
import 'package:space_traders/widgets/agent_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AgentHome());
  }
}
