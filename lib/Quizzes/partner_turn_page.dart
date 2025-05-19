import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:share_plus/share_plus.dart';

class PartnerTurnPage extends StatelessWidget {
  const PartnerTurnPage({super.key});

  void _shareQuiz(BuildContext context) {
    SharePlus.instance.share(
      ShareParams(text: 'check out my website https://example.com'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Quiz"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            commonButton(
              context: context,
              title: "Partner 2's Turn",
              onTap: () {},
              bgColor: AppColors.primaryBlue,
            ),
            const SizedBox(height: 32),

            commonText(
              "It’s Your Turn to Join the Fun!",
              context: context,
              size: 20,
              isBold: true,
              color: Colors.grey[700],
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            commonText(
              "Share the quiz with your partner or jump in as Player 2 and see how well you really know each other.",
              context: context,
              size: 14,
              color: Colors.grey[600],
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            InkWell(
              onTap: () => _shareQuiz(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.buttonColour,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          "assets/share (2).png",
                          height: 16, // icon size match text height
                          width: 16,
                        ),
                      ),
                      commonText(
                        "Share Quiz With Your Partner",
                        context: context,
                        size: 16,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                      commonText(
                        "   0:58 min",
                        context: context,
                        size: 12,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            commonButton(
              context: context,
              title: "Start as Player 2",
              onTap: () {
                // Navigate to quiz start or player 2 screen
              },
              height: 50,
              borderRadius: 12,
              width: double.infinity,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
