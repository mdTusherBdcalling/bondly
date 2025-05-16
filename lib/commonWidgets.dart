import 'package:bondly/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonText(
  String text, {
  required BuildContext context,
  double size = 14,
  Color? color,
  bool isBold = false,
  TextAlign textAlign = TextAlign.left,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final textColor =
      color ?? (isDark ? AppColors.whiteColour : AppColors.blackColour);

  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: textColor,
    ),
  );
}

Widget commonBackButton() {
  return InkWell(
    onTap: () => Get.back(),
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xFFECECEC),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 24,
        color: AppColors.blackColour,
      ),
    ),
  );
}

void commonSnackbar({
  String title = '',
  required String message,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
  Duration duration = const Duration(seconds: 3),
  SnackPosition position = SnackPosition.BOTTOM,
  double marginHorizontal = 16,
  double marginVertical = 20,
  double borderRadius = 8,
  IconData? icon,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: position,
    backgroundColor: backgroundColor,
    colorText: textColor,
    margin: EdgeInsets.symmetric(
      horizontal: marginHorizontal,
      vertical: marginVertical,
    ),
    borderRadius: borderRadius,
    icon: icon != null ? Icon(icon, color: textColor) : null,
    duration: duration,
    isDismissible: true,
    snackStyle: SnackStyle.FLOATING,
  );
}

Widget commonButton({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  double height = 50,
  double width = double.infinity,
  Color bgColor = AppColors.buttonColour,
  Color fgColor = AppColors.whiteColour,
  double borderRadius = 12,
  bool isLoading = false,
  bool haveNextIcon = false,
  double textSize = 16,
  TextAlign textAlign = TextAlign.center,
}) {
  return GestureDetector(
    onTap: isLoading ? null : onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: bgColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        commonText(
                          title,
                          context: context,
                          textAlign: textAlign,
                          size: textSize,
                          color: fgColor,
                          isBold: true,
                        ),
                        if (haveNextIcon)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              "assets/arrow.png",
                              height: textSize, // icon size match text height
                              width: textSize,
                            ),
                          ),
                      ],
                    ),
                  ),
        ),
      ),
    ),
  );
}

Widget commonTextField({
  required BuildContext context,
  required TextEditingController controller,
  String title = '',
  bool isBoldTitle = false,
  bool optional = false,
  String? hintText,
  bool enabled = true,
  bool isPassword = false,
  bool isPasswordVisible = false,
  VoidCallback? togglePasswordVisibility,
  bool showSuffixIcon = false,
  FormFieldValidator<String>? validator,
  FocusNode? focusNode,
  TextInputType? keyboardType,
  int maxLines = 1,
  Color? borderColor,
  double borderWidth = 2.0,
}) {
  final effectiveBorderColor = borderColor ?? Theme.of(context).dividerColor;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title.isNotEmpty)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isBoldTitle ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            if (optional)
              const Text(
                '(Optional)',
                style: TextStyle(fontSize: 14, color: AppColors.greyColour),
              ),
          ],
        ),
      if (title.isNotEmpty) const SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: effectiveBorderColor, width: borderWidth),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            focusNode: focusNode,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines,
            obscureText: isPassword && !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon:
                  showSuffixIcon
                      ? InkWell(
                        onTap: togglePasswordVisibility,
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                      : null,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commonBorderedButton({
  required BuildContext context,
  required String title,
  required VoidCallback onTap,
  double height = 50,
  double width = double.infinity,
  Color borderColor = AppColors.buttonColour,
  Color fgColor = AppColors.buttonColour,
  double borderRadius = 8,
  bool isLoading = false,
  bool haveNextIcon = false,
  double textSize = 16,
  TextAlign textAlign = TextAlign.center,
}) {
  return GestureDetector(
    onTap: isLoading ? null : onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        border: Border.all(color: borderColor, width: 2),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              isLoading
                  ? SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: fgColor,
                      strokeWidth: 2,
                    ),
                  )
                  : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          textAlign: textAlign,
                          style: TextStyle(
                            fontSize: textSize,
                            fontWeight: FontWeight.bold,
                            color: fgColor,
                          ),
                        ),
                        if (haveNextIcon)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              "assets/arrow.png",
                              height: textSize,
                              width: textSize,
                            ),
                          ),
                      ],
                    ),
                  ),
        ),
      ),
    ),
  );
}
