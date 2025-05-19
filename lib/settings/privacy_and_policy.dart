import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  PrivacyPolicyPage({super.key});

  final List<_PrivacyOption> options = [
    _PrivacyOption(
      "Update Partner Email",
      "assets/settings/email.png",
      onTap: () {
        // Add navigation to Update Partner Email page
      },
    ),
    _PrivacyOption(
      "Password Change",
      "assets/settings/lock.png",
      onTap: () {
        // Add navigation to Password Change page
      },
    ),
    _PrivacyOption(
      "Delete My Account",
      "assets/settings/delete.png",
      onTap: null, // We'll handle Delete via the bottom sheet below
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Privacy and Policy"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:
              options.map((option) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      option.iconPath,
                      width: 24,
                      height: 24,
                      color: AppColors.buttonColour,
                    ),
                    title: commonText(
                      option.title,
                      context: context,
                      size: 16,
                      color: Colors.white,
                      isBold: true,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                    onTap: () {
                      if (option.title == "Delete My Account") {
                        showDeleteBottomSheet(context, () {
                          // Handle delete account/logout logic here
                          Navigator.of(
                            context,
                          ).pop(); // Close bottom sheet after action
                        });
                      } else {
                        if (option.onTap != null) option.onTap!();
                      }
                    },
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

void showDeleteBottomSheet(BuildContext context, VoidCallback onLogout) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            commonText(
              "Delete Account",
              context: context,
              size: 18,
              isBold: true,
              color: AppColors.whiteColour,
            ),
            const SizedBox(height: 12),
            commonText(
              "Are you sure you want to delete your account?",
              context: context,
              size: 14,
              color: AppColors.whiteColour,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: commonButton(
                    context: context,
                    title: "No, I do’t",
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: commonButton(
                    context: context,
                    title: "Yes, Delete",
                    bgColor: Colors.red,
                    onTap: () {
                      onLogout();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}

class _PrivacyOption {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const _PrivacyOption(this.title, this.iconPath, {this.onTap});
}
