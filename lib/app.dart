import 'package:flutter/material.dart';
import 'package:nectar_store/core/routes/app_routes.dart';

class NectarStoreApp extends StatelessWidget {
  const NectarStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nectar Store',
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
