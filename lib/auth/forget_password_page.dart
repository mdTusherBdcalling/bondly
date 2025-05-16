import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
              commonBackButton(),
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
                color: AppColors.greyColour,
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
              const SizedBox(height: 16),

              const Spacer(),

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
