import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Payment Successful"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            // Success icon with green circles
            Spacer(),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 36),
            commonText(
              "Welcome to Bondly! 💜",
              context: context,
              size: 24,
              isBold: true,

              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            commonText(
              "You’re officially taking the first step toward a stronger, smarter financial future — whether you’re building solo or growing together with someone you love.",
              context: context,
              size: 14,
              color: AppColors.greyColour,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            commonText(
              "At Bondly, every goal, every conversation, and every plan is designed to feel simple, personal, and powerful — just like it should.",
              context: context,
              size: 14,
              color: AppColors.greyColour,
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
