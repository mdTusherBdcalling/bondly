import 'package:bondly/auth/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class InviteSentScreen extends StatelessWidget {
  const InviteSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.buttonColour;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBackButton(context: context),
              const SizedBox(height: 24),

              commonText(
                "Invitation sent",
                context: context,
                size: 21,
                isBold: true,
              ),
              const SizedBox(height: 8),

              commonText(
                "You've invited your partner to join the app",
                context: context,
                size: 14,
              ),
              SizedBox(height: 24),

              commonButton(
                context: context,
                title: "Done",
                onTap: () {
                  // TODO: Close or navigate to main/home screen
                  Get.to(
                    () => SignUpScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                bgColor: primaryColor,
                fgColor: Colors.white,
                height: 50,
                borderRadius: 12,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
