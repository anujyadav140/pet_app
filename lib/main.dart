import 'package:flutter/material.dart';
import 'package:test_app/drawer_screen.dart';
import 'package:test_app/main_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            DrawerScreen(),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}
