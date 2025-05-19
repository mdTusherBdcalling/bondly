import 'package:flutter/material.dart';
import 'package:bondly/commonWidgets.dart';
import 'package:bondly/colors.dart';

class AnalyzingPage extends StatefulWidget {
  const AnalyzingPage({super.key});

  @override
  State<AnalyzingPage> createState() => _AnalyzingPageState();
}

class _AnalyzingPageState extends State<AnalyzingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        context: context,
        title: "Analyzing",
        menushow: false,
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/lovebg.png", fit: BoxFit.fitWidth),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                commonText(
                  "Finding your shared\nmoney mindset...",
                  context: context,
                  size: 20,
                  isBold: true,
                  color: AppColors.primaryBlue,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Heart + progress bar
                SizedBox(
                  height: 50,

                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 8,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.primaryBlueLight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 8,
                          width: 200 * _progressAnimation.value,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF703EFF), Color(0xFFEC66FE)],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 200 * _progressAnimation.value,
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
