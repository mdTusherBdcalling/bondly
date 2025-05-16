import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class WormWelcomeScreenSolo extends StatelessWidget {
  const WormWelcomeScreenSolo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBackButton(),
              const SizedBox(height: 24),

              commonText(
                "Let’s Personalize Your Bondly Plan 💜",
                context: context,
                size: 24,
                isBold: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              commonText(
                "Answer a few quick questions so we can craft a smarter financial journey just for you.",
                context: context,
                size: 14,
                color: AppColors.greyColour,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32),

              commonButton(
                context: context,
                title: "Let’s Go",
                onTap: () {
                  // TODO: Navigate to questions or next step
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
