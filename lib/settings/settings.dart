import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationEnabled = true;
  bool darkModeEnabled = false;

  Widget _settingsOption({
    required String title,
    required String iconPath,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryBlueLight,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              color: AppColors.buttonColour,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: commonText(
                title,
                context: context,
                size: 16,
                color: Colors.white,
                isBold: true,
              ),
            ),
            if (trailing != null) trailing,
            if (onTap != null && trailing == null)
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText("Profile", context: context, size: 16, isBold: true),
            const SizedBox(height: 12),
            _settingsOption(
              title: "Account Settings",
              iconPath: "assets/settings/account.png",
              onTap: () {
                // Navigate to Account Settings page
              },
            ),
            _settingsOption(
              title: "Notification",
              iconPath: "assets/settings/notification.png",
              trailing: Switch(
                value: notificationEnabled,
                onChanged: (val) {
                  setState(() {
                    notificationEnabled = val;
                  });
                },
                activeColor: AppColors.buttonColour,
                inactiveThumbColor: AppColors.blackColour,
                inactiveTrackColor: AppColors.whiteColour,
              ),
            ),
            _settingsOption(
              title: "Payment Method",
              iconPath: "assets/settings/payment.png",
              onTap: () {
                // Navigate to Payment Method page
              },
            ),
            _settingsOption(
              title: "Privacy & Security",
              iconPath: "assets/settings/privacy.png",
              onTap: () {
                // Navigate to Privacy & Security page
              },
            ),
            _settingsOption(
              title: "Dark Mood",
              iconPath: "assets/settings/dark_mode.png",
              trailing: Switch(
                value: darkModeEnabled,
                onChanged: (val) {
                  setState(() {
                    darkModeEnabled = val;
                  });
                },
                activeColor: AppColors.buttonColour,
                inactiveThumbColor: AppColors.blackColour,
                inactiveTrackColor: AppColors.whiteColour,
              ),
            ),
            const SizedBox(height: 24),
            commonText("More", context: context, size: 16, isBold: true),
            const SizedBox(height: 12),
            _settingsOption(
              title: "Help & Support",
              iconPath: "assets/settings/help_and_supports.png",
              onTap: () {
                // Navigate to Help & Support page
              },
            ),
            _settingsOption(
              title: "Share this app",
              iconPath: "assets/settings/share.png",
              onTap: () {
                // Share app functionality
              },
            ),
            _settingsOption(
              title: "Rate this app",
              iconPath: "assets/settings/rate.png",
              onTap: () {
                // Rate app functionality
              },
            ),
            _settingsOption(
              title: "Log Out",
              iconPath: "assets/drawer/logout.png",
              onTap: () {
                showLogoutBottomSheet(context, () {
                  // Perform logout action
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void showLogoutBottomSheet(BuildContext context, VoidCallback onLogout) {
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
                "Logout",
                context: context,
                size: 18,
                isBold: true,
                color: AppColors.whiteColour,
              ),
              const SizedBox(height: 12),
              commonText(
                "Are you sure you want to log out?",
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
                      title: "Cancel",
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: commonButton(
                      context: context,
                      title: "Yes, Log Out",
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
}
