import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_integrador_poo_2026_2/main.dart';
import 'package:proyecto_integrador_poo_2026_2/pages/museum_detail_page.dart';

void main() {
  testWidgets('Index page lists museums and filters by name', (tester) async {
    tester.view.physicalSize = const Size(1600, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Museos'), findsOneWidget);
    expect(find.text('4 museos'), findsOneWidget);
    expect(find.text('Museo de Arte del Río'), findsOneWidget);
    expect(find.text('Registrar museo'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'andina');
    await tester.pumpAndSettle();

    expect(find.text('Museo de Historia Natural Andina'), findsOneWidget);
    expect(find.text('Museo de Arte del Río'), findsNothing);

    await tester.enterText(find.byType(TextField), 'zzzz');
    await tester.pumpAndSettle();

    expect(find.text('No se encontraron museos'), findsOneWidget);

    await tester.enterText(find.byType(TextField), '');
    await tester.pumpAndSettle();

    await tester.tap(find.text('https://museodelrio.example'));
    await tester.pump();
    expect(
      find.text('Inventario de museos registrados en el sistema.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Museo de Arte del Río'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Colección de pintura y escultura moderna, con salas dedicadas al arte del siglo XX y a exposiciones temporales.',
      ),
      findsOneWidget,
    );
    expect(
      find.text('Inventario de museos registrados en el sistema.'),
      findsNothing,
    );

    await tester.tap(find.text('Museos'));
    await tester.pumpAndSettle();

    expect(
      find.text('Inventario de museos registrados en el sistema.'),
      findsOneWidget,
    );

    final gesture = await tester.startGesture(
      tester.getCenter(find.text('Museo de Arte del Río')),
      kind: PointerDeviceKind.mouse,
    );
    await gesture.moveBy(const Offset(4, 3));
    await gesture.up();
    await tester.pumpAndSettle();

    expect(find.byType(MuseumDetailPage), findsOneWidget);
  });
}
