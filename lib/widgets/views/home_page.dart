import 'package:flutter/material.dart';

const Duration duration = Duration(seconds: 3);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    _navigate();
    super.initState();
  }

  _navigate() async {
    await Future.delayed(duration);
    Navigator.pushNamed(context, "usersPage");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              curve: Curves.easeInOutSine,
              duration: duration,
              tween: Tween<double>(begin: 0, end: 1),
              builder: (_, double value, __) {
                return Opacity(
                  opacity: value,
                  child: Image.asset('assets/image.png'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
