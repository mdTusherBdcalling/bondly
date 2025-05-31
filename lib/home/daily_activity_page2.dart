import 'package:flutter/material.dart';
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

// Dummy spend data model
class SpendItem {
  final String title;
  final String amount;
  final String iconPath;

  SpendItem(this.title, this.amount, this.iconPath);
}

class DailyActivityPage2 extends StatefulWidget {
  const DailyActivityPage2({Key? key}) : super(key: key);

  @override
  State<DailyActivityPage2> createState() => _DailyActivityPage2State();
}

class _DailyActivityPage2State extends State<DailyActivityPage2> {
  DateTime selectedDate = DateTime.now();
  bool isCalendarExpanded = true;

  List<SpendItem> spendHistory = [
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
    SpendItem("Housing", "\$20,000", "assets/house.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Daily Check In"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandableDateSelector(
                initialDate: selectedDate,
                isExpanded: isCalendarExpanded,
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),

              const SizedBox(height: 24),

              // Spend History Title
              Align(
                alignment: Alignment.centerLeft,
                child: commonText(
                  "Spend History",
                  context: context,
                  size: 18,
                  isBold: true,
                ),
              ),

              const SizedBox(height: 12),

              // Spend history list
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: spendHistory.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = spendHistory[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(item.iconPath, width: 24, height: 24),
                        const SizedBox(width: 12),
                        commonText(
                          item.title,
                          context: context,
                          size: 16,
                          color: AppColors.whiteColour,
                          isBold: true,
                        ),
                        const Spacer(),
                        commonText(
                          item.amount,
                          context: context,
                          size: 16,
                          color: AppColors.whiteColour,
                          isBold: true,
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Add New Spend Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlueLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                        side: BorderSide(
                          width: 1,
                          color: AppColors.whiteColour,
                        ),
                      ),
                      minimumSize: Size(
                        MediaQuery.sizeOf(context).width * 0.4,
                        48,
                      ),
                    ),
                    icon: Icon(
                      Icons.add_circle,
                      color: AppColors.whiteColour,
                      size: 30,
                    ),
                    label: commonText(
                      "Add New Spend",
                      context: context,
                      color: AppColors.whiteColour,
                      size: 16,
                      isBold: true,
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
