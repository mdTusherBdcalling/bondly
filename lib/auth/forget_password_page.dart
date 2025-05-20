import 'package:bondly/auth/check_email_page.dart';
import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonBackButton(context: context),
              const SizedBox(height: 24),

              // Title and subtitle
              commonText(
                "Forgot password",
                context: context,
                size: 28,
                isBold: true,
              ),
              const SizedBox(height: 8),
              commonText(
                "Please enter your email to reset the password",
                context: context,
                size: 14,
              ),
              const SizedBox(height: 32),

              // Email label and text field
              commonText(
                "Your Email",
                context: context,
                size: 14,
                isBold: true,
              ),
              const SizedBox(height: 8),
              commonTextField(
                context: context,
                controller: emailController,
                hintText: "contact@dscodetech.com",
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
              ),
              const SizedBox(height: 24),

              // Reset Password button
              commonButton(
                context: context,
                title: "Reset Password",
                onTap: () {
                  if (emailController.text.isEmpty) {
                    commonSnackbar(
                      title: "Empty Field",
                      message: "Please enter your email.",
                      backgroundColor: AppColors.buttonColour,
                      textColor: Colors.white,
                      icon: Icons.warning_amber_rounded,
                    );

                    return;
                  }

                  print(
                    "Reset password requested for: ${emailController.text}",
                  );

                  Get.to(
                    () => CheckEmailScreen(email: emailController.text),
                    transition: Transition.rightToLeft,
                  );
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
      ),
    );
  }
}
