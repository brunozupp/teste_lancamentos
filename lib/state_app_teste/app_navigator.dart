import 'package:flutter/material.dart';

class AppNavigator {

    AppNavigator._();

    static final navigatiorKey = GlobalKey<NavigatorState>();

    static NavigatorState get to => navigatiorKey.currentState!;

    static BuildContext get currentContext => navigatiorKey.currentContext!;
}