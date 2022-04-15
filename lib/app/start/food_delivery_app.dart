import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/pages/home/home_page.dart';
import 'package:food_delivery_app/ui/screens/layout.dart';
import '/ui/screens/auth/auth_screen.dart';
import '/ui/utils/constraints/ui_constraints.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: UiConstraints.instance.kfe734c,
        scaffoldBackgroundColor: UiConstraints.instance.kfff,
        appBarTheme: AppBarTheme(backgroundColor: UiConstraints.instance.kfff),
      ),
      builder: (context, widget) {
        return ScrollConfiguration(behavior: const ScrollBehaviorModified(), child: widget!);
      },
      routes: {
        HomePage.route: (_) => const HomePage(),
        AuthScreen.route: (_) => const AuthScreen(),
        Layout.route: (_) => const Layout(),
      },
      initialRoute: Layout.route,
    );
  }
}
