
import 'dart:async';

import 'package:flutter/material.dart';

import '../references/reference.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navyColor,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF030B16),
              Color(0xFF0A2038),
              Color(0xFF103B5C),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Logo with subtle glow
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.035),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: const Color(0xFF35B7F3)
                        .withValues(alpha: 0.18),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF168FE5)
                          .withValues(alpha: 0.10),
                      blurRadius: 35,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.work_rounded,
                      size: 100,
                      color: Color(0xFF35B7F3),
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),

              // Tagline
              const Text(
                'YOUR CAREER. YOUR FUTURE.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Discover opportunities. Connect with employers. '
                      'Take the next step in your career.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFB5C8D9),
                    fontSize: 14,
                    height: 1.7,
                    letterSpacing: 0.2,
                  ),
                ),
              ),

              const Spacer(flex: 3),

              // Loading section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      height: 28,
                      width: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF35B7F3),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      'Preparing your experience...',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified_rounded,
                    color: Color(0xFF35B7F3),
                    size: 15,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'YOUR NEXT OPPORTUNITY STARTS HERE',
                    style: TextStyle(
                      color: Color(0xFF8DA9C0),
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
