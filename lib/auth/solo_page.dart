import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class SoloScreen extends StatelessWidget {
  const SoloScreen({Key? key}) : super(key: key);

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

              commonText("Welcome", context: context, size: 21, isBold: true),
              const SizedBox(height: 8),

              commonText(
                "Build healthy money habits now—so when love comes, you're ready to thrive together",
                context: context,
                size: 14,
                color: AppColors.greyColour,
              ),
              SizedBox(height: 16),

              commonButton(
                context: context,
                title: "Invite Your Partner",
                onTap: () {
                  // TODO: Navigate to Invite Partner screen
                },
                bgColor: primaryColor,
                fgColor: Colors.white,
                height: 50,
                borderRadius: 12,
                width: double.infinity,
              ),

              const SizedBox(height: 16),

              OutlinedButton(
                onPressed: () {
                  // TODO: Skip action
                },
                child: commonText(
                  "Skip",
                  context: context,
                  size: 16,
                  isBold: true,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: BorderSide(color: Colors.grey.shade700, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
