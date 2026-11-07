import 'package:flutter/material.dart';
import 'package:proyecto_integrador_poo_2026_2/pages/index_page.dart';

Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const IndexPage(),
};

Route<void> unknownRoute(RouteSettings settings) {
  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => const IndexPage(),
  );
}
