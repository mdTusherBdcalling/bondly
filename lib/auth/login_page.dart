import 'package:bondly/auth/signup_page.dart';
import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart'; // your common widgets import

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

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
                SizedBox(height: 16),
                // Title and subtitle
                commonText("Log in", context: context, size: 28, isBold: true),
                const SizedBox(height: 8),
                commonText(
                  "Sign in to grow your love and wealth — together.",
                  context: context,
                  size: 14,
                  color: AppColors.greyColour,
                ),
                const SizedBox(height: 32),

                // Email field label + field
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

                // Password field label + field with toggle
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
                const SizedBox(height: 8),

                // Error message and forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    InkWell(
                      onTap: () {},
                      child: commonText(
                        "Forgot password?",

                        isBold: true,
                        size: 14,
                        context: context,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Continue button
                commonButton(
                  context: context,
                  title: "Continue",
                  onTap: () {
                    // TODO: Add login logic here
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      commonSnackbar(
                        title: "Empty Fields",
                        message: "Please fill in all fields.",
                        backgroundColor: AppColors.buttonColour,
                        textColor: Colors.white,
                        icon: Icons.warning_amber_rounded,
                      );

                      return;
                    }

                    // Continue login process
                  },

                  height: 50,
                  borderRadius: 12,
                  width: double.infinity,
                ),

                const SizedBox(height: 24),

                // Or divider
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

                // Social login buttons
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Apple login logic
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
                    "Login with Apple",
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
                    // TODO: Google login logic
                  },
                  icon: Image.asset(
                    "assets/google_logo.png",
                    height: 20,
                    width: 20,
                  ),
                  label: commonText(
                    "Login with Google",
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

                // Sign up prompt
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                        "Don’t have an account? ",
                        context: context,
                        size: 14,
                        color: AppColors.greyColour,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SignUpScreen());
                        },
                        child: commonText(
                          "Sign up",
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
