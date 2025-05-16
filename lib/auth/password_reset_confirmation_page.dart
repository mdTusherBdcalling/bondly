import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class PasswordResetConfirmationScreen extends StatelessWidget {
  const PasswordResetConfirmationScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 48),

              commonText(
                "Password reset",
                context: context,
                size: 28,
                isBold: true,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 16),

              commonText(
                "Your password has been successfully reset. click confirm to set a new password",
                context: context,
                size: 14,
                color: AppColors.greyColour,
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 32),

              commonButton(
                context: context,
                title: "Confirm",
                onTap: () {
                  // TODO: Navigate to set new password screen
                },

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
