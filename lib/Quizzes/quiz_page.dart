import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({Key? key}) : super(key: key);

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1; // -1 means no selection

  final List<Map<String, dynamic>> quizData = [
    {
      "question":
          "What is the recommended percentage of your income to save each month?",
      "answers": ["A. 5%", "B. 10%", "C. 20%", "D. 30%"],
    },
    {
      "question": "How often should you review your financial plan?",
      "answers": ["A. Weekly", "B. Monthly", "C. Annually", "D. Never"],
    },
    {
      "question": "What is a good emergency fund amount?",
      "answers": [
        "A. 1 month salary",
        "B. 3-6 months salary",
        "C. 1 year salary",
        "D. None",
      ],
    },
    // Add up to 10 questions here
    {
      "question": "What is a common budgeting method?",
      "answers": ["A. 50/30/20", "B. 30/40/30", "C. 20/40/40", "D. 40/40/20"],
    },
    {
      "question": "What type of account is best for short term savings?",
      "answers": [
        "A. Checking",
        "B. Savings",
        "C. Retirement",
        "D. Investment",
      ],
    },
    {
      "question": "What is compound interest?",
      "answers": [
        "A. Interest on principal only",
        "B. Interest on interest",
        "C. Simple interest",
        "D. None",
      ],
    },
    {
      "question": "What is the benefit of diversification?",
      "answers": [
        "A. Reduce risk",
        "B. Increase risk",
        "C. No effect",
        "D. Increase losses",
      ],
    },
    {
      "question": "Which investment is the safest?",
      "answers": [
        "A. Stocks",
        "B. Bonds",
        "C. Savings account",
        "D. Cryptocurrency",
      ],
    },
    {
      "question": "What does ROI stand for?",
      "answers": [
        "A. Return on Investment",
        "B. Rate of Interest",
        "C. Return on Income",
        "D. Rate of Inflation",
      ],
    },
    {
      "question": "What is the best way to pay off debt?",
      "answers": [
        "A. Pay minimum",
        "B. Pay highest interest first",
        "C. Ignore it",
        "D. Take new loans",
      ],
    },
  ];

  void nextQuestion() {
    if (selectedAnswerIndex == -1) {
      // Optionally show a message to select an answer
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select an answer before continuing"),
        ),
      );
      return;
    }

    if (currentQuestionIndex < quizData.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = -1; // Reset selection for new question
      });
    } else {
      // Quiz complete - handle completion here (e.g., navigate or show summary)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Quiz completed!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionData = quizData[currentQuestionIndex];

    return Scaffold(
      appBar: commonAppBar(context: context, title: "Quiz"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Question progress container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                        "Question ${currentQuestionIndex + 1} of ${quizData.length}",
                        context: context,
                        size: 18,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 8),
                      gradientLinearProgress(
                        (currentQuestionIndex + 1) / quizData.length,
                        height: 8,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Question text container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText(
                        questionData["question"],
                        context: context,
                        size: 16,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                      const SizedBox(height: 20),

                      // Answers list
                      ...List.generate(questionData["answers"].length, (index) {
                        bool isSelected = selectedAnswerIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswerIndex = index;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.buttonColour
                                      : AppColors.primaryBlue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: commonText(
                              questionData["answers"][index],
                              context: context,
                              size: 16,
                              color: Colors.white,
                              isBold: isSelected,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),

          // Next button
          commonButton(
            context: context,
            title: "Next",
            onTap: nextQuestion,
            height: 50,
            borderRadius: 0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
