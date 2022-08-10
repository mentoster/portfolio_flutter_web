import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/app/data/enums/technology.dart';
import 'package:portfolio_flutter_web/app/data/information_data/info_projects.dart';

import '../../../../global_widgets/search_widget.dart';
import '../../../../theme/app_fonts.dart';

class ProjectListTitle extends StatefulWidget {
  const ProjectListTitle({
    Key? key,
    required this.onSearch,
    required this.onTagSearch,
  }) : super(key: key);
  final Function onSearch;
  final Function onTagSearch;

  @override
  State<ProjectListTitle> createState() => _ProjectListTitleState();
}

class _ProjectListTitleState extends State<ProjectListTitle> {
  Technology? tech;
  searchTag(Technology? newTech) {
    setState(() {
      tech = newTech;
    });
    widget.onTagSearch(newTech);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 32,
          ),
          const SelectableText(
            "Проекты",
            style: heading1,
          ),
          const SizedBox(
            height: 32,
          ),
          const SelectableText(
            "Ищите нужный вам проект",
            style: usualText,
          ),
          const SizedBox(
            height: 32,
          ),
          SearchWidget(
            texts: [for (var pr in projects) pr.title],
            onChanged: widget.onSearch,
          ),
          const SizedBox(
            height: 32,
          ),
          const SelectableText(
            "Или выберите определенный тип проектов",
            style: usualText,
          ),
          const SizedBox(
            height: 32,
          ),
          Wrap(
            children: [
              TextButton(
                  onPressed: () => searchTag(null),
                  child: Text("All",
                      style: TextStyle(
                        fontSize: heading2Bold.fontSize,
                        fontWeight: heading2Bold.fontWeight,
                        decoration: tech == null
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ))),
              TextButton(
                  onPressed: () => searchTag(Technology.gamedev),
                  child: Text("Gamedev",
                      style: TextStyle(
                        fontSize: heading2Bold.fontSize,
                        fontWeight: heading2Bold.fontWeight,
                        decoration: tech == Technology.gamedev
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ))),
              TextButton(
                  onPressed: () => searchTag(Technology.unity),
                  child: Text("Unity",
                      style: TextStyle(
                        fontSize: heading2Bold.fontSize,
                        fontWeight: heading2Bold.fontWeight,
                        decoration: tech == Technology.unity
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ))),
              TextButton(
                  onPressed: () => searchTag(Technology.flutter),
                  child: Text("Flutter",
                      style: TextStyle(
                        fontSize: heading2Bold.fontSize,
                        fontWeight: heading2Bold.fontWeight,
                        decoration: tech == Technology.flutter
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ))),
              TextButton(
                  onPressed: () => searchTag(Technology.design),
                  child: Text("UI/UX Design",
                      style: TextStyle(
                        fontSize: heading2Bold.fontSize,
                        fontWeight: heading2Bold.fontWeight,
                        decoration: tech == Technology.design
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ))),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
