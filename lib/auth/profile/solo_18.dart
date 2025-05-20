import 'package:bondly/payment/ChoosePlanPage.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

class Solo18Screen extends StatelessWidget {
  const Solo18Screen({super.key});

  final List<String> benefits = const [
    "Clarify and set personal financial goals based on what matters most to you",
    "Build consistent saving and investing habits without feeling overwhelmed",
    "Strengthen your money mindset for lasting confidence",
    "Reduce money stress with customized, emotionally smart coaching",
    "Plan for your dreams — whether it’s freedom, travel, or building wealth",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: "Set Your Profile",
        menushow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Title
            Center(
              child: commonText(
                "Your Bondly Plan Is Ready 💜",
                context: context,
                size: 22,
                isBold: true,

                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 16),

            // Subtitle
            Center(
              child: commonText(
                "Based on your answers, here’s how Bondly will help you achieve your goals and build a stronger future.",
                context: context,
                size: 14,

                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),

            // Benefits List
            ...benefits.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: commonText("✅ $item", context: context, size: 16),
              ),
            ),
            Spacer(),
            commonButton(
              context: context,
              title: "Get Started With My Plan",
              onTap: () {
                // Handle navigation
                Get.to(
                  () => ChooseSoloPlanPage(),
                  transition: Transition.rightToLeft,
                );
              },
            ),
          ],
        ),
      ),

      // Bottom CTA Button
    );
  }
}
