import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:flutter/material.dart';

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

Widget budgetItem(
  String title,
  String amount,
  String limit,
  String label,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonText(
              title,
              context: context,
              size: 14,
              isBold: true,
              color: Colors.white,
            ),
            commonText(
              amount,
              context: context,
              size: 14,
              isBold: true,
              color: AppColors.whiteColour,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            commonText(
              limit,
              context: context,
              size: 12,
              color: AppColors.whiteColour,
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
        const SizedBox(height: 6),
        gradientLinearProgress(0.45),
      ],
    ),
  );
}

Widget goalCard(
  String title,
  String amount,
  String imagePath,
  BuildContext context,
) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.primaryBlueLight,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                title,
                context: context,
                size: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 6),
              commonText(
                amount,
                context: context,
                size: 16,
                color: Colors.white,
                isBold: true,
              ),
              const SizedBox(height: 6),
              gradientLinearProgress(0.58, height: 5),
            ],
          ),
        ),
        SizedBox(width: 8),
        Icon(Icons.arrow_forward_ios, color: AppColors.whiteColour, size: 16),
      ],
    ),
  );
}
