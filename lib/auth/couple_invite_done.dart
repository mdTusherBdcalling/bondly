import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class CoupleInviteDoneScreen extends StatelessWidget {
  const CoupleInviteDoneScreen({Key? key}) : super(key: key);

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
                color: AppColors.greyColour,
              ),
              SizedBox(height: 24),

              commonButton(
                context: context,
                title: "Done",
                onTap: () {
                  // TODO: Close or navigate to main/home screen
                  Navigator.pop(context);
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
