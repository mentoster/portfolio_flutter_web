import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter_web/app/data/models/papers.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/shimmer_image.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/certificates/widgets/certificate_widget.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/diplomas/widgets/diploma_diploma_widget.dart';

void main() {
  testWidgets('diploma keeps cover fit and bounded decode width', (tester) async {
    _setLargeSurface(tester);

    final diploma = Diploma(
      title: 'Test diploma',
      shortDescription: 'Test description',
      tags: const [],
      image: 'assets/images/rocket.png',
    );

    await tester.pumpWidget(_testApp(DiplomaPct(diploma: diploma)));

    final shimmer = tester.widget<ShimmerImage>(find.byType(ShimmerImage));
    expect(shimmer.assetName, diploma.image);
    expect(shimmer.fit, BoxFit.cover);
    expect(shimmer.cacheWidth, 1200);
    expect(shimmer.cacheHeight, isNull);
  });

  testWidgets('certificate keeps fill fit and bounded decode width',
      (tester) async {
    _setLargeSurface(tester);

    final certificate = Certificate(
      title: 'Test certificate',
      description: 'Test description',
      link: 'https://example.com',
      image: 'assets/images/rocket.png',
    );

    await tester.pumpWidget(
      _testApp(CertificatePct(certificate: certificate)),
    );

    final shimmer = tester.widget<ShimmerImage>(find.byType(ShimmerImage));
    expect(shimmer.assetName, certificate.image);
    expect(shimmer.fit, BoxFit.fill);
    expect(shimmer.cacheWidth, 1500);
    expect(shimmer.cacheHeight, isNull);
  });

  testWidgets('missing paper asset ends in fallback instead of shimmer',
      (tester) async {
    await tester.pumpWidget(
      _testApp(
        ShimmerImage.asset(
          'assets/images/papers/definitely-missing-paper.png',
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byKey(ShimmerImage.placeholderKey), findsNothing);
    expect(find.byKey(ShimmerImage.fallbackKey), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

Widget _testApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: Center(child: child),
    ),
  );
}

void _setLargeSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(1400, 1000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}
