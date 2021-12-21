import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animação Controlada - Botãos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Size?> sizeAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<BorderRadius?> radiusAnimation;
  late Animation<Alignment> alignAnimation;

  void toggle() {
    if (controller.value == 0) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    sizeAnimation = SizeTween(
      begin: Size(150, 50),
      end: Size(50, 50),
    ).animate(controller);

    colorAnimation = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(controller);

    radiusAnimation = Tween(
      begin: BorderRadius.horizontal(),
      end: BorderRadius.circular(24),
    ).animate(controller);

    alignAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
    ).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animação Controlada - Botão"),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return GestureDetector(
            onTap: toggle,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: alignAnimation.value,
                child: Container(
                  height: sizeAnimation.value?.height,
                  width: sizeAnimation.value?.width,
                  decoration: BoxDecoration(
                    color: colorAnimation.value,
                    borderRadius: radiusAnimation.value,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
