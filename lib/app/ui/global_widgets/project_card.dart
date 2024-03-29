import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../data/enums/technology.dart';
import '../../data/models/project.dart';
import '../../routes/app_pages.dart';
import '../theme/app_fonts.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {Key? key,
      required this.projectPreview,
      required this.title,
      required this.technologies,
      required this.date})
      : super(key: key);
  final ProjectPreview projectPreview;
  final String title;
  final List<Technology> technologies;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 1,
              offset: Offset(0, 0),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 24,
              offset: Offset(0, 16),
            ),
            BoxShadow(
              color: Color(0x0a000000),
              blurRadius: 32,
              offset: Offset(0, 24),
            ),
          ],
          color: Colors.white),
      height: 357,
      width: 579,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
            child: SizedBox(
              height: 357,
              width: 289.5,
              child: Image.asset(projectPreview.previewImagePath,
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                technologies.map((val) => val.toShortString()).join(" & "),
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 231,
                child: Text(
                  "$title\n",
                  style: heading2,
                  softWrap: true,
                ),
              ),
              Link(
                uri: Uri.parse(Routes.PROJECTS + "/" + title.toLowerCase()),
                builder: (BuildContext context, FollowLink? followLink) =>
                    TextButton(
                  onPressed: followLink,
                  child: Row(
                    children: [
                      Text(
                        "Подробнее",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
