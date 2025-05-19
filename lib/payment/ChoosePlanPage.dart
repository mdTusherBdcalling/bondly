import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class ChoosePlanPage extends StatefulWidget {
  const ChoosePlanPage({Key? key}) : super(key: key);

  @override
  State<ChoosePlanPage> createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  bool isMonthly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: commonText(
                "Choose Your\nBondly Plan 💜",
                context: context,
                textAlign: TextAlign.center,
                isBold: true,
                size: 32,
              ),
            ),
            SizedBox(height: 16),
            commonText("Solo Plan", context: context, size: 18, isBold: true),
            const SizedBox(height: 16),

            // Toggle Buttons Row
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMonthly = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            isMonthly
                                ? AppColors.primaryBlueLight
                                : AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    isMonthly
                                        ? Colors.yellow
                                        : AppColors.whiteColour,
                                width: 2,
                              ),
                            ),
                            child:
                                isMonthly
                                    ? Center(
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    )
                                    : null,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText(
                                "Monthly",
                                context: context,
                                size: 16,
                                color: AppColors.whiteColour,

                                isBold: isMonthly,
                              ),
                              commonText(
                                "\$5.99",
                                context: context,
                                size: 14,
                                color: AppColors.whiteColour,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => isMonthly = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:
                            !isMonthly
                                ? AppColors.primaryBlueLight
                                : AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        !isMonthly
                                            ? Colors.yellow
                                            : AppColors.whiteColour,
                                    width: 2,
                                  ),
                                ),
                                child:
                                    !isMonthly
                                        ? Center(
                                          child: Container(
                                            width: 12,
                                            height: 12,
                                            decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        )
                                        : null,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  commonText(
                                    "Yearly",
                                    context: context,
                                    size: 16,
                                    color: AppColors.whiteColour,

                                    isBold: !isMonthly,
                                  ),
                                  commonText(
                                    "\$57.00",
                                    context: context,
                                    size: 14,
                                    color: AppColors.whiteColour,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: commonText(
                                "Save 20%",
                                context: context,
                                size: 10,
                                color: Colors.white,
                                isBold: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Features List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _FeatureItem("Goal Tracking"),
                _FeatureItem("Financial Mindset Coaching"),
                _FeatureItem("Smart Saving Tools"),
                _FeatureItem("Option to Invite a Partner Later"),
              ],
            ),

            const SizedBox(height: 24),

            commonText(
              "Emotional, intelligent support for your financial journey and you can invite a partner whenever you're ready.",
              context: context,
              size: 14,
              color: AppColors.greyColour,
            ),

            const Spacer(),

            // Start Trial Button
            commonButton(
              context: context,
              title: "Start Your Free 7-Day Trial",
              onTap: () {
                // Your onTap logic
              },
              bgColor: AppColors.buttonColour,
              fgColor: Colors.white,
              height: 50,
              borderRadius: 12,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: commonText(text, context: context, size: 14)),
        ],
      ),
    );
  }
}
