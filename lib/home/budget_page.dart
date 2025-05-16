import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  final List<Map<String, dynamic>> budgetsData = const [
    {
      "title": "Transport",
      "amount": "\$20,000",
      "limit": "\$850 of \$800",
      "label": "Over Budget",
      "imagePath": "assets/transport.png",
      "progress": 0.85,
    },
    {
      "title": "Housing",
      "amount": "\$20,000",
      "limit": "\$750 of \$800",
      "label": "Near Limit",
      "imagePath": "assets/house.png",
      "progress": 0.75,
    },
    {
      "title": "Shopping",
      "amount": "\$20,000",
      "limit": "\$700 of \$800",
      "label": "Near Limit",
      "imagePath": "assets/shopping.png",
      "progress": 0.70,
    },
    {
      "title": "Transport",
      "amount": "\$20,000",
      "limit": "\$850 of \$800",
      "label": "Over Budget",
      "imagePath": "assets/transport.png",
      "progress": 0.85,
    },
    {
      "title": "Housing",
      "amount": "\$20,000",
      "limit": "\$750 of \$800",
      "label": "Near Limit",
      "imagePath": "assets/house.png",
      "progress": 0.75,
    },
    {
      "title": "Shopping",
      "amount": "\$20,000",
      "limit": "\$700 of \$800",
      "label": "Near Limit",
      "imagePath": "assets/shopping.png",
      "progress": 0.70,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: commonText("Budget", context: context, size: 18, isBold: true),
        centerTitle: true,
        leading: commonBackButton(),
      ),

      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: budgetsData.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final budget = budgetsData[index];
            return _budgetItem(
              budget["title"],
              budget["amount"],
              budget["limit"],
              budget["label"],
              budget["imagePath"],
              context,
              progress: budget["progress"],
            );
          },
        ),
      ),
    );
  }

  Widget _budgetItem(
    String title,
    String amount,
    String limit,
    String label,
    String imagePath,
    BuildContext context, {
    double progress = 0.45,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.asset(imagePath),
            contentPadding: EdgeInsets.zero,
            title: commonText(
              title,
              context: context,
              size: 14,
              isBold: true,
              color: Colors.white,
            ),
            trailing: commonText(
              amount,
              context: context,
              size: 14,
              isBold: true,
              color: AppColors.whiteColour,
            ),
            subtitle: Row(
              children: [
                commonText(
                  limit,
                  context: context,
                  size: 12,
                  color: AppColors.whiteColour,
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        (label == "Over Budget")
                            ? Color(0xFFFEE2E2)
                            : Color(0xFFFEF9C3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: commonText(
                    label,
                    context: context,
                    size: 10,
                    color: Colors.red,
                    isBold: true,
                  ),
                ),
              ],
            ),
          ),

          gradientLinearProgress(0.45),
        ],
      ),
    );
  }
}
