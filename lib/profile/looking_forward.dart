import 'package:flutter/material.dart';

import 'package:bondly/commonWidgets.dart';

class LookingForwardScreen extends StatelessWidget {
  const LookingForwardScreen({super.key});

  final List<String> benefits = const [
    "Personalized goal tracking",
    "Financial mindset coaching",
    "Smart saving and investing tools",
    "Building habits for lasting freedom",
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
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Heading
            Center(
              child: commonText(
                "Here’s What You Can Look\nForward To",
                context: context,
                size: 22,
                isBold: true,
                color: Colors.grey.shade800,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 32),

            // Benefits list
            ...benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: commonText("✅ $benefit", context: context, size: 16),
              ),
            ),
            Spacer(),
            commonButton(
              context: context,
              title: "See My Plan",
              onTap: () {
                // Navigate to the plan page
              },
              height: 50,
              width: double.infinity,
            ),
          ],
        ),
      ),

      // Bottom button
    );
  }
}
