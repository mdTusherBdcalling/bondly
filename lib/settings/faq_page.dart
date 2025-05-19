import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  // Track expanded panels
  final List<bool> _isExpandedList = List.generate(faqs.length, (_) => false);

  static const List<FAQItem> faqs = [
    FAQItem(
      question: "What is Bondly?",
      answer:
          "Bondly is an emotionally intelligent finance app designed for couples. We help you build better financial habits and better conversations—turning money talks into connection points instead of conflict triggers.",
    ),
    FAQItem(
      question:
          "How is Bondly different from other finance apps like Mint or Monarch?",
      answer: "",
    ),
    FAQItem(
      question: "Do we have to merge our bank accounts to use Bondly?",
      answer: "",
    ),
    FAQItem(question: "Is Bondly safe and secure?", answer: ""),
    FAQItem(question: "What features does Bondly offer?", answer: ""),
    FAQItem(question: "Can singles use Bondly too?", answer: ""),
    FAQItem(question: "How much does Bondly cost?", answer: ""),
    FAQItem(
      question: "Will Bondly tell my partner about my spending habits?",
      answer: "",
    ),
    FAQItem(question: "Is this financial advice?", answer: ""),
    FAQItem(question: "How do I get started?", answer: ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "FAQ"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "Frequently Asked Questions.",
              context: context,
              size: 16,

              isBold: true,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  final faq = faqs[index];
                  bool isExpanded = _isExpandedList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primaryBlue),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isExpandedList[index] = !_isExpandedList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: commonText(
                                    faq.question,
                                    context: context,
                                    size: 16,
                                    isBold: true,
                                  ),
                                ),
                                Icon(
                                  isExpanded ? Icons.remove : Icons.add,
                                  color: AppColors.blackColour,
                                ),
                              ],
                            ),
                            if (isExpanded && faq.answer.isNotEmpty) ...[
                              const SizedBox(height: 12),
                              commonText(
                                faq.answer,
                                context: context,
                                size: 14,

                                isBold: false,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  const FAQItem({required this.question, required this.answer});
}
