import 'package:flutter/material.dart';

import 'presentation/screens/setting_screen.dart';

class SettingsModule {
  static String routePath = '/settings';
  static String routeName = 'settings';
  static Widget builder() => const SettingScreen();
}
