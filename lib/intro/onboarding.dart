import 'package:bondly/auth/invite_selection_page.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Onboarding page widget
class OnboardingPage extends StatelessWidget {
  final String title;
  final List<String> bulletPoints;
  final Widget icons;
  final VoidCallback onNext;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.bulletPoints,
    required this.icons,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          const Spacer(),
          commonText(
            title,
            context: context,
            size: 22,
            isBold: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          icons,
          const SizedBox(height: 24),
          ...bulletPoints.map(
            (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: commonText(
                point,
                context: context,
                size: 14,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          commonButton(context: context, title: "Next", onTap: onNext),
        ],
      ),
    );
  }
}

// Main onboarding screen with multiple pages
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Widget> onboardingPages = [];

  @override
  void initState() {
    super.initState();

    onboardingPages.addAll([
      OnboardingPage(
        title: "Money should bring you closer.",
        bulletPoints: [
          "At Bondly, we believe shared goals lead to deeper connection — not more stress.",
        ],
        icons: Image.asset("assets/onboarding1.png"),
        onNext: () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
      OnboardingPage(
        title: "Built With Experts. Backed By Real Couples.",
        bulletPoints: [
          "Developed alongside financial therapists, relationship coaches, and fintech specialists — and inspired by the real stories of couples like you.",
        ],
        icons: Image.asset("assets/onboarding2.png"),
        onNext: () {
          _controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
      OnboardingPage(
        title: "More Than Just Budgeting",
        bulletPoints: [
          "✅ Set & track shared goals",
          "✅ Build your future — as a team",
          "✅ Understand each other’s money mindsets",
          "✅ Turn awkward convos into meaningful insights",
        ],
        icons: Image.asset("assets/onboarding3.png"),

        onNext: () {
          print("Onboarding finished");
          Get.to(
            () => InviteSelectionScreen(),
            transition: Transition.rightToLeft,
          );
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingPages.length,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) => onboardingPages[index],
        onPageChanged:
            (index) => setState(() {
              currentPage = index;
            }),
      ),
    );
  }
}
