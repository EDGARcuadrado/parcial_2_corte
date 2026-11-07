import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_integrador_poo_2026_2/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Administración de Museos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
        },
      ),
      routes: routes,
      onUnknownRoute: unknownRoute,
      initialRoute: '/',
    );
  }
}
