import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../start/food_delivery_app.dart';
import '../abstraction/i_router.dart';
import 'dart:developer' as dev;

class Router implements IRouter {
  @override
  Future<bool> goToNamed({required String direction, bool replace = false}) async {
    try {
      if (replace) {
        await navigatorKey.currentState!.pushReplacementNamed(direction);
      } else {
        await navigatorKey.currentState!.pushNamed(direction);
      }
      return true;
    } catch (e) {
      dev.log('error when route $direction in goTo');
      rethrow;
    }
  }

  @override
  Future<bool> goToWithArguments({required String direction, Map? arguments, bool replace = false}) async {
    try {
      if (replace) {
        await navigatorKey.currentState!.pushReplacementNamed(direction, arguments: arguments);
      } else {
        await navigatorKey.currentState!.pushNamed(direction, arguments: arguments);
      }
      return true;
    } catch (e) {
      dev.log('error when route $direction in goToWithArguments');
      rethrow;
    }
  }

  @override
  Future<bool> pop({Map? arguments}) async {
    try {
      if (navigatorKey.currentState!.canPop()) {
        navigatorKey.currentState!.pop(arguments);
        return true;
      } else {
        throw Exception('Navigator can not pop');
      }
    } catch (e) {
      dev.log('error when route in pop() with argument ${arguments ?? 'no-one'}');
      rethrow;
    }
  }

  @override
  Future<bool> goTo({Widget? screen, PageTransitionType? transitionType}) async {
    try {
      await navigatorKey.currentState!.push(
        transitionType != null
            ? PageTransition(
                type: transitionType,
                alignment: Alignment.bottomCenter,
                child: screen!,
              )
            : MaterialPageRoute(builder: (context) => screen!),
      );
      return true;
    } catch (e) {
      dev.log('error when route ${screen.toString()} in goTo');
      rethrow;
    }
  }
}
