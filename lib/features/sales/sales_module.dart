import 'package:flutter/material.dart';
import 'presentation/screens/my_markup_screen.dart';

class SalesModule {
  static const String myMarkupRoute = '/my-markup';
  static const String myMarkupScreen = 'my_markup_screen';
  static Widget myMarkupBuilder() => const MyMarkupScreen();
}
