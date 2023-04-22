import 'package:flutter/material.dart';
import 'package:todo/routes.dart';
import 'package:todo/service_locator.dart';
import 'package:todo/stores/notification_manager.dart';
import 'color_schemes.g.dart';
///метод main используется для инициализаций настроек
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSingleton();
  NotificationManager().initNotification();
  NotificationManager().showNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60)))),
      routerConfig: routes,
    );
  }
}
