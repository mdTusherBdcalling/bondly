import 'package:bondly/auth/couple_page.dart';
import 'package:bondly/auth/login_page.dart';
import 'package:bondly/auth/solo_page.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class InviteSelectionScreen extends StatefulWidget {
  const InviteSelectionScreen({Key? key}) : super(key: key);

  @override
  State<InviteSelectionScreen> createState() => _InviteSelectionScreenState();
}

enum UserType { solo, couple }

class _InviteSelectionScreenState extends State<InviteSelectionScreen> {
  UserType? selectedType;

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.buttonColour;

    Widget buildUserTypeCard({
      required UserType type,
      required String title,
      required String subtitle,
      required Widget avatar,
    }) {
      final isSelected = selectedType == type;
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedType = type;
          });
          if (selectedType == UserType.solo) {
            Get.to(() => SoloScreen(), transition: Transition.rightToLeft);
          } else if (selectedType == UserType.couple) {
            Get.to(() => CoupleScreen(), transition: Transition.rightToLeft);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.grey.shade400,
              width: isSelected ? 2.5 : 1.2,
            ),
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: primaryColor.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : [],
          ),
          child: Row(
            children: [
              avatar,
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                      title,
                      context: context,
                      size: 18,
                      isBold: true,
                      color: isSelected ? primaryColor : null,
                    ),
                    const SizedBox(height: 4),
                    commonText(subtitle, context: context, size: 14),
                  ],
                ),
              ),
              Radio<UserType>(
                value: type,
                groupValue: selectedType,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedType = value;
                    });
                  }
                },
                activeColor: primaryColor,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBackButton(context: context),
              const SizedBox(height: 24),

              commonText("Sign up", context: context, size: 28, isBold: true),
              const SizedBox(height: 8),
              commonText(
                "Sign up to grow your love and wealth — together.",
                context: context,
                size: 14,
                color: Colors.grey.shade700,
              ),

              const SizedBox(height: 32),

              buildUserTypeCard(
                type: UserType.solo,
                title: "Solo",
                subtitle: "For individuals user - Can invite a partner later",
                avatar: Image.asset("assets/solo.png", fit: BoxFit.cover),
              ),

              buildUserTypeCard(
                type: UserType.couple,
                title: "Couple",
                subtitle: "For You and Your Partner",
                avatar: Image.asset("assets/couple.png", fit: BoxFit.cover),
              ),

              const Spacer(),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                      "Already have an account? ",
                      context: context,
                      size: 14,
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navigate to login screen
                        Get.to(
                          () => LoginScreen(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      child: commonText(
                        "Log In",
                        context: context,
                        size: 14,
                        color: primaryColor,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
