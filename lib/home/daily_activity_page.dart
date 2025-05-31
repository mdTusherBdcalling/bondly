// import 'package:flutter/material.dart';
// import 'package:bondly/commonWidgets.dart';
// import 'package:bondly/colors.dart';

// class DailyCheckInPage extends StatefulWidget {
//   const DailyCheckInPage({Key? key}) : super(key: key);

//   @override
//   State<DailyCheckInPage> createState() => _DailyCheckInPageState();
// }

// class _DailyCheckInPageState extends State<DailyCheckInPage> {
//   final TextEditingController spendAmountController = TextEditingController();
//   final TextEditingController spendOnController = TextEditingController();
//   final TextEditingController thoughtsController = TextEditingController();

//   int selectedDate = 21; // default selected date
//   int selectedFeeling = 2; // index for smiley selected (0 to 4)

//   final List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
//   final List<int> dates = [18, 19, 20, 21, 22, 23, 24];

//   final List<String> feelingIcons = [
//     "assets/temp_emoji.png",
//     // "assets/emoji_happy.png",
//     // "assets/emoji_slightly_smile.png",
//     // "assets/emoji_neutral.png",
//     // "assets/emoji_sad.png",
//     // "assets/emoji_angry.png",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: commonAppBar(context: context, title: "Daily Check In"),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Date Selector - horizontal scroll
//             buildActivityDateSelector(context, selectedDate, (date) {
//               setState(() {
//                 selectedDate = date;
//               });
//             }),
//             const SizedBox(height: 24),

//             // How are you feeling today?
//             commonText(
//               "How are you feeling today?",
//               context: context,
//               size: 16,
//               isBold: true,
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(feelingIcons.length, (index) {
//                 final isSelected = index == selectedFeeling;
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedFeeling = index;
//                     });
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border:
//                           isSelected
//                               ? Border.all(
//                                 color: AppColors.buttonColour,
//                                 width: 3,
//                               )
//                               : null,
//                     ),
//                     child: Image.asset(
//                       feelingIcons[index],
//                       width: 48,
//                       height: 48,
//                     ),
//                   ),
//                 );
//               }),
//             ),

//             const SizedBox(height: 24),

//             // Spend any money today? (optional)
//             commonTextField(
//               context: context,
//               controller: spendAmountController,
//               title: "Spend any money today?",
//               hintText: "\$",
//               optional: true,
//               keyboardType: TextInputType.number,
//             ),

//             const SizedBox(height: 16),

//             // What did you spend on? (optional)
//             commonTextField(
//               context: context,
//               controller: spendOnController,
//               title: "What did you spend on?",
//               hintText: "Housing",
//               optional: true,
//             ),

//             const SizedBox(height: 16),

//             // Any thoughts, wins, or worries today?
//             commonTextField(
//               context: context,
//               controller: thoughtsController,
//               title: "Any thoughts, wins, or worries today?",
//               hintText: "Type Here",
//               maxLines: 4,
//             ),

//             const SizedBox(height: 32),

//             commonButton(
//               context: context,
//               title: "Add Daily Activity",
//               onTap: () {
//                 // Handle submission logic
//                 // Example: validate and save
//                 print("Daily activity added");
//               },
//               bgColor: AppColors.buttonColour,
//               fgColor: Colors.white,
//               height: 50,
//               borderRadius: 12,
//               width: double.infinity,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildActivityDateSelector(
//     BuildContext context,
//     int selectedDate,
//     Function(int) onDateSelected,
//   ) {
//     return Container(
//       height: 100,
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppColors.primaryBlue,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: List.generate(days.length, (index) {
//             bool isSelected = dates[index] == selectedDate;
//             return Center(
//               child: Container(
//                 padding:
//                     isSelected
//                         ? const EdgeInsets.symmetric(
//                           vertical: 8,
//                           horizontal: 16,
//                         )
//                         : null,
//                 decoration: BoxDecoration(
//                   gradient:
//                       isSelected
//                           ? const LinearGradient(
//                             colors: [Color(0xFF703EFF), Color(0xFFEC66FE)],
//                           )
//                           : null,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     commonText(
//                       dates[index].toString(),
//                       isBold: true,
//                       size: 16,
//                       color: AppColors.whiteColour,
//                       context: context,
//                     ),
//                     const SizedBox(height: 4),
//                     commonText(
//                       days[index],
//                       context: context,
//                       size: 12,
//                       color: AppColors.whiteColour,
//                     ),
//                     if (isSelected)
//                       const Padding(
//                         padding: EdgeInsets.only(top: 6),
//                         child: CircleAvatar(
//                           radius: 3,
//                           backgroundColor: Colors.white,
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }

import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

import 'daily_activity_page2.dart';

class DailyActivityPage extends StatefulWidget {
  const DailyActivityPage({Key? key}) : super(key: key);

  @override
  State<DailyActivityPage> createState() => _DailyActivityPageState();
}

class _DailyActivityPageState extends State<DailyActivityPage> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController spendAmountController = TextEditingController();
  final TextEditingController spendOnController = TextEditingController();
  final TextEditingController thoughtsController = TextEditingController();

  int selectedFeeling = 2; // index for emoji selected (0 to 4)

  final List<String> days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
  final List<int> dates = [18, 19, 20, 21, 22, 23, 24];

  final List<String> feelingEmojis = [
    "😄", // happy
    "🙂", // slightly smiling
    "😐", // neutral
    "🙁", // sad
    "😡", // angry
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Daily Check In"),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandableDateSelector(
              initialDate: selectedDate,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
              isExpanded: true,
            ),

            const SizedBox(height: 24),

            // How are you feeling today?
            commonText(
              "How are you feeling today?",
              context: context,
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(feelingEmojis.length, (index) {
                final isSelected = index == selectedFeeling;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFeeling = index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          isSelected
                              ? Border.all(
                                color: AppColors.buttonColour,
                                width: 3,
                              )
                              : null,
                    ),
                    child: Text(
                      feelingEmojis[index],
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 24),

            // Spend any money today? (optional)
            commonTextField(
              context: context,
              controller: spendAmountController,
              title: "Spend any money today?",
              hintText: "\$",
              optional: true,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            // What did you spend on? (optional)
            commonTextField(
              context: context,
              controller: spendOnController,
              title: "What did you spend on?",
              hintText: "Housing",
              optional: true,
            ),

            const SizedBox(height: 16),

            // Any thoughts, wins, or worries today?
            commonTextField(
              context: context,
              controller: thoughtsController,
              title: "Any thoughts, wins, or worries today?",
              hintText: "Type Here",
              maxLines: 4,
            ),

            const SizedBox(height: 32),

            commonButton(
              context: context,
              title: "Add Daily Activity",
              onTap: () {
                // Handle submission logic
                print("Daily activity added");
                Get.to(DailyActivityPage2());
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
