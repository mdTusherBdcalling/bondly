import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userRole;
  final String userImagePath; // asset path for profile image
  final VoidCallback onLogout;
  final Function(int) onMenuTap;

  CustomDrawer({
    Key? key,
    required this.userName,
    required this.userRole,
    required this.userImagePath,
    required this.onLogout,
    required this.onMenuTap,
  }) : super(key: key);

  final List<_DrawerMenuItem> menuItems = [
    _DrawerMenuItem("Profile", "assets/drawer/profile.png"),
    _DrawerMenuItem("Settings", "assets/drawer/settings.png"),
    _DrawerMenuItem("Share App", "assets/drawer/share.png"),
    _DrawerMenuItem("Rate App", "assets/drawer/rating.png"),
    _DrawerMenuItem("Help & Support", "assets/drawer/help_and_support.png"),
    _DrawerMenuItem("FAQs", "assets/drawer/faq.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryBlue, // dark purple background
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(userImagePath),
              ),
              const SizedBox(height: 12),
              commonText(
                userName,
                context: context,
                size: 18,
                isBold: true,
                color: Colors.white,
              ),
              commonText(
                userRole,
                context: context,
                size: 14,
                color: AppColors.greyColour,
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                itemCount: menuItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return InkWell(
                    onTap: () => onMenuTap(index),
                    child: Row(
                      children: [
                        Image.asset(
                          item.iconPath,
                          width: 24,
                          height: 24,
                          color: AppColors.buttonColour, // tint color
                        ),
                        const SizedBox(width: 16),
                        commonText(
                          item.title,
                          context: context,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),

              ElevatedButton.icon(
                onPressed: onLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlueLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.4, 48),
                ),
                icon: Image.asset(
                  "assets/drawer/logout.png",
                  width: 24,
                  height: 24,
                ),
                label: commonText(
                  "Log Out",
                  context: context,
                  color: Colors.white,
                  size: 16,
                  isBold: true,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerMenuItem {
  final String title;
  final String iconPath;
  _DrawerMenuItem(this.title, this.iconPath);
}
