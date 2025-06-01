import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class AddNewGoalPage extends StatefulWidget {
  const AddNewGoalPage({super.key});

  @override
  State<AddNewGoalPage> createState() => _AddNewGoalPageState();
}

class _AddNewGoalPageState extends State<AddNewGoalPage> {
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController targetAmountController = TextEditingController();
  final TextEditingController startingAmountController =
      TextEditingController();

  String selectedGoalIcon = "assets/house.png";

  // Optional: You can create a map of goal names to icons for selection or logic later

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Add New Goal"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonTextField(
                context: context,
                controller: goalNameController,
                hintText: "Home",
                title: "Goal Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset("assets/house.png", color: Colors.white),
                ),
                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                titleColor: AppColors.whiteColour,

                // For icon inside the field, you may customize the TextField decoration with prefixIcon but for now this matches your style
              ),
              const SizedBox(height: 16),
              commonTextField(
                context: context,
                controller: targetAmountController,
                hintText: "20,000",
                title: "Target Amount",

                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                titleColor: AppColors.whiteColour,
                keyboardType: TextInputType.number,
                suffixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.whiteColour,
                ),

                // You can add suffix widget if needed for "$" sign by further customizing your commonTextField
              ),
              const SizedBox(height: 16),
              commonTextField(
                context: context,
                controller: startingAmountController,
                hintText: "500",
                title: "Starting Amount",

                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                suffixIcon: Icon(
                  Icons.attach_money,
                  color: AppColors.whiteColour,
                ),
                titleColor: AppColors.whiteColour,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 32),
              commonButton(
                context: context,
                title: "Create Goal",
                onTap: () {
                  // TODO: Add creation logic here
                  final goalName = goalNameController.text.trim();
                  final targetAmount = targetAmountController.text.trim();
                  final startingAmount = startingAmountController.text.trim();

                  if (goalName.isEmpty ||
                      targetAmount.isEmpty ||
                      startingAmount.isEmpty) {
                    commonSnackbar(
                      title: "Missing Fields",
                      message: "Please fill all fields",
                      backgroundColor: AppColors.buttonColour,
                      textColor: AppColors.whiteColour,
                      icon: Icons.warning_amber_rounded,
                    );
                    return;
                  }

                  // Proceed with goal creation
                  print(
                    "Create goal: $goalName, target: $targetAmount, start: $startingAmount",
                  );
                },
                bgColor: AppColors.buttonColour,
                fgColor: AppColors.whiteColour,
                height: 50,
                borderRadius: 12,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
