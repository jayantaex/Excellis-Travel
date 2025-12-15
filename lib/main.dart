import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/localization/supported_local.dart';
import 'core/services/firebase_notification_service.dart';
import 'core/services/local_db.dart';
import 'core/theme/app_theme.dart';
import 'utils/storage_service.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  Platform.isIOS ? null : await Firebase.initializeApp();
  Platform.isIOS
      ? null
      : await FirebaseNotificationService.instance.initialize();
  await LocalDB().initLocalDB();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales(),
      fallbackLocale: supportedLocales().first,
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Excellis Travel',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        locale: supportedLocales().first,
        supportedLocales: supportedLocales(),
        scaffoldMessengerKey: _scaffoldMessengerKey,
      );
}
