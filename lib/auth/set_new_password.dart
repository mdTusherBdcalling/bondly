import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = AppColors.buttonColour;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBackButton(),
              const SizedBox(height: 24),

              // Title and subtitle
              commonText(
                "Set a new password",
                context: context,
                size: 28,
                isBold: true,
              ),
              const SizedBox(height: 8),
              commonText(
                "Create a new password. Ensure it differs from previous ones for security",
                context: context,
                size: 14,
                color: AppColors.greyColour,
                isBold: true,
              ),
              const SizedBox(height: 32),

              // Password field label and field
              commonText("Password", context: context, size: 14, isBold: true),
              const SizedBox(height: 8),
              commonTextField(
                context: context,
                controller: passwordController,
                hintText: "Enter your new password",
                isPassword: true,
                isPasswordVisible: isPasswordVisible,
                togglePasswordVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                showSuffixIcon: true,
              ),
              const SizedBox(height: 16),

              // Confirm password field label and field
              commonText(
                "Confirm Password",
                context: context,
                size: 14,
                isBold: true,
              ),
              const SizedBox(height: 8),
              commonTextField(
                context: context,
                controller: confirmPasswordController,
                hintText: "Re-enter password",
                isPassword: true,
                isPasswordVisible: isConfirmPasswordVisible,
                togglePasswordVisibility: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
                showSuffixIcon: true,
              ),
              const SizedBox(height: 32),

              // Update Password button
              commonButton(
                context: context,
                title: "Update Password",
                onTap: () {
                  if (passwordController.text.isEmpty ||
                      confirmPasswordController.text.isEmpty) {
                    commonSnackbar(
                      title: "Empty Fields",
                      message: "Please fill in all password fields.",
                      backgroundColor: primaryColor,
                      textColor: Colors.white,
                      icon: Icons.warning_amber_rounded,
                    );

                    return;
                  }
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    commonSnackbar(
                      title: "Password Mismatch",
                      message: "Passwords do not match.",
                      backgroundColor: Colors.red.shade700,
                      textColor: Colors.white,
                      icon: Icons.error,
                    );

                    return;
                  }

                  // TODO: Call update password API here

                  print("Password updated successfully.");
                },
                bgColor: primaryColor,
                fgColor: Colors.white,
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
