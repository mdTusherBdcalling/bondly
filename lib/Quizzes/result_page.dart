import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  Widget _riskZoneCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: AppColors.primaryBlue),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      commonText(
                        "Your Risk Zone Results",
                        textAlign: TextAlign.center,
                        context: context,
                        size: 18,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 24),
                          commonText(
                            "Your Risk Profiles",
                            context: context,
                            size: 12,
                            textAlign: TextAlign.center,
                            color: AppColors.whiteColour,
                            isBold: true,
                          ),
                          commonText(
                            "Partner 1: Conservative",
                            context: context,
                            textAlign: TextAlign.center,
                            size: 12,
                            color: AppColors.whiteColour,
                          ),
                          commonText(
                            "Partner 2: Very Aggressive",
                            context: context,
                            textAlign: TextAlign.center,
                            size: 12,
                            color: AppColors.whiteColour,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/shape.png"),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/shape (2).png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBlock(
    BuildContext context,
    String title,
    String content, {
    bool isList = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.buttonColour,
        borderRadius: BorderRadius.circular(16),
      ),
      child:
          isList
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonText(
                    title,
                    context: context,
                    size: 18,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    isBold: true,
                  ),
                  const SizedBox(height: 8),
                  ...content
                      .split('\n')
                      .map(
                        (line) => Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "• ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Flexible(
                                child: commonText(
                                  line.trim(),
                                  context: context,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonText(
                    title,
                    context: context,
                    size: 18,
                    color: Colors.white,
                    isBold: true,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  commonText(
                    content,
                    context: context,
                    size: 14,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Result"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _riskZoneCard(context),
              _infoBlock(
                context,
                "Investment Strategy Match",
                "Your risk profiles suggest you would work\nwell with a balanced portfolio approach.",
              ),
              _infoBlock(
                context,
                "Next Steps",
                "Discuss your investment goals together\nCreate a shared investment strategy\nSet up regular portfolio reviews",
                isList: true,
              ),
              _infoBlock(
                context,
                "Not sure where to start?",
                "Tap 'Ask Bondly' to get personalized savings,\ninvesting, and goal ideas based on your Risk\nProfile",
              ),
              const SizedBox(height: 16),
              commonButton(
                context: context,
                title: "Take Quiz Again",
                onTap: () {
                  Navigator.pop(context);
                },
                width: double.infinity,
                height: 50,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.auto_awesome_sharp),
                      label: commonText(
                        "Ask Bondly to Discuss Results",
                        context: context,

                        isBold: true,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,

                        shadowColor: Colors.transparent,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(width: 2),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                      ),
                      iconAlignment: IconAlignment.end,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
