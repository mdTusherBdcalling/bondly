import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final TextEditingController nameController = TextEditingController(
    text: "Itunuoluwa Abidoye",
  );
  final TextEditingController emailController = TextEditingController(
    text: "Itunuoluwa@petra.africa",
  );
  final TextEditingController dobController = TextEditingController(
    text: "18 May, 2001",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+880 173101292373",
  );

  String selectedGender = "Male";

  final List<String> genderOptions = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Account Settings"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile header card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/solo.png"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.whiteColour,
                            width: 2,
                          ),
                        ),

                        child: Icon(
                          Icons.edit,
                          color: AppColors.whiteColour,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  commonText(
                    "Itunuoluwa Abidoye",
                    context: context,
                    size: 18,
                    isBold: true,
                    color: AppColors.whiteColour,
                  ),
                  commonText(
                    "Advanced User",
                    context: context,
                    size: 14,
                    color: AppColors.greyColour,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Form fields container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  commonTextField(
                    context: context,
                    controller: nameController,
                    title: "Name",
                    inputTextColor: AppColors.whiteColour,
                    hintText: "Enter your name",
                    borderColor: AppColors.whiteColour,
                    titleColor: AppColors.whiteColour,
                    hintTextColor: AppColors.whiteColour,
                  ),
                  const SizedBox(height: 16),
                  commonTextField(
                    context: context,
                    controller: emailController,
                    title: "Your Email",
                    hintText: "Enter your email",
                    borderColor: AppColors.whiteColour,
                    inputTextColor: AppColors.whiteColour,
                    titleColor: AppColors.whiteColour,
                    hintTextColor: AppColors.whiteColour,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  commonTextField(
                    context: context,
                    controller: dobController,
                    title: "Date of Birth",
                    hintText: "Select date of birth",
                    borderColor: AppColors.whiteColour,
                    inputTextColor: AppColors.whiteColour,
                    titleColor: AppColors.whiteColour,
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: AppColors.whiteColour,
                    ),
                    hintTextColor: AppColors.whiteColour,
                    enabled: false, // For demo, non-editable field
                    // You can add date picker logic here
                    showSuffixIcon: true,
                    togglePasswordVisibility: null,
                  ),
                  const SizedBox(height: 16),
                  commonTextField(
                    context: context,
                    controller: phoneController,
                    title: "Phone",
                    hintText: "Enter your phone number",
                    borderColor: AppColors.whiteColour,
                    inputTextColor: AppColors.whiteColour,
                    titleColor: AppColors.whiteColour,
                    hintTextColor: AppColors.whiteColour,
                    keyboardType: TextInputType.phone,
                    prefixIcon: // Country flag container
                        Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset("assets/flag.png", width: 30, height: 20),
                        SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 24,
                          color: AppColors.whiteColour,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Gender Dropdown
                  Row(
                    children: [
                      SizedBox(width: 8),
                      commonText(
                        "Gender",
                        context: context,
                        size: 16,
                        color: AppColors.whiteColour,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.whiteColour,
                        width: 2,
                      ),
                      color: AppColors.primaryBlue,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: DropdownButton<String>(
                      value: selectedGender,
                      dropdownColor: AppColors.primaryBlue,
                      isExpanded: true,
                      iconEnabledColor: AppColors.whiteColour,
                      style: TextStyle(
                        color: AppColors.whiteColour,
                        fontSize: 16,
                      ),
                      underline: const SizedBox.shrink(),
                      items:
                          genderOptions.map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedGender = value;
                          });
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 24),
                  commonButton(
                    context: context,
                    title: "Update",
                    onTap: () {
                      // Handle update logic here
                    },
                    width: double.infinity,
                    height: 50,
                    borderRadius: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
