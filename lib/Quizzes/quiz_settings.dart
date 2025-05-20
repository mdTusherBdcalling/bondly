import 'package:bondly/Quizzes/quiz_question_page.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class QuizSettingsPage extends StatefulWidget {
  const QuizSettingsPage({Key? key}) : super(key: key);

  @override
  State<QuizSettingsPage> createState() => _QuizSettingsPageState();
}

class _QuizSettingsPageState extends State<QuizSettingsPage> {
  String? selectedOption;

  final List<String> options = ["Money Vibes Check", "Your Risk Comfort Zone"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Quiz Settings"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  "Your Money Mindset",
                  context: context,
                  size: 18,
                  isBold: true,
                  color: AppColors.whiteColour.withOpacity(0.8),
                ),
                const SizedBox(height: 16),

                // Options list
                ...options.map((option) {
                  bool isSelected = selectedOption == option;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColour,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: AppColors.whiteColour,
                          ),
                          const SizedBox(width: 12),
                          commonText(
                            option,
                            context: context,
                            size: 16,
                            color: AppColors.whiteColour,
                            isBold: isSelected,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          const Spacer(),

          // Next Button
          commonButton(
            context: context,
            title: "Next",
            borderRadius: 0,
            onTap: () {
              if (selectedOption == "Money Vibes Check") {
                Get.to(
                  () => QuizQuestionPage(isPlayer2: false),
                  transition: Transition.rightToLeft,
                );
              } else if (selectedOption == "Your Risk Comfort Zone") {
                Get.to(
                  () => QuizQuestionPage(isPlayer2: false),
                  transition: Transition.rightToLeft,
                );
              } else {
                commonSnackbar(message: "Please Sellect one");
              }
            },
          ),
        ],
      ),
    );
  }
}
