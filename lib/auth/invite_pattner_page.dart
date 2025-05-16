import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class InvitePartnerScreen extends StatefulWidget {
  const InvitePartnerScreen({Key? key}) : super(key: key);

  @override
  State<InvitePartnerScreen> createState() => _InvitePartnerScreenState();
}

class _InvitePartnerScreenState extends State<InvitePartnerScreen> {
  final TextEditingController partnerEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText(
          "Invite Partner",
          context: context,
          size: 18,
          isBold: true,
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              "Partner Email",
              context: context,
              size: 14,
              isBold: true,
            ),
            const SizedBox(height: 8),
            commonTextField(
              context: context,
              controller: partnerEmailController,
              hintText: "Enter partner email",
              keyboardType: TextInputType.emailAddress,
              isPassword: false,
            ),

            SizedBox(height: 16),

            commonButton(
              context: context,
              title: "Invite Your Partner",
              onTap: () {
                if (partnerEmailController.text.isEmpty) {
                  commonSnackbar(
                    title: "Empty Email",
                    message: "Please enter your partner's email.",
                    backgroundColor: AppColors.buttonColour,
                    textColor: Colors.white,
                    icon: Icons.warning_amber_rounded,
                  );
                  return;
                }

                // TODO: Invite partner API call here
                print("Inviting partner: ${partnerEmailController.text}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
