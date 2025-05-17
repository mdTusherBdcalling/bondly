import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';

import 'package:bondly/commonWidgets.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Transactions", context: context),

      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryBlue,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: 12,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return transactionItem("Car", "\$50", "12 April, 2025", context);
          },
        ),
      ),
    );
  }

  Widget transactionItem(
    String title,
    String amount,
    String date,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                title,
                context: context,
                size: 14,
                isBold: true,
                color: AppColors.whiteColour,
              ),
              commonText(
                date,
                context: context,
                size: 12,
                color: AppColors.whiteColour,
              ),
            ],
          ),
          commonText(
            amount,
            context: context,
            size: 14,
            color: AppColors.whiteColour,
            isBold: true,
          ),
        ],
      ),
    );
  }
}
