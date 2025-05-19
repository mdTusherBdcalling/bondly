import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class ProfileSetupPage2 extends StatefulWidget {
  const ProfileSetupPage2({super.key});

  @override
  State<ProfileSetupPage2> createState() => _ProfileSetupPage2State();
}

class _ProfileSetupPage2State extends State<ProfileSetupPage2> {
  int selectedIndex = 1;

  final List<String> options = [
    "Prepare for my future",
    "Reduce stress and feel secure",
    "Save for something important",
    "Build wealth and freedom",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Set Your Profile"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Progress bar section
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

                // Motivation question section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonText(
                        "Why? (Motivation)",
                        context: context,
                        size: 18,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 8),
                      commonText(
                        "Why do you want to improve your finances now?",
                        context: context,
                        size: 16,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 24),

                      // Answer options as radio buttons
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: options.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() => selectedIndex = index);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? AppColors.buttonColour
                                        : AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: commonText(
                                      options[index],
                                      context: context,
                                      size: 16,
                                      color: Colors.white,
                                      isBold: isSelected,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bottom CTA
          commonButton(
            context: context,
            title: "Next",
            onTap: () {
              // Go to next setup screen or complete
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
