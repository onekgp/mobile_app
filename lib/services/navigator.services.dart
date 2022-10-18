import 'package:flutter/material.dart';

class NavigatorServices {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorServices._();

  static NavigatorServices get instance => NavigatorServices._();

  Future<dynamic>? push(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  /// Remove last screen and add current screen on top of stack
  Future<dynamic>? replaceAndNavigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Pop all the screen/routes from stack and add the current screen.
  Future<dynamic>? popAllAndReplace(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false, arguments: arguments);
  }

  /// If called with data, then passes that data to last screen in stack or else pop the last screen without and data.
  void pop({Map<String, dynamic>? data}) {
    if (data != null) {
      return navigatorKey.currentState?.pop(data);
    } else {
      navigatorKey.currentState?.pop();
    }
  }
}
