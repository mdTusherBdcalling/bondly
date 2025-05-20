import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class NotificationPage extends StatelessWidget {
  final List<_NotificationItem> notifications = [
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message:
          "You're just \$50 away from hitting your 'Emergency Fund' goal! Let's keep the........",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message: "Small win: You saved 20% more than last month. Nice work.",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message:
          "Did you know automating your savings boosts success rates by 70%? Want me.........",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message:
          "Did you know automating your savings boosts success rates by 70%? Want me.........",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message:
          "Did you know automating your savings boosts success rates by 70%? Want me.........",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message:
          "Did you know automating your savings boosts success rates by 70%? Want me.........",
      timeAgo: "About 1 minutes ago",
    ),
    _NotificationItem(
      iconUrl:
          "https://static-00.iconduck.com/assets.00/rocket-icon-2048x2048-w9m68dl9.png",
      message: "Small win: You saved 20% more than last month. Nice work.",
      timeAgo: "About 1 minutes ago",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Notification"),

      body: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: notifications.length,
          separatorBuilder:
              (context, index) => Divider(color: AppColors.whiteColour),
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              padding: const EdgeInsets.all(16),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Leading icon as network image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      item.iconUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Message and timestamp
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonText(
                          item.message,
                          context: context,
                          maxline: 2,
                          size: 14,
                          color: AppColors.whiteColour,
                        ),
                        const SizedBox(height: 4),
                        commonText(
                          item.timeAgo,
                          context: context,
                          size: 12,
                          color: AppColors.greyColour,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Three dots menu icon
                  Icon(Icons.more_vert, color: AppColors.whiteColour),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NotificationItem {
  final String iconUrl;
  final String message;
  final String timeAgo;

  _NotificationItem({
    required this.iconUrl,
    required this.message,
    required this.timeAgo,
  });
}
