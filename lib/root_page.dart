import 'package:bondly/commonWidgets.dart';
import 'package:bondly/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bondly/home/add_new_budget_page.dart';
import 'package:bondly/home/goals_page.dart';
import 'package:bondly/home/join_account_page.dart';
import 'package:bondly/home/stock_news_page.dart';
import 'package:bondly/colors.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    JoinAccountPage(),
    AddNewBudgetPage(),
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
              SizedBox(),
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
          onTap: () => _onItemTapped(2),
          child: Image.asset("assets/navigations/center_icon.png"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
