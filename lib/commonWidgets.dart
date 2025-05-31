import 'package:bondly/colors.dart';
import 'package:bondly/home/custom_drawer.dart';
import 'package:bondly/settings/HelpSupportPage.dart';
import 'package:bondly/settings/faq_page.dart';
import 'package:bondly/settings/notification_page.dart';
import 'package:bondly/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

Widget commonText(
  String text, {
  required BuildContext context,
  double size = 14,
  Color? color,
  int? maxline,
  bool isBold = false,
  TextAlign textAlign = TextAlign.left,
}) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final textColor =
      color ?? (isDark ? AppColors.whiteColour : AppColors.blackColour);

  return Text(
    text,
    maxLines: maxline,
    overflow: maxline != null ? TextOverflow.ellipsis : null,
    textAlign: textAlign,
    style: GoogleFonts.inter(
      fontSize: size,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      color: textColor,
    ),
  );
}

Widget commonBackButton({Color? color, required BuildContext context}) {
  return InkWell(
    onTap: () => Get.back(),
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color ?? Color(0xFFECECEC),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 24,
        color:
            (Theme.of(context).brightness == Brightness.dark)
                ? AppColors.buttonColour
                : AppColors.blackColour,
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
  double textSize = 16,
  TextAlign textAlign = TextAlign.center,
  String? imagePath,
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
                        if (imagePath != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              imagePath,
                              height: textSize, // icon size match text height
                              width: textSize,
                            ),
                          ),
                        commonText(
                          title,
                          context: context,
                          textAlign: textAlign,
                          size: textSize,
                          color: fgColor,
                          isBold: true,
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
  Color? hintTextColor,
  int maxLines = 1,
  titleColor,
  inputTextColor,
  suffixIcon,
  prefixIcon,
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
            commonText(
              title,
              context: context,
              isBold: isBoldTitle,
              size: 14,
              color: titleColor ?? Theme.of(context).textTheme.bodyLarge?.color,
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
            style: TextStyle(
              fontSize: 14,
              color:
                  inputTextColor ??
                  Theme.of(context).textTheme.bodyLarge?.color,
            ),
            obscureText: isPassword && !isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              hintText: hintText,

              hintStyle: TextStyle(color: hintTextColor, fontSize: 14),
              border: InputBorder.none,
              prefix: prefixIcon,
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
                      : suffixIcon,
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

Widget gradientLinearProgress(
  double value, {
  double height = 8,
  Color startColor = AppColors.buttonColour,
  Color endColor = AppColors.primaryPink,
}) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(50),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              width: constraints.maxWidth * value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [startColor, endColor], // Example gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

AppBar commonAppBar({
  required BuildContext context,
  required String title,
  bool menushow = true,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor:
        (Theme.of(context).brightness == Brightness.light)
            ? AppColors.whiteColour
            : AppColors.blackColour,
    title: commonText(title, context: context, size: 18, isBold: true),
    centerTitle: true,
    leading: commonBackButton(color: Colors.transparent, context: context),
    actions: [
      if (menushow)
        InkWell(
          onTap: () {
            // GlobalScaffoldKey.key.currentState?.openEndDrawer();
            showCustomMenu(context);
          },
          child: Image.asset(
            "assets/menu.png",
            color:
                (Theme.of(context).brightness == Brightness.dark)
                    ? AppColors.buttonColour
                    : AppColors.blackColour,
          ),
        ),
      SizedBox(width: 12),
    ],
  );
}

void showCustomMenu(BuildContext context) {
  showDialog(
    context: context,

    barrierColor: Colors.black54, // dim background
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent,

        insetPadding: const EdgeInsets.only(left: 16, right: 0, top: 40),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 280,
            height: 610,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomDrawer(
              userName: "Ovie Rahaman",
              userRole: "Advanced User",
              userImagePath:
                  "https://i.pinimg.com/originals/96/10/c3/9610c30481c6916a584952b7d2cf5912.jpg",
              onLogout: () {
                // logout logic here
              },
              onMenuTap: (index) async {
                Navigator.of(context).pop(); // close popup first

                switch (index) {
                  case 0:
                    Get.to(
                      () => SettingsPage(),
                      transition: Transition.rightToLeft,
                    );
                    break;
                  case 1:
                    Get.to(
                      () => NotificationPage(),
                      transition: Transition.rightToLeft,
                    );
                    break;
                  case 2:
                    SharePlus.instance.share(
                      ShareParams(
                        text: 'check out my website https://example.com',
                      ),
                    );

                    break;
                  case 3:
                    final InAppReview inAppReview = InAppReview.instance;
                    bool isgooglePlayStoreInstalled =
                        await inAppReview.isAvailable();

                    if (isgooglePlayStoreInstalled) {
                      inAppReview.requestReview();
                    } else {
                      // fallback - open Play Store page
                      inAppReview.openStoreListing();
                    }

                    break;
                  case 4:
                    Get.to(
                      () => HelpSupportPage(),
                      transition: Transition.rightToLeft,
                    );
                    break;
                  case 5:
                    Get.to(() => FAQPage(), transition: Transition.rightToLeft);
                    break;
                  default:
                    break;
                }
              },
            ),
          ),
        ),
      );
    },
  );
}

