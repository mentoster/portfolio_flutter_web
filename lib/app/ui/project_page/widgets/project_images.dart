import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/enums/technology.dart';

import '../../../data/models/project.dart';
import '../../global_widgets/shimmer_image.dart';
import '../../theme/app_constants.dart';
import '../../theme/app_fonts.dart';
import '../../theme/responsive.dart';

class ProjectImages extends StatefulWidget {
  ProjectImages({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  State<ProjectImages> createState() => _ProjectImagesState();
}

class _ProjectImagesState extends State<ProjectImages> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final compact = ResponsiveLayout.isCompact(viewportWidth);

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : viewportWidth;
        final carouselWidth = availableWidth.clamp(0.0, 600.0).toDouble();
        final titleStyle = compact
            ? responsiveHeading1(viewportWidth).copyWith(color: Colors.white)
            : TextStyle(
                fontWeight: heading1.fontWeight,
                color: Colors.white,
                fontSize: heading1.fontSize! * 1.5,
              );
        final techStyle = compact
            ? responsiveHeading2(viewportWidth).copyWith(
                color: Colors.white.withOpacity(0.87),
              )
            : TextStyle(
                fontWeight: heading2.fontWeight,
                color: Colors.white.withOpacity(0.87),
                fontSize: heading2.fontSize,
              );

        return SizedBox(
          key: Key(compact ? 'project-images-compact' : 'project-images-desktop'),
          width: compact ? double.infinity : 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(widget.project.title, style: titleStyle),
              const SizedBox(height: 8),
              SelectableText(
                widget.project.technologies
                    .map((val) => val.toShortString())
                    .join(' & '),
                style: techStyle,
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: carouselWidth,
                height: carouselWidth / 1.61803398874989,
                child: CarouselSlider(
                  carouselController: widget._controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (i, reason) => setState(() => _current = i),
                  ),
                  items: widget.project.page.images.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: carouselWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: ShimmerImage.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: defaultPadding),
              SizedBox(
                width: carouselWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.project.page.images.length; i++)
                      InkWell(
                        key: Key('project-image-indicator-$i'),
                        onTap: () => widget._controller.animateToPage(i),
                        child: Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == i
                                ? Colors.white
                                : const Color.fromARGB(128, 255, 255, 255),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
