import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class HelpSupportPage extends StatelessWidget {
  HelpSupportPage({super.key});

  final TextEditingController nameController = TextEditingController(
    text: "Itunuoluwa Abidoye",
  );
  final TextEditingController emailController = TextEditingController(
    text: "Itunuoluwa@petra.africa",
  );
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Help & Support"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryBlueLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              // Contact Information Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    commonText(
                      "Contact Information",
                      context: context,
                      size: 21,
                      isBold: true,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone, color: Colors.white),
                        const SizedBox(width: 8),
                        commonText(
                          "+1012 3456 789",
                          context: context,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Email
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.email, color: Colors.white),
                        const SizedBox(width: 8),
                        commonText(
                          "demo@gmail.com",
                          context: context,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Address
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 8),
                        commonText(
                          "132 Dartmouth Street Boston, Massachusetts 02156 United States",
                          context: context,
                          color: Colors.white,
                          size: 14,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Social Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIconButton("assets/settings/twiter.png"),
                        const SizedBox(width: 12),
                        _socialIconButton("assets/settings/instragram.png"),
                        const SizedBox(width: 12),
                        _socialIconButton("assets/settings/discord.png"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Form Fields
              commonTextField(
                context: context,
                controller: nameController,
                title: "Name",
                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                titleColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                hintText: "Your name",
              ),
              const SizedBox(height: 16),
              commonTextField(
                context: context,
                controller: emailController,
                title: "Your Email",
                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                titleColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                hintText: "Your email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              commonTextField(
                context: context,
                controller: messageController,
                title: "Message",
                borderColor: AppColors.whiteColour,
                hintTextColor: AppColors.whiteColour,
                titleColor: AppColors.whiteColour,
                inputTextColor: AppColors.whiteColour,
                hintText: "Type here",
                maxLines: 5,
              ),

              const SizedBox(height: 24),

              commonButton(
                context: context,
                title: "Send Message",
                onTap: () {
                  // TODO: Implement send message logic
                },
                borderRadius: 16,
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialIconButton(String assetPath) {
    return InkWell(
      onTap: () {
        // TODO: Implement social link
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColour,
          shape: BoxShape.circle,
        ),
        child: Image.asset(assetPath, width: 36, height: 36),
      ),
    );
  }
}
