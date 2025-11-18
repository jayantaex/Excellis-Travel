import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/services/firebase_notification_service.dart';
import 'core/services/local_db.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
      Widget build(BuildContext context) => MaterialApp.router(
        title: 'Excellis Travel',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.lightTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
      );
}
