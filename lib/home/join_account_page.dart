import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class JoinAccountPage extends StatelessWidget {
  const JoinAccountPage({super.key});

  final List<Map<String, dynamic>> contributions = const [
    {
      "title": "Car",
      "limit": "\$850 of \$800",
      "amount": "\$20,000",
      "icon": "assets/car.png",
      "progress": 0.85,
    },
    {
      "title": "Home",
      "limit": "\$850 of \$800",
      "amount": "\$8,000",
      "icon": "assets/house.png",
      "progress": 0.95,
    },
    {
      "title": "Shopping",
      "limit": "\$850 of \$800",
      "amount": "\$20,000",
      "icon": "assets/shopping.png",
      "progress": 0.85,
    },
    {
      "title": "Travel",
      "limit": "\$850 of \$800",
      "amount": "\$20,000",
      "icon": "assets/travel.png",
      "progress": 0.55,
    },
    {
      "title": "Laptop",
      "limit": "\$850 of \$800",
      "amount": "\$20,000",
      "icon": "assets/laptop.png",
      "progress": 0.85,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Join Account"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileSummary(context),
            const SizedBox(height: 20),
            _buildContributionsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSummary(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.50hKcYjp_xJu-SNX62gkAAHaNK?rs=1&pid=ImgDetMain",
                ),
                backgroundColor: Colors.transparent,
              ),
              Positioned(
                bottom: -3,
                right: 0,
                child: Image.asset("assets/basil_edit-outline.png"),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonText(
                "Ovie Rahaman",
                context: context,
                size: 20,
                isBold: true,
                color: AppColors.whiteColour,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        commonText(
                          "Total Saved",
                          context: context,
                          size: 14,
                          color: AppColors.whiteColour,
                        ),
                        commonText(
                          "\$12,000",
                          context: context,
                          size: 18,
                          isBold: true,
                          color: AppColors.whiteColour,
                        ),
                      ],
                    ),
                  ),
                  Container(width: 1, height: 56, color: AppColors.whiteColour),
                  Expanded(
                    child: Column(
                      children: [
                        commonText(
                          "Goals Completed",
                          context: context,
                          size: 14,
                          color: AppColors.whiteColour,
                        ),
                        commonText(
                          "8",
                          context: context,
                          size: 18,
                          isBold: true,
                          color: AppColors.whiteColour,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContributionsSection(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "Your Contribution",
              context: context,
              size: 16,
              isBold: true,
              color: AppColors.whiteColour,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: contributions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final contribution = contributions[index];
                  return goalCard(
                    contribution["title"],
                    contribution["limit"],
                    contribution["amount"],

                    contribution["icon"],
                    contribution["progress"],
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget goalCard(
    String title,
    String subtitle,
    String amount,
    String imagePath,
    double progress,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            minVerticalPadding: 0,
            horizontalTitleGap: 5,
            contentPadding: const EdgeInsets.all(0),
            leading: Image.asset(imagePath, color: Colors.white),
            title: commonText(
              title,
              context: context,
              size: 14,
              color: AppColors.whiteColour,
            ),
            subtitle: commonText(
              subtitle,
              context: context,
              size: 12,
              color: AppColors.whiteColour,
            ),
            trailing: commonText(
              amount,
              context: context,
              size: 18,
              color: AppColors.whiteColour,
              isBold: true,
            ),
          ),
          gradientLinearProgress(progress, height: 5),
        ],
      ),
    );
  }
}
