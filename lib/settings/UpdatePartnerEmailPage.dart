import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';

class UpdatePartnerEmailPage extends StatefulWidget {
  const UpdatePartnerEmailPage({Key? key}) : super(key: key);

  @override
  State<UpdatePartnerEmailPage> createState() => _UpdatePartnerEmailPageState();
}

class _UpdatePartnerEmailPageState extends State<UpdatePartnerEmailPage> {
  final TextEditingController _emailController = TextEditingController(
    text: "Itunuoluwa@petra.africa",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Change Partner Email"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            commonTextField(
              context: context,
              controller: _emailController,
              hintText: "Itunuoluwa@petra.africa",
              title: "Update Partner Email",
              isBoldTitle: true,
              keyboardType: TextInputType.emailAddress,
            ),
            Spacer(),
            commonButton(
              context: context,
              title: "Change Email",
              onTap: () {
                // Implement invite logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Invite sent to ${_emailController.text}"),
                  ),
                );
              },
              height: 50,
              width: double.infinity,
              borderRadius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
