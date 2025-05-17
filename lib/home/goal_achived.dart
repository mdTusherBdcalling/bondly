import 'package:bondly/commonWidgets.dart';
import 'package:flutter/material.dart';

class GoalAchivedPage extends StatelessWidget {
  const GoalAchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Payment Successful"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(child: Image.asset("assets/goal_achived.png", scale: 1.5)),
          const SizedBox(height: 32),
          Center(
            child: commonText(
              "Congratulations! You have\nachieved your car goal.💜",
              context: context,
              size: 21,
              textAlign: TextAlign.center,
              isBold: true,
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
