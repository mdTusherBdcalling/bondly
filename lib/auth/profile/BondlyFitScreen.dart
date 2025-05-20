import 'package:bondly/auth/profile/looking_forward.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

class BondlyFitScreen extends StatelessWidget {
  const BondlyFitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: "Set Your Profile",
        menushow: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Main Heading
                Center(
                  child: commonText(
                    "Bondly Is a Great Fit for You 💜",
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
                    "We’re ready to help you crush your goals, reduce stress, and feel confident about your future.",
                    context: context,
                    size: 16,

                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          commonButton(
            context: context,
            title: "Next",
            onTap: () {
              // Go to next screen
              Get.to(
                () => LookingForwardScreen(),
                transition: Transition.rightToLeft,
              );
            },
            height: 50,
            borderRadius: 0,
            width: double.infinity,
          ),
        ],
      ),

      // Bottom CTA
    );
  }
}
