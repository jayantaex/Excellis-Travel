import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/localization/supported_local.dart';
import 'core/services/firebase_notification_service.dart';
import 'core/services/local_db.dart';
import 'core/theme/app_theme.dart';
import 'l10n/generated/app_localizations.dart';
import 'utils/storage_service.dart';
import 'app_router.dart';

void main() async {
  final bool firebaseSetup = true;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  await LocalDB().initLocalDB();

  await EasyLocalization.ensureInitialized();
  if (firebaseSetup) {
    await Firebase.initializeApp();
    await FirebaseNotificationService.instance.initialize();
  }

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
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('bn'),
        scaffoldMessengerKey: _scaffoldMessengerKey,
      );
}
