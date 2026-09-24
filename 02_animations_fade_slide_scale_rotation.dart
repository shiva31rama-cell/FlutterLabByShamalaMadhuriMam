import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fade;
  late Animation<double> scale;
  late Animation<double> rotation;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    // Controls the animation duration and progress.
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Defines the start and end values for each effect.
    fade = Tween<double>(begin: 0, end: 1).animate(controller);
    scale = Tween<double>(begin: 0.5, end: 1).animate(controller);
    rotation = Tween<double>(begin: 0, end: 1).animate(controller);
    slide = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Animations')),
        body: Center(
          child: FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: ScaleTransition(
                scale: scale,
                child: RotationTransition(
                  turns: rotation,
                  child: Container(
                    width: 180,
                    height: 180,
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'Animated',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
