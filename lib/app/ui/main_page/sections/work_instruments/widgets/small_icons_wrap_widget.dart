import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../theme/responsive.dart';
import 'small_circle_icon.dart';

class SmallIconsWrapWidget extends StatefulWidget {
  const SmallIconsWrapWidget({
    Key? key,
    this.assetBundle,
  }) : super(key: key);

  final AssetBundle? assetBundle;

  @override
  State<SmallIconsWrapWidget> createState() => _SmallIconsWrapWidgetState();
}

class _SmallIconsWrapWidgetState extends State<SmallIconsWrapWidget> {
  static const _iconsPath = 'assets/icons/instruments/others/';
  static const _placeholderCount = 29;

  late Future<List<String>> _imagesFuture;

  @override
  void initState() {
    super.initState();
    _imagesFuture = _initImages();
  }

  @override
  void didUpdateWidget(covariant SmallIconsWrapWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetBundle != widget.assetBundle) {
      _imagesFuture = _initImages();
    }
  }

  Future<List<String>> _initImages() async {
    final manifest = await AssetManifest.loadFromAssetBundle(
      widget.assetBundle ?? rootBundle,
    );

    return manifest
        .listAssets()
        .where((String key) => key.startsWith(_iconsPath))
        .where((String key) => key.endsWith('.svg'))
        .toList()
      ..sort();
  }

  Widget _grid(BuildContext context, List<Widget> children, {Key? key}) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final columns = ResponsiveLayout.isDesktop(viewportWidth)
            ? 10
            : ResponsiveLayout.isTablet(viewportWidth)
                ? 6
                : availableWidth < 340
                    ? 3
                    : 4;
        final spacing = ResponsiveLayout.isDesktop(viewportWidth)
            ? 24.0
            : ResponsiveLayout.isTablet(viewportWidth)
                ? 18.0
                : 12.0;
        final itemWidth =
            (availableWidth - (spacing * (columns - 1))) / columns;

        return Wrap(
          key: key,
          spacing: spacing,
          runSpacing: 20,
          children: [
            for (final child in children)
              SizedBox(
                width: itemWidth,
                child: child,
              ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _imagesFuture,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return _grid(
            context,
            [
              for (final path in snapshot.data!)
                SmallCircleIcon(
                  iconPath: path,
                  title: path
                      .split('/')
                      .last
                      .replaceAll('.svg', '')
                      .replaceAll('_', ' '),
                ),
            ],
            key: const Key('small-icons-grid'),
          );
        }

        if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: SelectableText(
                    'Error: ${snapshot.error}, cant load icons',
                  ),
                ),
              ],
            ),
          );
        }

        return _grid(
          context,
          List<Widget>.generate(
            _placeholderCount,
            (_) => const _SmallIconPlaceholder(),
          ),
          key: const Key('small-icons-loading-grid'),
        );
      },
    );
  }
}

class _SmallIconPlaceholder extends StatelessWidget {
  const _SmallIconPlaceholder();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF252525)
        : const Color(0xFFE4E7EB);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(height: 8),
        Container(
          width: 52,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ],
    );
  }
}
