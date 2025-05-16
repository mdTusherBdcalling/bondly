import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class CoupleInviteScreen extends StatelessWidget {
  const CoupleInviteScreen({Key? key}) : super(key: key);

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
              commonBackButton(),
              const SizedBox(height: 24),

              commonText(
                "Transition to couple mode",
                context: context,
                size: 21,
                isBold: true,
              ),
              const SizedBox(height: 8),

              commonText(
                "Invite your partner to join you and access shared financial tools",
                context: context,
                size: 14,
                color: Colors.grey[700],
              ),

              SizedBox(height: 32),

              commonButton(
                context: context,
                title: "Invite Your Partner",
                onTap: () {
                  // TODO: Navigate to Invite Partner screen or action
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
