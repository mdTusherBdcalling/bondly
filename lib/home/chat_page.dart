import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final String time;
  final bool isSeen;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
    this.isSeen = false,
  });
}

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _messageController = TextEditingController();

  List<ChatMessage> messages = [
    ChatMessage(
      text:
          "We're never going to save enough for this house. It feels impossible.",
      isUser: true,
      time: "3:00PM",
      isSeen: true,
    ),
    ChatMessage(
      text:
          "Totally understand—saving for a big goal like a home can feel overwhelming sometimes.\n\n❤️ But even small, consistent progress adds up—and just thinking about it already puts you ahead of where you were yesterday. 🙏\n\nWould you like me to help break it into one simple doable step you can take this week?",
      isUser: false,
      time: "3:00PM",
    ),
    ChatMessage(
      text:
          "My girlfriend is spending a lot of money on Amazon. I don't want to upset her when I bring it up, though. How can I approach it?",
      isUser: true,
      time: "3:00PM",
      isSeen: true,
    ),
    ChatMessage(
      text:
          "That's really thoughtful of you, Stephanos—and honestly, bringing up money habits with someone you care about is one of the hardest conversations there is. It's great that you're thinking about how you want to say it, not just what you want to say. That shows real emotional intelligence.",
      isUser: false,
      time: "3:00PM",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Ask Bondly", context: context),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: messages.length + 1,
              reverse: false,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Date separator
                  return _buildDateSeparator(context, "May 7");
                }

                final msg = messages[index - 1];

                return _buildMessageBubble(msg, context);
              },
            ),
          ),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildDateSeparator(BuildContext context, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primaryBlueLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: commonText(
            date,
            context: context,
            size: 14,
            isBold: true,
            color: AppColors.whiteColour,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message, BuildContext context) {
    final bgColor =
        message.isUser
            ? AppColors.primaryBlueLight
            : AppColors.primaryBlueLight;
    final align =
        message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius =
        message.isUser
            ? const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(0),
            )
            : const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(16),
            );

    return Padding(
      padding: EdgeInsets.only(
        left: message.isUser ? 64 : 12,
        right: message.isUser ? 12 : 64,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            crossAxisAlignment:
                (!message.isUser)
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
            children: [
              if (!message.isUser)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/ai.png"),
                  ),
                ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: radius,
                      ),
                      child: commonText(
                        message.text,
                        context: context,
                        size: 14,
                        color: AppColors.whiteColour,
                      ),
                    ),
                    Row(
                      mainAxisAlignment:
                          message.isUser
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                      children: [
                        if (!message.isUser)
                          commonText(message.time, context: context),
                        if (message.isUser)
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Row(
                              children: [
                                Icon(
                                  message.isSeen ? Icons.done_all : Icons.done,
                                  size: 14,
                                  color:
                                      message.isSeen
                                          ? AppColors.buttonColour
                                          : AppColors.greyColour,
                                ),
                                commonText(
                                  " 3:00PM",
                                  context: context,
                                  color: AppColors.greyColour,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (message.isUser)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.dmOlrfKSyadMmI4FE0_R0wHaI_?w=740&h=898&rs=1&pid=ImgDetMain",
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.whiteColour,
        border: Border(
          top: BorderSide(
            color: AppColors.greyColour.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset("assets/Attach.png"),
            const SizedBox(width: 12),
            Image.asset("assets/Path.png", scale: 0.8),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryBlueLight,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  controller: _messageController,

                  decoration: InputDecoration(
                    hintText: "Send a message",

                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.trim().isEmpty) return;
                    setState(() {
                      messages.add(
                        ChatMessage(
                          text: value.trim(),
                          isUser: true,
                          time: _getCurrentTime(),
                          isSeen: false,
                        ),
                      );
                      _messageController.clear();
                    });
                  },
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_circle_right,
                size: 48,
                color: AppColors.greyColour.withOpacity(0.8),
              ),
              onPressed: () {
                final text = _messageController.text.trim();
                if (text.isEmpty) return;
                setState(() {
                  messages.add(
                    ChatMessage(
                      text: text,
                      isUser: true,
                      time: _getCurrentTime(),
                      isSeen: false,
                    ),
                  );
                  _messageController.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final ampm = now.hour >= 12 ? "PM" : "AM";
    return "$hour:$minute $ampm";
  }
}
