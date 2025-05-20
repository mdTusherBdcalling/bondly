import 'package:bondly/auth/profile/profilesetup_2.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  int selectedIndex = 1;

  final List<String> options = [
    "Yes, I'm working on them",
    "I have ideas but no clear plan",
    "Not yet",
    "I don't know where to start",
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
                // Progress bar container
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
                            "50%/100%",
                            context: context,
                            size: 14,
                            color: AppColors.whiteColour,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      gradientLinearProgress(0.5),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Question container
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
                        "Have You... (Goal Check)",
                        context: context,
                        size: 18,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 8),
                      commonText(
                        "Have you set personal financial goals recently?",
                        context: context,
                        size: 16,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 24),

                      // Radio list options
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: options.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
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
          Spacer(),

          // Next button
          commonButton(
            context: context,
            title: "Next",
            onTap: () {
              // Handle next step
              Get.to(
                () => ProfileSetupPage2(),
                transition: Transition.rightToLeft,
              );
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
