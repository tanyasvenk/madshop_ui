import 'package:flutter/material.dart';
import 'package:madshop_ui_savenkova/screens/splash_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/password_screen.dart';
import 'screens/cart_screen.dart';
import 'theme/colors.dart';
import 'theme/text_styles.dart';

void main() {
  runApp(const MadShopApp());
}

class MadShopApp extends StatelessWidget {
  const MadShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
