import 'package:bondly/auth/set_new_password.dart';
import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:get/get.dart';

class CheckEmailScreen extends StatefulWidget {
  final String email;

  CheckEmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<CheckEmailScreen> createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  final List<TextEditingController> otpControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget buildOTPTextField(
    TextEditingController controller,
    int index,
    BuildContext context,
  ) {
    final borderColor =
        (Theme.of(context).brightness == Brightness.dark)
            ? AppColors.whiteColour
            : AppColors.blackColour;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        border: Border.all(width: 2, color: borderColor),
      ),
      width: 55,
      height: 55,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 20),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && index < 4) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

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

              // Title and instructions
              commonText(
                "Check your email",
                context: context,
                size: 28,
                isBold: true,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Flexible(
                    child: commonText(
                      "We sent a code to ",
                      context: context,
                      size: 14,
                      color: AppColors.greyColour,
                      isBold: true,
                    ),
                  ),
                  commonText(
                    (widget.email.length < 7)
                        ? widget.email
                        : widget.email.replaceRange(
                          3,
                          widget.email.length - 3,
                          '...',
                        ),
                    context: context,
                  ),
                ],
              ),
              commonText(
                "enter 5 digit code that mentioned in the email",
                context: context,
                size: 14,
                color: AppColors.greyColour,
                isBold: true,
              ),
              const SizedBox(height: 32),

              // OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) =>
                      buildOTPTextField(otpControllers[index], index, context),
                ),
              ),

              const SizedBox(height: 32),

              // Verify Code button
              commonButton(
                context: context,
                title: "Verify Code",
                onTap: () {
                  String enteredCode = otpControllers.map((c) => c.text).join();
                  if (enteredCode.length < 5) {
                    commonSnackbar(
                      title: "Invalid Code",
                      message: "Please enter the 5-digit code.",
                      backgroundColor: AppColors.buttonColour,
                      textColor: Colors.white,
                      icon: Icons.error_outline,
                    );
                    return;
                  }
                  // TODO: Verify OTP logic here
                  print("Entered OTP: $enteredCode");
                  Get.to(
                    () => SetNewPasswordScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                bgColor: AppColors.buttonColour,
                fgColor: Colors.white,
                height: 50,
                borderRadius: 12,
                width: double.infinity,
              ),

              const SizedBox(height: 16),

              // Resend email prompt
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText(
                      "Haven’t got the email yet?  ",
                      context: context,
                      size: 14,
                      isBold: true,
                    ),
                    Column(
                      children: [
                        commonText(
                          "Resend OTP",
                          context: context,
                          size: 14,
                          isBold: true,
                          color: AppColors.buttonColour,
                        ),
                        Container(
                          width: 80,
                          height: 1,
                          color: AppColors.buttonColour,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
