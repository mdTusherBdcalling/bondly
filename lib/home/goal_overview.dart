import 'package:flutter/material.dart';
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

class GoalOverviewPage extends StatefulWidget {
  const GoalOverviewPage({Key? key}) : super(key: key);

  @override
  State<GoalOverviewPage> createState() => _GoalOverviewPageState();
}

class _GoalOverviewPageState extends State<GoalOverviewPage> {
  bool isPaused = false;

  // Sample activity data
  final List<Map<String, String>> activities = [
    {"type": "Deposit", "date": "14 April, 2024", "amount": "\$5,000"},
    {"type": "Withdrawal", "date": "19 April, 2024", "amount": "\$2,000"},
    {"type": "Deposit", "date": "20 April, 2024", "amount": "\$3,000"},
    {"type": "Deposit", "date": "24 April, 2024", "amount": "\$11,000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Goal Overview"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Goal Summary Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/large_car.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                              "Travel",
                              context: context,
                              size: 14,
                              color: AppColors.whiteColour,
                              isBold: true,
                            ),
                            commonText(
                              "\$750 of \$800",
                              context: context,
                              size: 12,
                              color: AppColors.whiteColour,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          commonText(
                            "Target Amount",
                            context: context,
                            color: AppColors.whiteColour,
                            size: 10,
                          ),

                          commonText(
                            "\$20,000",
                            context: context,
                            size: 18,
                            color: AppColors.whiteColour,
                            isBold: true,
                          ),
                          SizedBox(height: 8),
                          commonText(
                            "\$17,000 left",
                            context: context,
                            color: AppColors.whiteColour,
                            size: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  gradientLinearProgress(0.6, height: 8),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // History Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText(
                    "History",
                    context: context,
                    size: 16,
                    color: AppColors.whiteColour,
                    isBold: true,
                  ),
                  const SizedBox(height: 12),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: activities.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final activity = activities[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlueLight,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: commonText(
                                activity["date"] ?? "",
                                context: context,
                                size: 12,
                                color: AppColors.whiteColour,
                              ),
                            ),
                            commonText(
                              activity["amount"] ?? "",
                              context: context,
                              size: 14,
                              color: AppColors.whiteColour,
                              isBold: true,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Pause/Resume Toggle
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                    "Pause/Resume this Goal",
                    context: context,
                    size: 14,
                    color: AppColors.whiteColour,
                  ),
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      child: Switch(
                        value: isPaused,
                        onChanged: (val) {
                          setState(() {
                            isPaused = val;
                          });
                        },
                        splashRadius: 0,
                        inactiveThumbColor: AppColors.blackColour,
                        inactiveTrackColor: AppColors.whiteColour,
                        activeColor: AppColors.buttonColour,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Delete Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                    "Delete this Goal",
                    context: context,
                    size: 14,
                    color: AppColors.whiteColour,
                  ),
                  Image.asset("assets/delete.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
