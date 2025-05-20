import 'dart:async';
import 'dart:math';
import 'package:bondly/Quizzes/result_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // for navigation
import 'package:bondly/colors.dart';
import 'package:bondly/commonWidgets.dart';

class AnalyzingPage extends StatefulWidget {
  const AnalyzingPage({super.key});

  @override
  State<AnalyzingPage> createState() => _AnalyzingPageState();
}

class _AnalyzingPageState extends State<AnalyzingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  final List<Widget> _hearts = [];

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

    _generateFloatingHearts();

    // Stop animation and navigate after 5 seconds
    Timer(const Duration(seconds: 4), () {
      _controller.stop();
      if (mounted) {
        // Replace YourNextPage() with the page widget you want to navigate to
        Get.off(() => ResultPage());
      }
    });
  }

  void _generateFloatingHearts() {
    final colors = [
      Colors.pinkAccent,
      Colors.greenAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.blue.shade200,
    ];
    final random = Random();

    for (int i = 0; i < 25; i++) {
      _hearts.add(
        AnimatedHeart(
          delay: Duration(milliseconds: random.nextInt(1000)),
          color: colors[random.nextInt(colors.length)],
          size: 40 + random.nextInt(12).toDouble(),
          left: random.nextDouble(),
          top: random.nextDouble(),
          duration: Duration(seconds: 6 + random.nextInt(5)),
        ),
      );
    }
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
        children: [
          ..._hearts,
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

class AnimatedHeart extends StatefulWidget {
  final double size;
  final Color color;
  final double left;
  final double top;
  final Duration duration;
  final Duration delay;

  const AnimatedHeart({
    super.key,
    required this.size,
    required this.color,
    required this.left,
    required this.top,
    required this.duration,
    required this.delay,
  });

  @override
  State<AnimatedHeart> createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final t = _controller.value * 2 * pi;

        final dx =
            widget.left * screenSize.width + 10 * sin(t * 2 + widget.left * 5);
        final dy =
            widget.top * screenSize.height + 10 * cos(t * 3 + widget.top * 5);

        return Positioned(
          left: dx,
          top: dy,
          child: Icon(Icons.favorite, size: widget.size, color: widget.color),
        );
      },
    );
  }
}
