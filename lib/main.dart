import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'core/localization/supported_local.dart';
import 'core/services/firebase_notification_service.dart';
import 'core/services/local_db.dart';
import 'core/services/network_checker.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/storage_service.dart';
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _listener;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    NetworkChecker().subscribe(scaffoldMessengerKey: _scaffoldMessengerKey);
    _listener = AppLifecycleListener(
      onResume: NetworkChecker().resume,
      onHide: NetworkChecker().pause,
      onPause: NetworkChecker().pause,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Excellis Travel',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        locale: supportedLocales().first,
        supportedLocales: supportedLocales(),
        scaffoldMessengerKey: _scaffoldMessengerKey,
      );

  @override
  void dispose() {
    NetworkChecker().unsubscribe();
    _listener.dispose();
    super.dispose();
  }
}
