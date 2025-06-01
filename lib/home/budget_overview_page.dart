import 'package:flutter/material.dart';
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

class BudgetOverviewPage extends StatefulWidget {
  const BudgetOverviewPage({Key? key}) : super(key: key);

  @override
  State<BudgetOverviewPage> createState() => _BudgetOverviewPageState();
}

class _BudgetOverviewPageState extends State<BudgetOverviewPage> {
  bool isPaused = false;

  final TextEditingController amountController = TextEditingController();

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
      appBar: commonAppBar(context: context, title: "Budget Overview"),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Budget Summary Card
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
                          color: Colors.white,
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
                              SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: commonText(
                                  "Near Limit",
                                  context: context,
                                  size: 10,
                                  color: Colors.orange.shade800,
                                  isBold: true,
                                ),
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

              // Activity & History section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlueLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                      "Activity & History",
                      context: context,
                      size: 16,
                      isBold: true,
                      color: AppColors.whiteColour,
                    ),
                    const SizedBox(height: 12),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: activities.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final activity = activities[index];
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText(
                                      activity["type"] ?? "",
                                      context: context,
                                      size: 14,
                                      color: AppColors.whiteColour,
                                      isBold: true,
                                    ),
                                    commonText(
                                      activity["date"] ?? "",
                                      context: context,
                                      size: 12,
                                      color: AppColors.whiteColour,
                                    ),
                                  ],
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

                    // Pause/Resume toggle
                  ],
                ),
              ),

              const SizedBox(height: 24),
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
                      "Pause/Resume this budget",
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

              // Buttons Withdraw and Add Money
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
            ],
          ),
        ),
      ),
    );
  }
}
