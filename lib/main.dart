import 'package:doctor_appointment/presentation/themes/app_theme.dart';
import 'package:doctor_appointment/routes/app_routes.dart';
import 'package:doctor_appointment/utils/clear_focus_observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/network/api_client.dart';
import 'core/network/connectivity_service.dart';
import 'data/app_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    ConnectivityService().startMonitoring();
    ApiClient();
    ApiClient.initialize(devBaseUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doctor Appointment',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ClearFocusOnNavigateObserver()],
    );
  }
}
