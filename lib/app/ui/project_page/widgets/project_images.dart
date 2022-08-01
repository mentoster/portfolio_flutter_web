import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/enums/technology.dart';

import '../../../data/models/project.dart';
import '../../theme/app_constants.dart';
import '../../theme/app_fonts.dart';

class ProjectImages extends StatefulWidget {
  ProjectImages({
    Key? key,
    required this.project,
    required this.size,
  }) : super(key: key);

  final Project project;
  final Size size;

  final CarouselController _controller = CarouselController();
  @override
  State<ProjectImages> createState() => _ProjectImagesState();
}

class _ProjectImagesState extends State<ProjectImages> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectableText(
          widget.project.title,
          style: TextStyle(
              fontWeight: heading1.fontWeight,
              color: Colors.white,
              fontSize: heading1.fontSize! * 1.5),
        ),
        SelectableText(
          widget.project.technologies
              .map((val) => val.toShortString())
              .join(" & "),
          style: TextStyle(
              fontWeight: heading2.fontWeight,
              color: Colors.white.withOpacity(0.87),
              fontSize: heading2.fontSize!),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        SizedBox(
          width: 600,
          height: 600 / 1.61803398874989,
          child: CarouselSlider(
            carouselController: widget._controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (i, reason) {
                  setState(() {
                    _current = i;
                  });
                }),
            items: widget.project.page.images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: widget.size.width,
                      height: widget.size.height,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        SizedBox(
          width: 600,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.project.page.images.length; i++)
                  InkWell(
                    onTap: () => widget._controller.animateToPage(i),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == i
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(128, 255, 255, 255)),
                    ),
                  )
              ]),
        ),
      ],
    );
  }
}
