import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_flutter_web/main.dart';

void main() {
  testWidgets('portfolio home page renders', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.text('Mentoster'), findsOneWidget);
    expect(find.text('Главная'), findsOneWidget);
    expect(find.text('Все Проекты'), findsOneWidget);
  });
}
