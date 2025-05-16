import 'package:bondly/colors.dart';
import 'package:bondly/commonDesign.dart';
import 'package:flutter/material.dart';

import 'package:bondly/commonWidgets.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: commonText(
          "Transactions",
          context: context,
          size: 18,
          isBold: true,
        ),
        centerTitle: true,
        leading: commonBackButton(color: Colors.transparent),
      ),
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
}
