import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter_web/app/ui/main_page/sections/work_instruments/widgets/small_icons_wrap_widget.dart';

class _DelayedAssetBundle extends CachingAssetBundle {
  final Completer<void> gate = Completer<void>();

  @override
  Future<ByteData> load(String key) async {
    await gate.future;
    return rootBundle.load(key);
  }
}

class _ThrowingAssetBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) {
    throw FlutterError('manifest unavailable');
  }
}

void main() {
  testWidgets('loads instrument icons from the current Flutter asset manifest',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SmallIconsWrapWidget(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Bash'), findsOneWidget);
    expect(find.textContaining('cant load icons'), findsNothing);
  });

  testWidgets('reserves the mobile icon grid while the manifest loads',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(754, 1178);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final bundle = _DelayedAssetBundle();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SmallIconsWrapWidget(assetBundle: bundle),
          ),
        ),
      ),
    );
    await tester.pump();

    final loadingGrid = find.byKey(const Key('small-icons-loading-grid'));
    expect(loadingGrid, findsOneWidget);
    final loadingHeight = tester.getSize(loadingGrid).height;
    expect(loadingHeight, greaterThan(700));

    bundle.gate.complete();
    await tester.pumpAndSettle();

    final loadedGrid = find.byKey(const Key('small-icons-grid'));
    expect(loadedGrid, findsOneWidget);
    expect(
      (tester.getSize(loadedGrid).height - loadingHeight).abs(),
      lessThan(180),
    );
  });

  testWidgets('shows a readable error when the manifest cannot load',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SmallIconsWrapWidget(assetBundle: _ThrowingAssetBundle()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('cant load icons'), findsOneWidget);
    expect(find.byIcon(Icons.error_outline), findsOneWidget);
  });
}
