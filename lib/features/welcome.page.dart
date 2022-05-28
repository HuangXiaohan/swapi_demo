import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'dashboard.page.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = 'welcome';

  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      if (_controller.isCompleted) {
        Navigator.of(context).pushReplacementNamed(DashboardPage.routeName);
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
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        'assets/animations/hi.json',
        repeat: false,
        controller: _controller,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward();
        },
      )),
    );
  }
}
