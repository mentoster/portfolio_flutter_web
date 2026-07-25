import 'package:flutter/material.dart';

/// Displays an image with a lightweight shimmer until its first decoded frame.
///
/// The shimmer only exists while the image is unresolved. Cached images can
/// render synchronously and skip the loading state entirely.
class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    Key? key,
    required this.image,
    this.fit,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.filterQuality = FilterQuality.medium,
  })  : assetName = null,
        cacheWidth = null,
        cacheHeight = null,
        super(key: key);

  ShimmerImage.asset(
    String name, {
    Key? key,
    this.fit,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.semanticLabel,
    this.excludeFromSemantics = false,
    this.filterQuality = FilterQuality.medium,
    this.cacheWidth,
    this.cacheHeight,
  })  : assert(cacheWidth == null || cacheWidth > 0),
        assert(cacheHeight == null || cacheHeight > 0),
        assetName = name,
        image = ResizeImage.resizeIfNeeded(
          cacheWidth,
          cacheHeight,
          AssetImage(name),
        ),
        super(key: key);

  static const ValueKey<String> placeholderKey =
      ValueKey<String>('shimmer-image-placeholder');
  static const ValueKey<String> animatedHighlightKey =
      ValueKey<String>('shimmer-image-animated-highlight');
  static const ValueKey<String> fallbackKey =
      ValueKey<String>('shimmer-image-fallback');

  final ImageProvider<Object> image;
  final String? assetName;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final String? semanticLabel;
  final bool excludeFromSemantics;
  final FilterQuality filterQuality;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      filterQuality: filterQuality,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          return child;
        }

        return _ShimmerPlaceholder(
          width: width,
          height: height,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return _ImageLoadFallback(
          width: width,
          height: height,
        );
      },
    );
  }
}

class _ShimmerPlaceholder extends StatefulWidget {
  const _ShimmerPlaceholder({
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<_ShimmerPlaceholder> createState() => _ShimmerPlaceholderState();
}

class _ShimmerPlaceholderState extends State<_ShimmerPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _animationsDisabled = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final animationsDisabled =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    if (animationsDisabled == _animationsDisabled &&
        (_controller.isAnimating || animationsDisabled)) {
      return;
    }

    _animationsDisabled = animationsDisabled;
    if (_animationsDisabled) {
      _controller.stop();
      _controller.value = 0;
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor =
        isDark ? const Color(0xFF252525) : const Color(0xFFE4E7EB);
    final highlightColor =
        isDark ? const Color(0xFF3B3B3B) : const Color(0xFFF5F7F9);

    Widget buildSurface(double progress) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: baseColor,
          gradient: _animationsDisabled
              ? null
              : LinearGradient(
                  begin: Alignment(-2.0 + (4.0 * progress), 0),
                  end: Alignment(-1.0 + (4.0 * progress), 0),
                  colors: [baseColor, highlightColor, baseColor],
                  stops: const [0.0, 0.5, 1.0],
                ),
        ),
      );
    }

    final child = _animationsDisabled
        ? buildSurface(0)
        : AnimatedBuilder(
            key: ShimmerImage.animatedHighlightKey,
            animation: _controller,
            builder: (context, _) => buildSurface(_controller.value),
          );

    return SizedBox(
      key: ShimmerImage.placeholderKey,
      width: widget.width,
      height: widget.height,
      child: child,
    );
  }
}

class _ImageLoadFallback extends StatelessWidget {
  const _ImageLoadFallback({
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      key: ShimmerImage.fallbackKey,
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF252525) : const Color(0xFFE4E7EB),
        ),
        child: Center(
          child: Icon(
            Icons.broken_image_outlined,
            size: 24,
            color: isDark ? Colors.white54 : Colors.black45,
          ),
        ),
      ),
    );
  }
}
