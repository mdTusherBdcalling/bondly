import 'package:flutter/material.dart';

import 'package:bondly/commonWidgets.dart';

class CouplePlanReadyScreen extends StatelessWidget {
  const CouplePlanReadyScreen({super.key});

  final List<Map<String, String>> benefits = const [
    {
      "bold": "Set and track shared goals",
      "normal": " with easy-to-follow action steps",
    },
    {
      "bold": "Strengthen communication",
      "normal": " around money in a stress-free way",
    },
    {
      "bold": "Build savings and investments together,",
      "normal": " without the overwhelm",
    },
    {
      "bold": "Understand each other’s money mindsets",
      "normal": " to create deeper alignment",
    },
    {
      "bold": "Celebrate progress",
      "normal": " with smart milestones and guided conversations",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context: context, title: "Set Your Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Title
              Center(
                child: commonText(
                  "Your Bondly Plan Is Ready 💜",
                  context: context,
                  size: 22,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Center(
                child: commonText(
                  "Based on your answers, here’s how Bondly will help you achieve your goals and build a stronger future.",
                  context: context,
                  size: 14,

                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),

              // Benefit Items
              ...benefits.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("✅", style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                            ),
                            children: [
                              TextSpan(
                                text: item["bold"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: item["normal"]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 24),

              // Final Note
              Center(
                child: commonText(
                  "This is just the beginning — Bondly will adapt as you grow, helping you stay connected to your goals every step of the way.",
                  context: context,
                  size: 14,
                  color: Colors.grey.shade700,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              commonButton(
                context: context,
                title: "Get Started With My Plan",
                onTap: () {
                  // Navigate forward
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom CTA
    );
  }
}
