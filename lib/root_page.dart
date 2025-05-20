import 'package:bondly/Quizzes/quiz_settings.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/home/chat_page.dart';
import 'package:bondly/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bondly/home/goals_page.dart';
import 'package:bondly/home/stock_news_page.dart';
import 'package:bondly/colors.dart';
import 'package:get/get.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    QuizSettingsPage(),
    SizedBox(),
    GoalsPage(),
    StockNewsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem(String assetPath, String label, int index) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              assetPath,
              color:
                  isSelected ? AppColors.buttonColour : AppColors.blackColour,
            ),
            const SizedBox(height: 4),
            commonText(
              label,
              context: context,
              size: 10,
              textAlign: TextAlign.center,
              isBold: isSelected,
              color:
                  isSelected ? AppColors.buttonColour : AppColors.blackColour,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void showAskBondlyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.buttonColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/massege.png"),
                          commonText(
                            "  Ask Bondly",
                            context: context,
                            size: 20,
                            isBold: true,
                            color: AppColors.whiteColour,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.whiteColour,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  commonText(
                    "Get personalized money advice and conversation tips, anytime",
                    context: context,
                    size: 16,
                    isBold: true,
                    color: AppColors.whiteColour,
                  ),
                  const SizedBox(height: 12),

                  commonText(
                    "Not sure how to start a money conversation? Need help setting a goal, splitting savings, or getting back on track together?",
                    context: context,
                    size: 14,
                    color: AppColors.whiteColour,
                  ),
                  const SizedBox(height: 16),

                  commonText(
                    "Example questions you can ask:",
                    context: context,
                    size: 16,
                    isBold: true,
                    color: AppColors.whiteColour,
                  ),
                  const SizedBox(height: 8),

                  ...[
                    "How do I bring up budgeting without causing a fight?",
                    "What's a fair way to split savings for our trip?",
                    "We missed a goal - how do we reset without blaming each other?",
                    "What's a simple way to start saving together?",
                  ].map(
                    (q) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(color: AppColors.whiteColour),
                          ),
                          Expanded(
                            child: commonText(
                              q,
                              context: context,
                              size: 14,
                              color: AppColors.whiteColour,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  commonText(
                    "Bondly is here to help you reframe tricky conversations, create shared goals, and strengthen your financial connection - every step of the way.",
                    context: context,
                    size: 14,
                    color: AppColors.whiteColour,
                  ),
                  const SizedBox(height: 24),

                  Center(
                    child: commonButton(
                      context: context,
                      title: "Ask Bondly Now ➔",
                      onTap: () {
                        Navigator.of(context).pop();
                        Get.to(
                          () => AiChatPage(),
                          transition: Transition.rightToLeft,
                        );
                      },
                      height: 50,
                      width: double.infinity,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: AppColors.whiteColour,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("assets/navigations/home.png", "Homes", 0),
              _buildNavItem("assets/navigations/quizzes.png", "Quizzes", 1),
              SizedBox(width: 70), // Leave space for center button
              _buildNavItem("assets/navigations/target.png", "Goals", 3),
              _buildNavItem(
                "assets/navigations/stock_market_news.png",
                "Stock Market News",
                4,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showAskBondlyDialog(context); // Show dialog on center button tap
          },
          child: Image.asset("assets/navigations/center_icon.png"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: false,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
