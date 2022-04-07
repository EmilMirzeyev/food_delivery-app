import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

abstract class IRouter {
  Future<bool> goToWithArguments(
      {required String direction, Map? arguments, bool replace = false});
  Future<bool> goToNamed({required String direction, bool replace = false});
  Future<bool> goTo({Widget? screen, PageTransitionType? transitionType});
  Future<bool> pop({Map? arguments});
}