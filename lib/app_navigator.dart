import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:swapi_demo/features/welcome.page.dart';

import 'features/dashboard/dashboard.page.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  static Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: WelcomePage.routeName,
        onGenerateRoute: (RouteSettings settings) {
          Widget page;
          switch (settings.name) {
            case WelcomePage.routeName:
              page = const WelcomePage();
              break;
            case DashboardPage.routeName:
              page = const DashboardPage();
              break;
            default:
              logger.e('Invalid route in navigator: ${settings.name ?? ''}');
              throw Exception('Invalid route in navigator');
          }

          return buildTransition(page, settings);
        });
  }

  PageRoute buildTransition(Widget page, RouteSettings settings) {
    switch (settings.name) {
      case DashboardPage.routeName:
        return PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
    }
  }
}
