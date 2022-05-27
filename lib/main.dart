import 'package:flutter/material.dart';
import 'package:swapi_demo/services/services_context.dart';

import 'app_navigator.dart';

void main() {
  runApp(const MyApp());
  ServicesContext.initContext();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swapi Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppNavigator(),
    );
  }
}
