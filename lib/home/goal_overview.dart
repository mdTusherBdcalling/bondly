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
  final TextEditingController amountController = TextEditingController();
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
            Expanded(
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
                              color: Colors.white,
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
                          separatorBuilder:
                              (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final activity = activities[index];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlueLight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                        Image.asset("assets/delete.png", color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: showWithdrawDialog,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.buttonColour),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: commonText(
                      "Withdraw",
                      context: context,
                      color: AppColors.buttonColour,
                      size: 16,
                      isBold: true,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: showDepositDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColour,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: commonText(
                      "Add Money",
                      context: context,
                      color: AppColors.whiteColour,
                      size: 16,
                      isBold: true,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void showWithdrawDialog() {
    amountController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return _buildAmountDialog(
          title: "Withdraw",
          actionText: "Withdraw",
          onAction: () {
            // Implement withdraw logic here
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void showDepositDialog() {
    amountController.text = '';
    showDialog(
      context: context,
      builder: (context) {
        return _buildAmountDialog(
          title: "Deposit",
          actionText: "Add",
          onAction: () {
            // Implement deposit logic here
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  Widget _buildAmountDialog({
    required String title,
    required String actionText,
    required VoidCallback onAction,
  }) {
    return Dialog(
      backgroundColor: AppColors.primaryBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                commonText(
                  title,
                  context: context,
                  size: 20,
                  isBold: true,
                  color: AppColors.whiteColour,
                ),
                const SizedBox(height: 16),
                commonTextField(
                  context: context,
                  controller: amountController,
                  hintText: "500",
                  keyboardType: TextInputType.number,
                  borderColor: AppColors.whiteColour,
                  hintTextColor: AppColors.whiteColour,
                  inputTextColor: AppColors.whiteColour,
                  title: "Amount",
                  titleColor: AppColors.whiteColour,
                  isBoldTitle: true,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: commonBorderedButton(
                        context: context,
                        title: "Cancel",
                        fgColor: AppColors.whiteColour,
                        borderColor: AppColors.whiteColour,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: commonButton(
                        context: context,
                        title: actionText,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),

            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.cancel, color: AppColors.whiteColour),
            ),
          ],
        ),
      ),
    );
  }
}
