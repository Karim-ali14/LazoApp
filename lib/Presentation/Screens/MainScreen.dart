import 'package:flutter/cupertino.dart';
import 'package:lazo_provider/Presentation/Screens/MainScreenNavHost.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const MainScreenNavHost();
  }
}