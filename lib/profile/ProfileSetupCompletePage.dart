import 'package:flutter/material.dart';
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

class ProfileSetupCompletePage extends StatelessWidget {
  const ProfileSetupCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText(
          "Set Your Profile",
          context: context,
          size: 18,
          isBold: true,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress box
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonText(
                            "Progress",
                            context: context,
                            size: 18,
                            isBold: true,
                            color: AppColors.whiteColour,
                          ),
                          commonText(
                            "100%/100%",
                            context: context,
                            size: 14,
                            color: AppColors.whiteColour,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      gradientLinearProgress(1.0),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Message box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: commonText(
                    "Bondly users see a 76% improvement\nin financial habits within the first 90 days.",
                    context: context,
                    textAlign: TextAlign.center,
                    size: 18,
                    isBold: true,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Bottom button
          commonButton(
            context: context,
            title: "Next",
            onTap: () {
              // Navigate to next page or home
            },
            height: 50,
            borderRadius: 0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
