import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  State<PasswordChangePage> createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isReEnterPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Password Change"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            commonTextField(
              context: context,
              controller: oldPasswordController,
              title: "Enter Your Old Password",
              isBoldTitle: true,
              hintText: "******************",
              isPassword: true,
              isPasswordVisible: isOldPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  isOldPasswordVisible = !isOldPasswordVisible;
                });
              },
              showSuffixIcon: true,
            ),
            const SizedBox(height: 16),
            commonTextField(
              context: context,
              controller: newPasswordController,
              title: "Enter a New Password",
              isPassword: true,
              hintText: "******************",
              isBoldTitle: true,
              isPasswordVisible: isNewPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  isNewPasswordVisible = !isNewPasswordVisible;
                });
              },
              showSuffixIcon: true,
            ),
            const SizedBox(height: 16),
            commonTextField(
              context: context,
              controller: reEnterPasswordController,
              title: "Re-enter Your New Password",
              isBoldTitle: true,
              hintText: "******************",
              isPassword: true,
              isPasswordVisible: isReEnterPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  isReEnterPasswordVisible = !isReEnterPasswordVisible;
                });
              },
              showSuffixIcon: true,
            ),
            const Spacer(),
            commonButton(
              context: context,
              title: "Done",
              onTap: () {
                // Handle done action here
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
