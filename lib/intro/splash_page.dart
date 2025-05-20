import 'package:bondly/auth/login_page.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/intro/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/logo.png'),

                      commonText(
                        'Couples Finance, Reinvented.',
                        context: context,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: commonBorderedButton(
                      context: context,
                      title: 'Log In',
                      onTap: () {
                        Get.to(
                          () => LoginScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },

                      height: 50,
                      borderRadius: 12,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: commonButton(
                      context: context,
                      title: 'Get Started',
                      onTap: () {
                        Get.to(
                          () => OnboardingScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },

                      fgColor: Colors.white,
                      height: 50,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
