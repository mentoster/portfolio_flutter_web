import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter_web/app/ui/global_widgets/shimmer_image.dart';

void main() {
  testWidgets('shows shimmer until the first image frame arrives',
      (tester) async {
    final provider = _ControlledImageProvider();

    await tester.pumpWidget(_testApp(ShimmerImage(image: provider)));

    expect(find.byKey(ShimmerImage.placeholderKey), findsOneWidget);
    expect(find.byKey(ShimmerImage.animatedHighlightKey), findsOneWidget);
    expect(find.byKey(ShimmerImage.fallbackKey), findsNothing);

    final image = (await tester.runAsync<ui.Image>(
      () => createTestImage(width: 8, height: 8),
    ))!;
    addTearDown(image.dispose);
    provider.complete(image);
    await tester.pump();

    expect(find.byKey(ShimmerImage.placeholderKey), findsNothing);
    expect(find.byKey(ShimmerImage.fallbackKey), findsNothing);
  });

  testWidgets('cached image skips the loading placeholder', (tester) async {
    final provider = _ControlledImageProvider();
    final image = (await tester.runAsync<ui.Image>(
      () => createTestImage(width: 8, height: 8),
    ))!;
    addTearDown(image.dispose);

    await tester.pumpWidget(_testApp(ShimmerImage(image: provider)));
    provider.complete(image);
    await tester.pump();
    expect(find.byKey(ShimmerImage.placeholderKey), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(_testApp(ShimmerImage(image: provider)));

    expect(find.byKey(ShimmerImage.placeholderKey), findsNothing);
  });

  testWidgets('image failure replaces shimmer with a static fallback',
      (tester) async {
    final provider = _ControlledImageProvider();

    await tester.pumpWidget(_testApp(ShimmerImage(image: provider)));
    expect(find.byKey(ShimmerImage.placeholderKey), findsOneWidget);

    provider.fail(StateError('test image failed'));
    await tester.pump();

    expect(find.byKey(ShimmerImage.placeholderKey), findsNothing);
    expect(find.byKey(ShimmerImage.animatedHighlightKey), findsNothing);
    expect(find.byKey(ShimmerImage.fallbackKey), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('reduced motion uses a static loading placeholder',
      (tester) async {
    final provider = _ControlledImageProvider();

    await tester.pumpWidget(
      _testApp(
        ShimmerImage(image: provider),
        disableAnimations: true,
      ),
    );

    expect(find.byKey(ShimmerImage.placeholderKey), findsOneWidget);
    expect(find.byKey(ShimmerImage.animatedHighlightKey), findsNothing);

    await tester.pump(const Duration(seconds: 2));
    expect(find.byKey(ShimmerImage.placeholderKey), findsOneWidget);
    expect(find.byKey(ShimmerImage.animatedHighlightKey), findsNothing);
  });
}

Widget _testApp(
  Widget child, {
  bool disableAnimations = false,
}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(disableAnimations: disableAnimations),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 120,
            height: 80,
            child: child,
          ),
        ),
      ),
    ),
  );
}

class _ControlledImageProvider extends ImageProvider<Object> {
  final Completer<ImageInfo> _completer = Completer<ImageInfo>.sync();

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<Object>(this);
  }

  @override
  ImageStreamCompleter loadImage(Object key, ImageDecoderCallback decode) {
    return OneFrameImageStreamCompleter(_completer.future);
  }

  void complete(ui.Image image) {
    _completer.complete(ImageInfo(image: image));
  }

  void fail(Object error) {
    _completer.completeError(error, StackTrace.current);
  }
}
