import 'package:bondly/auth/login_page.dart';
import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart'; // your common widgets import

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController(
    text: "contact@dscodetech.com",
  );
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonBackButton(),
                const SizedBox(height: 16),

                // Title and subtitle
                commonText("Sign up", context: context, size: 28, isBold: true),
                const SizedBox(height: 8),
                commonText(
                  "Sign up to grow your love and wealth — together.",
                  context: context,
                  size: 14,
                  color: AppColors.greyColour,
                ),
                const SizedBox(height: 32),

                // Email
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

                // Password
                commonText(
                  "Password",
                  context: context,
                  size: 14,
                  isBold: true,
                ),
                const SizedBox(height: 8),
                commonTextField(
                  context: context,
                  controller: passwordController,
                  hintText: "********",
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

                // Confirm Password
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
                  hintText: "********",
                  isPassword: true,
                  isPasswordVisible: isConfirmPasswordVisible,
                  togglePasswordVisibility: () {
                    setState(() {
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                  showSuffixIcon: true,
                ),
                const SizedBox(height: 16),

                const SizedBox(height: 24),

                // Continue button
                commonButton(
                  context: context,
                  title: "Continue",
                  onTap: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      commonSnackbar(
                        title: "Empty Fields",
                        message: "Please fill in all fields.",
                        backgroundColor: AppColors.buttonColour,
                        textColor: Colors.white,
                        icon: Icons.warning_amber_rounded,
                      );
                      setState(() {});
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

                    // TODO: Proceed with signup
                  },
                  bgColor: AppColors.buttonColour,
                  fgColor: Colors.white,
                  height: 50,
                  borderRadius: 12,
                  width: double.infinity,
                ),

                const SizedBox(height: 24),

                // Or divider222
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: commonText(
                        "Or",
                        context: context,
                        size: 14,
                        color: AppColors.greyColour,
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),

                const SizedBox(height: 24),

                // Social signup buttons
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Apple signup logic
                  },
                  icon: Icon(
                    Icons.apple,
                    size: 30,
                    color:
                        (Theme.of(context).brightness == Brightness.dark)
                            ? AppColors.whiteColour
                            : AppColors.blackColour,
                  ),
                  label: commonText(
                    "Sign Up with Apple",
                    context: context,
                    size: 14,
                    isBold: true,
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Google signup logic
                  },
                  icon: Image.asset(
                    "assets/google_logo.png",
                    height: 20,
                    width: 20,
                  ),
                  label: commonText(
                    "Sign Up with Google",
                    context: context,
                    size: 14,
                    isBold: true,
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Login prompt
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                        "Already have an account? ",
                        context: context,
                        size: 14,
                        color: AppColors.greyColour,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(LoginScreen());
                        },
                        child: commonText(
                          "Log In",
                          context: context,
                          size: 14,
                          color: AppColors.buttonColour,
                          isBold: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
