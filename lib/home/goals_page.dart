import 'package:bondly/colors.dart';
import 'package:bondly/home/add_new_goal_page.dart';
import 'package:bondly/home/goal_overview.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  // Sample dynamic data list for goals
  final List<Map<String, dynamic>> goalsData = const [
    {
      "title": "Transport",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/car.png",
      "progress": 0.58,
    },
    {
      "title": "Housing",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/house.png",
      "progress": 0.65,
    },
    {
      "title": "Shopping",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/shopping.png",
      "progress": 0.42,
    },
    {
      "title": "Transport",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/car.png",
      "progress": 0.58,
    },
    {
      "title": "Housing",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/house.png",
      "progress": 0.65,
    },
    {
      "title": "Shopping",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/shopping.png",
      "progress": 0.42,
    },
    {
      "title": "Transport",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/car.png",
      "progress": 0.58,
    },
    {
      "title": "Housing",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/house.png",
      "progress": 0.65,
    },
    {
      "title": "Shopping",
      "subtitle": "\$850 of \$800",
      "amount": "\$699",
      "imagePath": "assets/shopping.png",
      "progress": 0.42,
    },
    // Add more items here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Goals"),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: goalsData.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final goal = goalsData[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => GoalOverviewPage(),
                      transition: Transition.rightToLeft,
                    );
                  },
                  child: _goalCard(
                    goal["title"],
                    goal["subtitle"],
                    goal["amount"],
                    goal["imagePath"],
                    goal["progress"],
                    context,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.to(
                    () => AddNewGoalPage(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.primaryBlue,
                    border: Border.all(width: 1, color: AppColors.whiteColour),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_circle, color: AppColors.whiteColour),
                      commonText(
                        "Add New Goals",
                        context: context,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _goalCard(
    String title,
    String subtitle,
    String amount,
    String imagePath,
    double progress,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
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
            leading: Image.asset(imagePath),
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