// The expandable date selector widget code (same as before):

class ExpandableDateSelector extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;
  final bool isExpanded;

  const ExpandableDateSelector({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
    required this.isExpanded,
  });

  @override
  State<ExpandableDateSelector> createState() => _ExpandableDateSelectorState();
}

class _ExpandableDateSelectorState extends State<ExpandableDateSelector> {
  late DateTime _selectedDate;
  bool _isExpanded = false;

  late List<DateTime> _datesInMonth;
  List<DateTime> _shortDates = [];
  final List<String> _weekDaysShort = [
    "Mo",
    "Tu",
    "We",
    "Th",
    "Fr",
    "Sa",
    "Su",
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _datesInMonth = _getDatesInMonth(_selectedDate);
    _updateShortDates();
  }

  List<DateTime> _getDatesInMonth(DateTime date) {
    var lastDay = DateTime(date.year, date.month + 1, 0);
    List<DateTime> days = [];
    for (int i = 0; i < lastDay.day; i++) {
      days.add(DateTime(date.year, date.month, i + 1));
    }
    return days;
  }

  // Update shortDates centered around selectedDate, adjust to month boundaries
  void _updateShortDates() {
    int selectedIndex = _datesInMonth.indexWhere(
      (d) => d.day == _selectedDate.day,
    );
    if (selectedIndex == -1) selectedIndex = 0;

    int startIndex = selectedIndex - 3; // try to show 3 days before selected
    if (startIndex < 0) startIndex = 0;
    if (startIndex + 7 > _datesInMonth.length) {
      startIndex = (_datesInMonth.length - 7).clamp(0, _datesInMonth.length);
    }

    _shortDates = _datesInMonth.sublist(
      startIndex,
      (startIndex + 7).clamp(0, _datesInMonth.length),
    );
  }

  void _goToPreviousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
      _datesInMonth = _getDatesInMonth(_selectedDate);
      _selectedDate = _datesInMonth.first;
      _updateShortDates();
      widget.onDateSelected(_selectedDate);
    });
  }

  void _goToNextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
      _datesInMonth = _getDatesInMonth(_selectedDate);
      _selectedDate = _datesInMonth.first;
      _updateShortDates();
      widget.onDateSelected(_selectedDate);
    });
  }

  void _onDateTap(DateTime date) {
    setState(() {
      _selectedDate = date;
      _updateShortDates();
      widget.onDateSelected(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Month label, arrows, expand/collapse toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  commonText(
                    "${_selectedDate.monthName()}",
                    context: context,
                    size: 14,
                    color: AppColors.whiteColour,
                  ),
                  const SizedBox(width: 12),
                  if (widget.isExpanded)
                    InkWell(
                      onTap: _goToPreviousMonth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColour,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 14,
                          color: AppColors.blackColour,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  if (widget.isExpanded)
                    InkWell(
                      onTap: _goToNextMonth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColour,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.blackColour,
                        ),
                      ),
                    ),
                ],
              ),
              if (widget.isExpanded)
                InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      commonText(
                        _isExpanded ? "Show Less" : "Expand",
                        context: context,
                        size: 14,
                        color: AppColors.whiteColour,
                        isBold: true,
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Dates list
          _isExpanded ? _buildExpandedCalendar() : _buildShortCalendar(),
        ],
      ),
    );
  }

  // Expanded calendar uses GridView for the full month
  Widget _buildExpandedCalendar() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 0.5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        mainAxisExtent: 60,
      ),
      itemCount: _datesInMonth.length,
      itemBuilder: (context, index) {
        DateTime date = _datesInMonth[index];
        bool isSelected = date.day == _selectedDate.day;

        return _dateItem(date, isSelected, false);
      },
    );
  }

  // Short calendar uses Row for exactly 7 days
  Widget _buildShortCalendar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          _shortDates.map((date) {
            bool isSelected = date.day == _selectedDate.day;
            return Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: _dateItem(date, isSelected, true),
              ),
            );
          }).toList(),
    );
  }

  // Common widget for a single date item
  Widget _dateItem(DateTime date, bool isSelected, bool shortCalendar) {
    return GestureDetector(
      onTap: () => _onDateTap(date),
      child: Container(
        padding:
            shortCalendar
                ? const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
                : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        decoration: BoxDecoration(
          gradient:
              isSelected
                  ? const LinearGradient(
                    colors: [Color(0xFF703EFF), Color(0xFFEC66FE)],
                  )
                  : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            commonText(
              date.day.toString(),
              context: context,

              color: AppColors.whiteColour,
              isBold: true,
            ),
            const SizedBox(height: 4),
            commonText(
              _weekDaysShort[date.weekday - 1], // weekday index 1 = Monday
              context: context,
              size: 12,
              color: AppColors.whiteColour,
            ),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: CircleAvatar(radius: 3, backgroundColor: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}

// Extension to get month name from DateTime
extension DateHelpers on DateTime {
  String monthName() {
    const List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[this.month - 1];
  }
}
