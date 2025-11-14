import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madshop_ui_savenkova/screens/registration_screen.dart';
import '../theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;
  Timer? _navTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fade = CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.7, curve: Curves.easeInOut));
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _controller.reverse();
    });

    _navTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
      );
    });
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final size = screenWidth * 0.6 > 330 ? 330.0 : screenWidth * 0.6;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: size * 0.5,
                height: size * 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
