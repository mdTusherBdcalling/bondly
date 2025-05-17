import 'package:flutter/material.dart';
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColour,

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _buildHeader(context),
            const SizedBox(height: 16),
            _jointBalanceCard(context),
            const SizedBox(height: 24),
            _smartSuggestionCard(context),
            const SizedBox(height: 24),

            _investmentPortfolioSection(context),
            const SizedBox(height: 24),
            _goalsSection(context),
            const SizedBox(height: 24),
            _budgetSection(context),
            const SizedBox(height: 24),
            _transactionSection(context),
            const SizedBox(height: 24),
            ExpandableDateSelector(
              initialDate: selectedDate,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              isExpanded: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.whiteColour, width: 2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?rs=1&pid=ImgDetMain",
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                "Welcome Back!",
                context: context,
                size: 18,
                isBold: true,
              ),
              commonText(
                "Your Joint Dashboard",
                context: context,
                color: AppColors.greyColour,
                size: 12,
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primaryBlue,
                    ),
                    child: Center(
                      child: commonText(
                        "Sourav Das",
                        context: context,
                        size: 12,
                        color: AppColors.whiteColour,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primaryBlue,
                    ),
                    child: Center(
                      child: commonText(
                        "Jessica",
                        context: context,
                        size: 12,
                        color: AppColors.whiteColour,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            showCustomMenu(context);
          },
          child: Image.asset(
            "assets/menu.png",
            color:
                (Theme.of(context).brightness == Brightness.dark)
                    ? AppColors.buttonColour
                    : AppColors.blackColour,
          ),
        ),
      ],
    );
  }

  Widget _jointBalanceCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: AppColors.primaryBlue),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      commonText(
                        "Join Balance",
                        context: context,
                        size: 14,
                        color: AppColors.whiteColour,
                      ),

                      commonText(
                        "\$25,000.40",
                        context: context,
                        size: 24,
                        isBold: true,
                        color: AppColors.whiteColour,
                      ),

                      Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                            size: 16,
                          ),
                          commonText(
                            "2.05% this month",
                            context: context,
                            size: 12,
                            color: Colors.greenAccent,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          value: 0.75,
                          strokeWidth: 6,
                          color: Colors.red,
                          backgroundColor: AppColors.whiteColour,
                        ),
                      ),
                      commonText(
                        "75%",
                        context: context,
                        size: 12,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
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

  Widget _smartSuggestionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8B5BDF), Color(0xFF5347FF)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  "Smart Suggestion",
                  context: context,
                  size: 16,
                  isBold: true,
                  color: AppColors.whiteColour,
                ),
                SizedBox(height: 4),
                commonText(
                  "You could save \$245 this month by optimizing your subscription services.",
                  context: context,
                  size: 13,
                  color: AppColors.whiteColour,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          commonBorderedButton(
            context: context,
            title: "View Details",
            width: 100,
            height: 35,
            textSize: 12,
            fgColor: AppColors.whiteColour,
            borderColor: AppColors.whiteColour,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _investmentPortfolioSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(
          "Investment Portfolio",
          context: context,
          size: 16,
          isBold: true,
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: AppColors.primaryBlue),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _portfolioItem(
                            "Stocks",
                            "\$8,450",
                            "2.05%",
                            true,
                            "assets/stock.png",
                            context,
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: AppColors.whiteColour.withOpacity(0.7),
                          ),
                          _portfolioItem(
                            "Bonds",
                            "\$3,200",
                            "8.9%",
                            false,
                            "assets/bond.png",
                            context,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _portfolioItem(
                            "Crypto",
                            "\$8,000",
                            "2.5%",

                            true,
                            "assets/crypto.png",
                            context,
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: AppColors.whiteColour.withOpacity(0.7),
                          ),
                          _portfolioItem(
                            "Cash",
                            "\$2,450",
                            "5.5%",
                            false,
                            "assets/shoping.png",
                            context,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/shape (4).png"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset("assets/shape (3).png"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portfolioItem(
    String title,
    String value,
    String change,
    bool isriseing,
    String imagePath,
    BuildContext context,
  ) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                title,
                context: context,
                size: 14,
                color: AppColors.whiteColour,
              ),

              commonText(
                value,
                context: context,
                size: 16,
                isBold: true,
                color: AppColors.whiteColour,
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    (isriseing) ? Icons.arrow_upward : Icons.arrow_downward,
                    color: (isriseing) ? Colors.green : Colors.red,
                    size: 12,
                  ),
                  Flexible(
                    child: commonText(
                      change,
                      context: context,
                      size: 12,
                      color: AppColors.whiteColour,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _goalsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Goals", context: context, size: 16, isBold: true),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: goalCard(
                "Transport",
                "\$699",
                "assets/transport.png",
                context,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: goalCard("Housing", "\$699", "assets/home.png", context),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: goalCard("Dining", "\$699", "assets/dining.png", context),
            ),
            SizedBox(width: 12),
            Expanded(
              child: goalCard(
                "Shopping",
                "\$699",
                "assets/shoping.png",
                context,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _seeMoreButton(context),
      ],
    );
  }

  Widget _budgetSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Budget", context: context, size: 16, isBold: true),
        const SizedBox(height: 12),
        budgetItem("Car", "\$850", "\$850 of \$800", "Over Budget", context),
        const SizedBox(height: 12),
        budgetItem("House", "\$850", "\$750 of \$800", "Near Limit", context),
        const SizedBox(height: 8),
        _seeMoreButton(context),
      ],
    );
  }

  Widget _transactionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Transactions", context: context, size: 16, isBold: true),
        const SizedBox(height: 12),
        transactionItem("Car", "\$50", "12 April, 2025", context),
        const SizedBox(height: 12),
        transactionItem("House", "\$100", "20 March, 2025", context),
        const SizedBox(height: 8),
        _seeMoreButton(context),
      ],
    );
  }

  Widget _seeMoreButton(BuildContext context) {
    return commonButton(
      context: context,
      title: "See More",
      onTap: () {},
      height: 32,
    );
  }

  Widget transactionItem(
    String title,
    String amount,
    String date,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                title,
                context: context,
                size: 14,
                isBold: true,
                color: AppColors.whiteColour,
              ),
              commonText(
                date,
                context: context,
                size: 12,
                color: AppColors.whiteColour,
              ),
            ],
          ),
          commonText(
            amount,
            context: context,
            size: 14,
            color: AppColors.whiteColour,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget budgetItem(
    String title,
    String amount,
    String limit,
    String label,
    BuildContext context, {
    double progress = 0.45,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                title,
                context: context,
                size: 14,
                isBold: true,
                color: Colors.white,
              ),
              commonText(
                amount,
                context: context,
                size: 14,
                isBold: true,
                color: AppColors.whiteColour,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              commonText(
                limit,
                context: context,
                size: 12,
                color: AppColors.whiteColour,
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color:
                      (label == "Over Budget")
                          ? Color(0xFFFEE2E2)
                          : Color(0xFFFEF9C3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: commonText(
                  label,
                  context: context,
                  size: 10,
                  color: Colors.red,
                  isBold: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          gradientLinearProgress(0.45),
        ],
      ),
    );
  }

  Widget goalCard(
    String title,
    String amount,
    String imagePath,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  title,
                  context: context,
                  size: 14,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                commonText(
                  amount,
                  context: context,
                  size: 16,
                  color: Colors.white,
                  isBold: true,
                ),
                const SizedBox(height: 6),
                gradientLinearProgress(0.58, height: 5),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward_ios, color: AppColors.whiteColour, size: 16),
        ],
      ),
    );
  }
}
